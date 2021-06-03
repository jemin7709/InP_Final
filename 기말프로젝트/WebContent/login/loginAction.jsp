<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
UserDAO userdao = new UserDAO();
int result = userdao.login(user.getId(), user.getPw());
if(result == 1){
	session.setAttribute("id", user.getId());
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("parent.document.location.reload()");
	ot.println("</script>");
}
else if(result == 0){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('비밀번호가 틀립니다')");
	ot.println("history.back()");
	ot.println("</script>");
}
else if(result == -1){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('존재하지 않는 아이디입니다')");
	ot.println("history.back()");
	ot.println("</script>");
}

%>
</body>
</html>