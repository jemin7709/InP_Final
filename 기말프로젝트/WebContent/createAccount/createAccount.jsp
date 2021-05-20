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
	<div id="mainpage">
		<h2>사용할 ID와 PW, 닉네임을 입력해 주세요</h2>
		<form id="create_Account_Form" method="post" action="createAccount_Check.jsp">
			<input type="text" id="ID" name="ID" placeholder="ID"><br>
			<input type="text" id="PW" name="PW" placeholder="PW"><br>
			<input type="text" id="NICKNAME" name="NICKNAME" placeholder="닉네임"><br> 
			<input class="button" type="submit" value="확인">
			<input class="button" type="reset" value="취소">
		</form>
	</div>
</body>
</html>