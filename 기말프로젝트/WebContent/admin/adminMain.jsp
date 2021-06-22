<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="admin.css" type="text/css" rel="stylesheet">
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
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}
if(!id.equals("ADMIN")){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('관리자만 설정이 가능합니다')");
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}
%>
	<div id="mainpage">
	<br><br><br><br><br><br>
		<button type="button" onclick="location.href = 'accountManager.jsp'">회원 관리</button>
		<button type="button" onclick="location.href='../board/board.jsp'">게시판 관리</button>
	</div>
</body>
</html>