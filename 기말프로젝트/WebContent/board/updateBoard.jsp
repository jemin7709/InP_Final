<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
int pageNum=0;
if(request.getParameter("pageNum")!=null){
	pageNum =Integer.parseInt(request.getParameter("pageNum"));
}

String id = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
if(id==null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('로그인이 필요한 서비스입니다')");
	ot.println("location.href = 'board.jsp'");
	ot.println("</script>");
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

BoardDTO b = new BoardDAO().getBoard(boardID);
if(!id.equals(b.getUserID())){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('본인만 수정이 가능합니다')");
	ot.println("location.href = 'board.jsp'");
	ot.println("</script>");
}
%>
	<div id="mainpage">
	<form method="post" action="updateBoardAction.jsp?boardID=<%=boardID%>">
				<table id="writetable" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="content" placeholder="글 제목" name="boardTitle" maxlength="50" style="height: 20px;" value="<%=b.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="content" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 340px;"><%=b.getBoardContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" id="submit" value="글쓰기">
			</form>
			<button onclick="history.back()">취소</button>
	</div>
</body>
</html>