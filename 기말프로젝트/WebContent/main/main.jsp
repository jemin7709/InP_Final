<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
	<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
	<script type="text/javascript">
	$.ajax({
		url : "../Game/newGame.jsp", // a.jsp 에서 받아옴
		dataType: "json",
		success : function(data) {
			
			if(data.length>0){
				var tb = $("<table/>");
				for(var i in data){
					var $title = data[i].title;
					var row = $("<tr/>").append($("<td/>").text($title));
					tb.append(row);
				}
				$("#mainleft").append(tb);
			}
		}
	})


	</script>
	<div id="mainpage">
		<div id="mainleft"></div>
		<div id="mainright"></div>
	</div>
</body>
</html>