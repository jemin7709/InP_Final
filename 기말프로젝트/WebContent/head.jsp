<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<link href="initialcss/initialhead.css" type="text/css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript">
		function change_page(link){
			document.getElementById("mainframe").src = link;
		}
	</script>
	<!--타이틀-->
	<div id="title">Title</div>
	<!--메뉴바-->
	<div id="menu">
		<ul id="menubar">
			<li><button onclick="change_page('main/main.jsp')">홈</button></li>
			<li><button onclick="change_page('login/login.jsp')">로그인</button></li>
			<li><button onclick="change_page('createAccount/createAccount.jsp')">회원가입</button></li>
			<li><a>새 게임</a></li>
			<li><button onclick="change_page('board/board.jsp')">게시판</button></li>
			<li><button onclick="change_page('myPage/myPage.jsp')">내 정보</button></li>
		</ul>
	</div>
	<div id="mainpage">
		<iframe id="mainframe" src="main/main.jsp" width="1200px" height="450px" frameborder="0" scrolling="no">none</iframe>
	</div>
</body>
</html>