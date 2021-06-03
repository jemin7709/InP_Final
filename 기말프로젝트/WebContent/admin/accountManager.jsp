<%@page import="com.park.admin.AdminDAO"%>
<%@page import="java.util.List"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="admin.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
int pageNum = 1;
if(request.getParameter("pageNum")!=null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
%>
	<div id="mainpage">
		<table id="userboard" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">ID</th>
						<th style="background-color: #eeeeee; text-align: center;">PW</th>
						<th style="background-color: #eeeeee; text-align: center;">NAME</th>
						<th style="background-color: #eeeeee; text-align: center;">POINT</th>
					</tr>
				</thead>
				<tbody>
				<%
				AdminDAO admindao = new AdminDAO();
				List<UserDTO> list = admindao.getUserList(pageNum);
				pageContext.setAttribute("list", list);
				%>
					<c:forEach var="elem" items="${list}" varStatus="status">
					<tr>
						<td><a href="userAccount.jsp?userID=${elem.getId()}">${elem.getId()}</a></td>
						<td>${elem.getName()}</td>
						<td>${elem.getPw()}</td>
						<td>${elem.getPoint()}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<%
			if(pageNum!=1){
			%>
			<button onclick="location.href='accountManager.jsp?pageNum=<%=pageNum-1%>'">이전</button>
			<%
			}
			if(admindao.nextUserPage(pageNum+1)){
			%>
			<button onclick="location.href='accountManager.jsp?pageNum=<%=pageNum+1%>'">다음</button>
			<%
			}
			%>
			<button onclick="location.href='adminMain.jsp'">관리자 페이지</button>
	</div>
</body>
</html>