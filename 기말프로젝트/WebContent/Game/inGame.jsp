<%@page import="java.util.List"%>
<%@ page import="user.UserDTO" %>
<%@page import="user.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="newGame.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="mainpage">
		<div id="leftmain">
			<iframe id="paint" src="paint.html" width="800px" height="450px" frameborder="0" scrolling="no">none</iframe>
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
				List<UserDTO> list = userdao.getPointList();
				pageContext.setAttribute("list", list);
				%>
					<c:forEach var="elem" items="${list}" varStatus="status">
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