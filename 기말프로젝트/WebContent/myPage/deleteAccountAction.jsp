<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

UserDTO user = new UserDAO().getUser(id);
if(!id.equals(user.getId())){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('본인만 삭제가 가능합니다')");
	ot.println("location.href = '../main/main.jsp'");
	ot.println("</script>");
}
else{
	UserDAO userdao = new UserDAO();
	int result = userdao.deleteAccount(id);
	if(result == -1){
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("alert('삭제에 실패했습니다')");
		ot.println("history.back()");
		ot.println("</script>");
	}
	else{
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("location.href='../main/main.jsp'");
		ot.println("parent.document.location.reload();");
		ot.println("</script>");
		session.invalidate();
	}
}
%>
</body>
</html>