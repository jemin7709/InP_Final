<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = null;
String pw = null;
String link = "";
UserDTO userdto = new UserDTO();
UserDAO userdao = new UserDAO();
if(request.getParameter("leftID") != null){
	id = (String)request.getParameter("leftID");
	userdto = userdao.getUser(id);
	if(userdto == null){
		link = "location.href = 'findPW.jsp?PW=NULL'";
	}
	else{
		link = "location.href = 'findPW.jsp?PW="+userdto.getPw()+"'";
	}
	
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println(link);
	ot.println("</script>");
}
if(request.getParameter("leftPW") != null){
	pw = (String)request.getParameter("leftPW");
	userdto = userdao.getPwUser(pw);
	if(userdto == null){
		link = "location.href = 'findID.jsp?ID=NULL'";
	}
	else{
		link = "location.href = 'findID.jsp?ID="+userdto.getId()+"'";
	}
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println(link);
	ot.println("</script>");
}
%>
</body>
</html>