<%@page import="java.io.PrintWriter"%>
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
	ot.println("window.close()");
	ot.println("</script>");
}
%>
<form action="commentEditAction.jsp" method="get">
<input type="text" id="content" name="content" value="<%=request.getParameter("content") %>">
<input type="hidden" name="no" value="<%=request.getParameter("no") %>">
<input type="submit" id="submit" value="댓글 수정">
</form>
</body>
</html>