<%@page import="java.util.Collections"%>
<%@page import="javafx.print.Collation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="user.UserDTO" %>
<%@page import="user.UserDAO"%>
<%@page import="com.park.chat.ChatDAO"%>
<%@page import="com.park.chat.ChatDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="main.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
String title = request.getParameter("title");
String id = null;
int score = -1;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
%>
	<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
	<div id="mainpage">
		<div id="mainleft">
			<table id="chat" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
				<%
				ChatDAO chatdao = new ChatDAO();
				List<ChatDTO> listchat = chatdao.getChatList();
				Collections.reverse(listchat);
				if(listchat != null){
				pageContext.setAttribute("listchat", listchat);
				%>
					<c:forEach var="elem" items="${listchat}" varStatus="status">
					<tr>
						<td>${elem.getUserID()} :</td>
						<td>${elem.getText()}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<%} %>
			<%
			if(id!=null){
			%>
			<form id="form" action="addChat.jsp" method="post">
				<input type="text" name="chat">
				<input type="submit">
			</form>
			<%
			}
			%>
		</div>
		<div id="mainright">
			<table id="pointlist" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">점수</th>
					</tr>
				</thead>
				<tbody>
				<%
				UserDAO userdao = new UserDAO();
				List<UserDTO> listpoint = userdao.getPointList();
				pageContext.setAttribute("listpoint", listpoint);
				%>
					<c:forEach var="elem" items="${listpoint}" varStatus="status">
					<tr>
						<td>${elem.getId()}</td>
						<td>${elem.getPoint()}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>