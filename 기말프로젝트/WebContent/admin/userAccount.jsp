<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO" %>
<%@page import="user.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 페이지</title>
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
	ot.println("location.href = 'main.jsp'");
	ot.println("</script>");
}
if(!id.equals("ADMIN")){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('관리자만 설정이 가능합니다')");
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}


UserDTO u = new UserDAO().getUser(request.getParameter("userID"));
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
	<table id="mypage" style="text-align: center; border: 1px solid #dddddd">
		<tbody>
			<tr>
				<td>아이디</td>
				<td>${u.getId()}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${u.getName()}</td>
			</tr>
			<tr>
				<td>점수</td>
				<td>${u.getPoint()}</td>
			</tr>
		</tbody>
	</table>
	<button onclick="location.href = document.referrer">뒤로가기</button>
	<button onclick="location.href = 'updateAccount.jsp?userID=${u.getId()}'">정보 수정</button>
	</div>
</body>
</html>