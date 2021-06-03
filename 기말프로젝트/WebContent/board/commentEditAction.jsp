<%@page import="com.park.comment.CommentDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.park.comment.CommentDAO"%>
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
CommentDAO commentdao = new CommentDAO();
CommentDTO comment = new CommentDTO();
comment.setNo(Integer.parseInt(request.getParameter("no")));
comment.setContent(request.getParameter("content"));
int result = commentdao.updateComment(comment);
if(result == -1){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('수정에 실패했습니다')");
	ot.println("window.close()");
	ot.println("</script>");
}
else{
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("window.close()");
	ot.println("window.opener.document.location.href=window.opener.document.URL");
	ot.println("</script>");
}
%>
</body>
</html>