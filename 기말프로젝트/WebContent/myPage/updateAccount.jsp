<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO" %>
<%@page import="user.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="myPage.css" type="text/css" rel="stylesheet">
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
	ot.println("location.href = 'main.jsp'");
	ot.println("</script>");
}

UserDTO u = new UserDAO().getUser(id);
if(u==null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('null!')");
	ot.println("location.href = 'main.jsp'");
	ot.println("</script>");
}
pageContext.setAttribute("u", u);
%>
	<div id="mainpage">
	<form action="updateAccountAction.jsp" method="post">
	<table id="mypage" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align: center;">모든 항목을 입력해주세요</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" placeholder="${u.getId()}" value="${u.getId()}" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" id="name" name="name" placeholder="${u.getName()}" value="${u.getName()}" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" id="pw" name="pw" placeholder="${u.getPw()}" value="${u.getPw()}" onKeyup="this.value=this.value.replace(/[^ㄱ-힣a-zA-Z]/g,'');"></td>
			</tr>
		</tbody>
	</table>
	<button type="button" onclick="location.href = '../main/main.jsp'">뒤로가기</button>
	<input type="submit" value="정보 수정">
	<button type="button" onclick="if(confirm('삭제하시겠습니까?')){location.href='deleteAccountAction.jsp'}">회원 탈퇴</button>
	</form>

	</div>
</body>
</html>