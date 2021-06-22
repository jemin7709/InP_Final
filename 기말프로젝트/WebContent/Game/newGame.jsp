<%@ page import="java.io.PrintWriter" %>
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
<title>메인 페이지</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="newGame.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="mainpage">
		<div id="mainleft">
			<%	
				String id = null;
				int score = -1;
				if(session.getAttribute("id")!=null){
					id = (String)session.getAttribute("id");
				}
				if(request.getParameter("score")!=null){
					score = Integer.parseInt(request.getParameter("score"));
				}
				if(score != -1){
					if(id!=null){
					UserDAO userdao = new UserDAO();
					userdao.updateScore(score, id);
					}
					pageContext.setAttribute("score", score);
					%>
						<br><br><br><br><br><br>
						<h2>
							점수 : ${score}
						</h2>
						<br>
					<%
				}
				else{
					%>
						<br><br><br><br><br><br>
						<h2>
							게임을 시작하시겠습니까?
						</h2>
						<br>
					<%
				}
			%>
			<button id="start" onclick="mv();">게임 시작</button>
			<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
			<script type="text/javascript">
			function mv() {
				location.href = "inGame.jsp";
			}
			</script>
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