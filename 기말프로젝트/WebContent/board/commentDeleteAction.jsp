<%@page import="com.park.comment.CommentDAO"%>
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
CommentDAO commentdao = new CommentDAO();
commentdao.deleteComment(Integer.parseInt(request.getParameter("no")));
PrintWriter ot = response.getWriter();
ot.println("<script>");
ot.println("window.location = document.referrer");
ot.println("</script>");
%>
</body>
</html>