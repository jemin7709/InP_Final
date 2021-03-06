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
	boardID = Integer.parseInt(request.getParameter("boardID"));
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
    	window.name = "λκΈ μμ ";
        window.open("commentEdit.jsp?no="+no+"&&content="+content,"replyForm", "width=570, height=350, resizable = no, scrollbars = no");
	}
	</script>
	<div id="mainpage">
	<form action="commentAction.jsp?boardID=<%=boardID %>" method="post">
	<table id="writetable" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="10" style="background-color: #eeeeee; text-align: center;"><%=b.getBoardTitle() %></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="9">&nbsp;</td>
				<td colspan="1"><%=b.getBoardDate().substring(0,10) %></td>
				
			</tr>
			<tr>
				<td colspan="9">&nbsp;</td>
				<td colspan="1"><%=b.getUserID() %></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="10"><%=b.getBoardContent() %></td>
			</tr>
			<tr>
			</tr>
			<tr style="border: 1px solid black">
			<%	
				CommentDAO commentdao = new CommentDAO();
				List<CommentDTO> commentlist = commentdao.getCommentList(boardID);
				pageContext.setAttribute("commentlist", commentlist);
				%>
					<c:forEach var="elem" items="${commentlist}" varStatus="status">
					<c:set var="ID" value="${elem.getUserID()}"/>
					<tr>
						<td colspan="2">${elem.getUserID()}</td>
						<%
						if(id!=null &&(id.equals(pageContext.getAttribute("ID"))||id.equals("ADMIN"))){
						%>
						<td colspan="8"><button type="button" onclick="if(confirm('μ­μ νμκ² μ΅λκΉ?')){location.href='commentDeleteAction.jsp?no=${elem.getNo()}';}">μ­μ </button>
						<button type="button" onclick="openEdit('${elem.getNo()}', '${elem.getContent()}')">μμ </button></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td colspan="7">${elem.getContent()}</td>
						<td colspan="3">${elem.getDate().substring(0,10)}</td>
					</tr>
					</c:forEach>
			</tr>
		</tbody>
	</table>
	<%
	if(id!=null || id.equals("ADMIN")){
	%>
	<input type="text" id="content" name="content">
	<input type="submit" id="submit" value="λκΈ μμ±">
	<%
	}
	%>
	</form>
	<button onclick="location.href = 'board.jsp'">λͺ©λ‘μΌλ‘</button>
	<%
	if(id!=null&&(id.equals(b.getUserID())||id.equals("ADMIN"))){
	%>
	<button onclick="location.href='updateBoard.jsp?boardID=<%=boardID%>'">μμ </button>
	<button onclick="if(confirm('μ­μ νμκ² μ΅λκΉ?')){location.href='deleteBoardAction.jsp?boardID=<%=boardID%>';}">μ­μ </button>
	<%	
	}
	%>
	</div>
</body>
</html>