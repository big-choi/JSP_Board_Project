<!-- 커뮤니티 게시판(comm) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="comm.CommDAO"%>
<%@ page import="comm.Comm"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 : initial-scale(처음 페이지 로딩 시 원래 크기) -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- 부트스트랩 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 제목 -->
<title>COMMUNITY</title>
<style type="text/css">
	a, a:hover {
		color : #000000;
		text-decoration : none;	
	}
</style>
</head>
<body>
<a href="http://localhost:8181/BS_Board/main.jsp"><img src="image\logo.PNG" style="display: block; margin: 0 auto;"></a>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1; //기본페이지
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					CommDAO commDAO = new CommDAO();
					ArrayList<Comm> list = commDAO.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getCommID()%></td>
						<!-- 특수문자 그대로 표기 -->
						<td><a href="commView.jsp?commID=<%=list.get(i).getCommID()%>"><%=list.get(i).getCommTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getCommDate().substring(0, 11) + list.get(i).getCommDate().substring(11, 13) + "시 "
		+ list.get(i).getCommDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
			<a href="comm.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<%
			}
			if (commDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="comm.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
			}
			%>
			<a href="commWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
