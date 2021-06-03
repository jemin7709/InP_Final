<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.UserDTO"/>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		if(user.getId() == null || user.getPw() == null || user.getName() == null){
			PrintWriter ot = response.getWriter();
			ot.println("<script>");
			ot.println("alert('모든 항목을 입력해 주세요')");
			ot.println("history.back()");
			ot.println("</script>");
		}
		else{
			UserDAO userdao = new UserDAO();
			int result = userdao.create_account(user);
			if(result == -1){
				PrintWriter ot = response.getWriter();
				ot.println("<script>");
				ot.println("alert('이미 존재하는 아이디입니다')");
				ot.println("history.back()");
				ot.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				session.setAttribute("id", user.getId());
				script.println("<script>");
				script.println("location.href='accountCreate.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>