<%@page import="java.util.List"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
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
<link href="board.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
int pageNum = 1;
if(request.getParameter("pageNum")!=null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
String id = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
%>
	<div id="mainpage">
		<table id="board" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
				BoardDAO boarddao = new BoardDAO();
				List<BoardDTO> list = boarddao.getBoardList(pageNum);
				pageContext.setAttribute("list", list);
				%>
					<c:forEach var="elem" items="${list}" varStatus="status">
					<tr>
						<td><a href="read.jsp?boardID=${elem.getBoardID()}">${elem.getBoardTitle()}</a></td>
						<td>${elem.getUserID()}</td>
						<td>${elem.getBoardDate().substring(0,10)}</td>
						<td>${elem.getViewCount()}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<%
			if(pageNum!=1){
			%>
			<button id="prev" onclick="location.href='board.jsp?pageNum=<%=pageNum-1%>'">이전</button>
			<%
			}
			if(boarddao.nextPage(pageNum+1)){
			%>
			<button id="next" onclick="location.href='board.jsp?pageNum=<%=pageNum+1%>'">다음</button>
			<%
			}
			%>
			<%
			if(id != null){
			%>
		<button id="write" onclick="location='write.jsp'">새글작성</button>
		<%
			}
		%>
	</div>
</body>
</html>