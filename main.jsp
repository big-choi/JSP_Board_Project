<!-- 홈페이지 첫 화면 -->
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
<link rel="stylesheet" href="css/style.css">
<!-- 제목 -->
<title>TRANSLATE!</title>
</head>
<body>
	<a href="http://localhost:8181/BS_Board/main.jsp"><img
		src="image\logo.PNG" style="display: block; margin: 0 auto;"></a>
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
				<li class="active"><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">LYRICS</a></li>
				<li><a href="comm.jsp">COMMUNITY</a></li>
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

	<!-- 슬라이드(캐러셀) -->
	<div style="padding: 20px;">
		<div class="mx-5 bg-white">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img class="img-responsive center-block" src="image/jayz2.jpg"
							style="width: 50%;">
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="image/ariana.jpg">
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="image/beyonce2.jpg">
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="image/bieber2.jpg">
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="image/aerosmith.jpg">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- 캐러셀 끝 -->
	</div>

	<!-- 다른 div 사이 공백 -->
	<div style="padding: 15px;"></div>

	<div class="mline" style="margin-bottom: 5px;">
		<span> NEWS & CONTENTS </span>
	</div>

	<!-- 썸네일 & 캡션 -->
	<!-- 상하좌우 공백간격 -->
	<div style="padding-left: 230px;">
		<div style="padding-right: 230px;">
			<div style="padding-top: 50px;">
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<div class="thumbnail">
							<img src="image/billboard.jpg" alt="Billboard Hot 100">
							<div class="caption">
								<p>
									<b>
									<h4>Billboard Chart</h4>
									</b>
								</p>
								<button type="button" class="btn btn-primary"
									data-toggle="collapse" data-target="#view-detail">자세히
									보기</button>
								<div id="view-detail" class="collapse">
									<br>
									<p>전 세계적으로 가장 대중성있으며 강력한 영향력을 지닌 차트입니다.</p>
									<p>빌보드 핫 100(Billboard Hot 100)은 피지컬 싱글 및 디지털 음원 판매량, 스트리밍
										수치, 라디오 에어플레이 수치, 유튜브 조회수등을 합산하여 노래의 성적을 총망라하는 메인 차트입니다.</p>
									<p>빌보드 200(Billboard 200)은 모든 장르의 앨범, EP 판매량 및 스트리밍을 총 집계하는
										차트로 빌보드의 앨범 차트입니다.</p>
									<p>
										<a href="https://www.billboard.com/charts/hot-100"
											target="_blank" class="btn btn-primary" role="button">HOT
											100</a> <a href="https://www.billboard.com/charts/billboard-200"
											target="_blank" class="btn btn-primary" role="button">BILLBOARD
											200</a>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-md-3">
						<div class="thumbnail">
							<img src="image/kanye_thumb.jpeg" alt="Kanye West">
							<div class="caption">
								<p>
									<h4><b> Kanye West, 곧 앨범 드랍 예정?</b></h4>
								</p>
								<button type="button" class="btn btn-primary"
									data-toggle="collapse" data-target="#view-detail2">자세히
									보기</button>
								<div id="view-detail2" class="collapse">
									<br>

									<p>
										하루 전, 칸예 웨스트의 새 프로젝트를 미리 감상할 수 있는<br> 비밀 리스닝 파티 초대장이
										관계자들에게 주어졌다.<br> 리스닝 파티는 현지 시각 7월 18일 라스베가스에서 진행되었다.
									</p>

									<p>
										동료 저스틴 라보이(Justin Laboy)는 자신이<br> 케빈 듀란트(Kevin Durant)와
										함께 칸예 웨스트의 새 앨범을 감상했다는 사실을 밝히며 ”프로덕션이 1광년은 앞서있다”라고 주장했다.
									</p>

									<p>
										<a
											href="https://variety.com/2021/music/news/kanye-west-donda-new-songs-las-vegas-video-1235022648/"
											target="_blank" class="btn btn-primary" role="button">원문보기</a>
									</p>
								</div>
							</div>
						</div>
					</div>

				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<img src="image/genius.jpg" alt="GENIUS">
						<div class="caption">
							<p>
								<b><h4>가사의 의미를 알고 싶을 땐?</h4></b>
							</p>
							<button type="button" class="btn btn-primary"
								data-toggle="collapse" data-target="#view-detail3">자세히
								보기</button>
							<div id="view-detail3" class="collapse">
								<br>
								<p>
									Genius는 음악 가사, 소식, 정보 등을 제공하고 있는<br>미국의 음악 웹사이트입니다. <br>
									가사해석이 존재해도 우린 종종 그 의미를<br>완전히 이해하지 못하고는 하는데요,<br>
									Genius는 가사 속 펀치라인(Punch-Line)이나 이중적 의미를<br>이해하기 쉽게 설명해줍니다.<br>
									또한, 거의 모든 장르의 가사를 제공해주기도 하죠!<br>
								</p>
								<p>
									<a href="https://genius.com/" target="_blank"
										class="btn btn-primary" role="button">바로가기</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<img src="image/site.png" alt="사이트 소개">
						<div class="caption">
							<p>
								<b><h4>사이트 소개</h4></b>
							</p>
							<button type="button" class="btn btn-primary"
								data-toggle="collapse" data-target="#view-detail4">자세히 <!-- 자세히 보기 버튼 -->
								보기</button>
							<div id="view-detail4" class="collapse">
								<br>
								<p>
									본 사이트는 가사해석 커뮤니티를 기반으로 제작되었습니다.<br> MAIN 화면은 각 장르의 대표인물을<br>
									슬라이드형식인 캐러셀(Carousel)로 구현했으며,<br> Thumbnail 클래스를 이용해<br>
									뉴스 및 다양한 컨텐츠를 출력할 수 있도록 구현했습니다.<br>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 썸네일 캡션 end -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
