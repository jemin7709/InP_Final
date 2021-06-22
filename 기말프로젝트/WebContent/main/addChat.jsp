<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.park.chat.ChatDAO"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = null;
String text = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
text = (String)request.getParameter("chat");
ChatDAO chatdao = new ChatDAO();
chatdao.addChat(id, text);
PrintWriter print = response.getWriter();
print.println("<script>");
print.println("location.href= 'main.jsp'");
print.println("</script>");
%>
</body>
</html>