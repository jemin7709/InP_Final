<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="createAccount.css" type="text/css" rel="stylesheet">
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
		<div id="divcreateAcount">
		<h2>사용할 ID와 PW, 닉네임을 입력해 주세요</h2>
		<h2>각 항목은 영어, 한글만 입력이 가능합니다</h2>
		<form id="create_Account_Form" method="post" action="createAccountAction.jsp">
			<input type="text" id="id" name="id" placeholder="ID" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"><br>
			<input type="text" id="pw" name="pw" placeholder="PW" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"><br>
			<input type="text" id="name" name="name" placeholder="닉네임" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"><br> 
			<input class="button" type="submit" value="확인">
			<input class="button" type="reset" value="취소">
		</form>
		</div>
	</div>
</body>
</html>