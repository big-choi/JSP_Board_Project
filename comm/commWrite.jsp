<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 : initial-scale(처음 페이지 로딩 시 원래 크기) -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- 부트스트랩 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<!-- 제목 -->
<title>게시글 작성</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
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
				<li><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">LYRICS</a></li>
				<li class="active"><a href="comm.jsp">COMMUNITY</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href=join.jsp>회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="commWriteAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="commTitle" maxlength="100"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="commContent" maxlength="16000" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>


		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>