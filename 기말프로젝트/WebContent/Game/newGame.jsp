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
			<br><br><br><br><br>
			<input type="text" id="title" name="title" placeholder="제목을 입력하세요"><br>
			<button id="start" onclick="mv();">게임 시작</button>
			<button id="cancel">취소</button>
			<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
			<script type="text/javascript">
			function mv() {
				location.href = "inGame.jsp?title="+$("#title").val();
			}
			</script>
		</div>
		<div id="mainright">
		
		</div>
	</div>
</body>
</html>