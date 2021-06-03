<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../initialcss/initialmain.css" type="text/css" rel="stylesheet">
<link href="board.css" type="text/css" rel="stylesheet">
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
	ot.println("location.href = 'board.jsp'");
	ot.println("</script>");
}
%>
	<div id="mainpage">
	<form method="post" action="writeAction.jsp">
				<table id="writetable" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="content" placeholder="글 제목" name="boardTitle" maxlength="50" style="height: 20px;"></td>
						</tr>
						<tr>
							<td><textarea class="content" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 340px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" id="submit" value="글쓰기">
			</form>
	</div>
</body>
</html>