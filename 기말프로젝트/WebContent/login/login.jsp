<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="login.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
String id = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
if(id!=null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('이미 로그인되어 있습니다')");
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}
%>
	<div id="mainpage">
		<div id="divlogin">
		<h2>로그인</h2>
		<form id="login" method="post" action="loginAction.jsp">
			<input type="text" id="id" name="id" placeholder="ID"><br>
			<input type="text" id="pw" name="pw" placeholder="PW"><br>
			<input id="submit" type="submit" value="로그인">
			<br>
		</form>
		</div>
		<button onclick="location='findID.jsp'">ID 찾기</button>
		<button onclick="location='findPW.jsp'">PW 찾기</button>
	</div>
</body>
</html>