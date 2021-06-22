<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PW찾기 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="login.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
String pw = null;
if(request.getParameter("PW") != null){
	pw = (String)request.getParameter("PW");
}
if(pw!= null && pw.equals("NULL")){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('존재하지 않는 비밀번호입니다')");
	ot.println("</script>");
	pw = null;
}
pageContext.setAttribute("pw", pw);
%>
	<div id="mainpage" style="background-color: #90c695;">
		<div id="mainleft">
			<br><br><br><br>
			<h2>찾을 PW의 ID를 입력해주세요</h2>
			<form id="findPW" method="post" action="findIDAndPW.jsp">
				<input type="text" id="leftID" name="leftID" placeholder="ID">
				<button class="leftsubmit">확인</button> <br>
			</form>
			<input class="find" type="text" name="leftPW" placeholder="찾으시는 PW는" value="${pw}">
		</div>
		<div id="mainright">
			<br><br><br><br><br>
			<form id="login" method="post" action="loginAction.jsp">
				<input type="text" id="id" name="id" placeholder="ID"><br>
				<input type="text" id="pw" name="pw" placeholder="PW"><br>
				<input id="submit" type="submit" value="로그인">
				<br>
			</form>
			<button onclick="location='findID.jsp'">ID 찾기</button>
			<button onclick="location='findPW.jsp'">PW 찾기</button>
		</div>
	</div>
</body>
</html>