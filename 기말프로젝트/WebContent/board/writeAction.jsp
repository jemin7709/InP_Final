<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="board" class="board.BoardDTO" scope="page"/>
<jsp:setProperty property="boardTitle" name="board"/>
<jsp:setProperty property="boardContent" name="board"/>
</head>
<body>
<%
String id = null;
if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
if(board.getBoardTitle()==null||board.getBoardContent()==null){
	PrintWriter ot = response.getWriter();
	ot.println("<script>");
	ot.println("alert('모든 항목을 입력해 주세요')");
	ot.println("history.back()");
	ot.println("</script>");
}
else{
	BoardDAO boarddao = new BoardDAO();
	board.setUserID(id);
	int result = boarddao.wirte(board);
	if(result == -1){
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("alert('작성에 실패했습니다')");
		ot.println("history.back()");
		ot.println("</script>");
	}
	else{
		PrintWriter ot = response.getWriter();
		ot.println("<script>");
		ot.println("location.href = 'board.jsp'");
		ot.println("</script>");
	}
}

%>
</body>
</html>