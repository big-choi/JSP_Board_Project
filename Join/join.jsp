//회원가입 화면//
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<!-- 반응형 웹 : initial-scale(처음 페이지 로딩 시 원래 크기) -->
<meta name="viewport" content="width=device-width", initial-scale="1">
		<!-- 부트스트랩 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
		<!-- 제목 -->
<title>회원가입</title>
</head>
<body>
<!-- 메뉴바(navbar) -->
<!-- PC화면 : 왼쪽에서 오른쪽으로 길게 늘여진 메뉴바  -->
<!-- <div> 요소는 "순수" 컨테이너로서 아무것도 표현하지 않습니다. 
	대신 다른 요소 여럿을 묶어 class나 id 속성으로 꾸미기 쉽도록 돕거나,
	문서의 특정 구역이 다른 언어임을 표시(lang 속성 사용)하는 등의 용도로 사용할 수 있습니다. -->
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- 화면 축소했을 시 작대기 3개 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- 메뉴 리스트 -->
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" role="navigation">
				<li class="active"><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">LYRICS</a></li>
				<li><a href="bbs.jsp">COMMUNITY</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href=join.jsp>회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- xs = extra small screens (mobile phones)
		 sm = small screens (tablets)
		 md = medium screens (some desktops)
		 lg = large screens (remaining desktops)  -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;	">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
				</div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일"
						name="userEmail" maxlength="50">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
