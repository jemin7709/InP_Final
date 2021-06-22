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


UserDTO u = new UserDAO().getUser(request.getParameter("userID"));
if(u==null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('null!')");
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}
pageContext.setAttribute("u", u);
%>
	<div id="mainpage">
	<form action="updateAccountAction.jsp" method="post">
	<table id="mypage" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2">모든 항목을 입력해 주세요(변경을 원하지 않아도 본인 확인을 위해 다시 입력)</th>
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
			<tr>
				<td>점수</td>
				<td><input type="text" id="point" name="point" placeholder="${u.getPoint()}" value="${u.getPoint()}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
			</tr>
		</tbody>
	</table>
	<button type="button" onclick="location.href = 'accountManager.jsp'">뒤로가기</button>
	<button onclick="location.href = 'updateAccountAction.jsp'">정보 수정</button>
	<button type="button" onclick="if(confirm('삭제하시겠습니까?')){location.href='deleteAccountAction.jsp?delid=' + '${u.getId()}'}">회원 삭제</button>
	</form>

	</div>
</body>
</html>