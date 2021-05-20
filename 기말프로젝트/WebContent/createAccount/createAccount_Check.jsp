<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	String id = request.getParameter("ID");
	String pw = request.getParameter("PW");
	String nickname = request.getParameter("NICKNAME");
	System.out.println(id);
	System.out.println(pw);
	System.out.println(nickname);
%>
<div id="mainpage">
<h1>회원가입이 완료되었습니다</h1>
<button onclick="parent.document.location.reload()">확인</button>
</div>
</body>
</html>