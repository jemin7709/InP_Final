<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty property="*" name="user"/>
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

if(user.getId()==null||user.getName()==null||user.getPw()==null||
request.getParameter("id").equals("")||request.getParameter("name").equals("")||request.getParameter("pw").equals("")||request.getParameter("point").equals("")){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('모든 항목을 입력해 주세요')");
	ot.println("history.back()");
	ot.println("</script>");
}
else{
	UserDAO userdao = new UserDAO();
	int result = userdao.updateAccount(user);
	if(result == -1){
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("alert('수정에 실패했습니다')");
		ot.println("history.back()");
		ot.println("</script>");
	}
	else{
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("location.href = 'accountManager.jsp'");
		ot.println("</script>");
	}
}
%>
</body>
</html>