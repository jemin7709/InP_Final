<%@page import="com.park.comment.CommentDAO"%>
<%@page import="com.park.comment.CommentDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="board.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
String id = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}

int boardID = 0;
if(request.getParameter("boardID")!=null){
	boardID =Integer.parseInt(request.getParameter("boardID"));
}
if(boardID==0){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('404 Not Found')");
	ot.println("location.href = 'board.jsp'");
	ot.println("</script>");
}
BoardDAO boarddao = new BoardDAO();
boarddao.upViewCount(boardID);
BoardDTO b = new BoardDAO().getBoard(boardID);
%>
	<script type="text/javascript">
	function openEdit(no, content) {
    	window.name = "댓글 수정";
        window.open("commentEdit.jsp?no="+no+"&&content="+content,"replyForm", "width=570, height=350, resizable = no, scrollbars = no");
	}
	</script>
	<div id="mainpage">
	<form action="commentAction.jsp?boardID=<%=boardID %>" method="post">
	<table id="writetable" style="text-align: center; border: 1px solid #dddddd">
		<tbody>
			<tr>
			<td>글 제목</td>
			<td colspan="3"><%=b.getBoardTitle() %></td>
			</tr>
			<tr>
			<td>작성자</td>
			<td colspan="3"><%=b.getUserID() %></td>
			</tr>
			<tr>
			<td>작성일</td>
			<td colspan="3"><%=b.getBoardDate().substring(0,10) %></td>
			</tr>
			<tr>
			<td>본문</td>
			<td colspan="3"><%=b.getBoardContent() %></td>
			</tr>
			<tr>
			<%	
				CommentDAO commentdao = new CommentDAO();
				List<CommentDTO> commentlist = commentdao.getCommentList(boardID);
				pageContext.setAttribute("commentlist", commentlist);
				%>
					<c:forEach var="elem" items="${commentlist}" varStatus="status">
					<c:set var="ID" value="${elem.getUserID()}"/>
					<tr>
						<td>${elem.getUserID()}</td>
						<td>${elem.getContent()}</td>
						<td>${elem.getDate().substring(0,10)}</td>
						<%
						if(id!=null && id.equals(pageContext.getAttribute("ID"))){
						%>
						<td><button type="button" onclick="if(confirm('삭제하시겠습니까?')){location.href='commentDeleteAction.jsp?no=${elem.getNo()}';}">삭제</button>
						<button type="button" onclick="openEdit('${elem.getNo()}', '${elem.getContent()}')">수정</button></td>
						<%
						}
						%>
					</tr>
					</c:forEach>
			</tr>
			<tr>
			<td colspan="2"><input type="text" id="content" name="content"></td>
			<td><input type="submit" id="submit" value="댓글 작성"></td>
			</tr>
		</tbody>
	</table>
	</form>
	<button onclick="location.href = 'board.jsp'">목록으로</button>
	<%
	if(id!=null&&id.equals(b.getUserID())){
	%>
	<button onclick="location.href='updateBoard.jsp?boardID=<%=boardID%>'">수정</button>
	<button onclick="if(confirm('삭제하시겠습니까?')){location.href='deleteBoardAction.jsp?boardID=<%=boardID%>';}">삭제</button>
	<%	
	}
	%>
	</div>
</body>
</html>