<%@page import="java.io.PrintWriter"%>
<%@page import="com.park.comment.CommentDAO"%>
<%@page import="com.park.comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="comment" class="com.park.comment.CommentDTO" scope="page"/>
<jsp:setProperty property="content" name="comment"/>
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
	ot.println("alert('로그인이 필요한 기능입니다')");
	ot.println("history.back()");
	ot.println("</script>");
}
if(comment.getContent()==null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('내용을 입력해주세요')");
	ot.println("history.back()");
	ot.println("</script>");
}
else{
	CommentDAO commentdao = new CommentDAO();
	comment.setUserID(id);
	comment.setBoardID(Integer.parseInt(request.getParameter("boardID")));
	commentdao.writeComment(comment);
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("window.location = document.referrer");
	ot.println("</script>");
}

%>
</body>
</html>