<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
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
if(!id.equals("ADMIN")){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('관리자만 삭제가 가능합니다')");
	ot.println("location.href = 'board.jsp'");
	ot.println("</script>");
}
else{
	BoardDAO boarddao = new BoardDAO();
	int result = boarddao.deleteBoard(boardID);
	if(result == -1){
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("alert('삭제에 실패했습니다')");
		ot.println("history.back()");
		ot.println("</script>");
	}
	else{
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("location.href='boardManager.jsp'");
		ot.println("</script>");
	}
}
%>
</body>
</html>