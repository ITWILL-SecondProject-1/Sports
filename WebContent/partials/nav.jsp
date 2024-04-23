<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메뉴 바 -->
<nav id="menu" class="navbar navbar-expand-lg navbar-dark bg-dark">

	<button class="navbar-toggler ml-2" type="button"
		data-toggle="collapse" data-target="#menuCollapse"
		aria-controls="menuCollapse" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="menuCollapse">
		<ul class="navbar-nav mx-auto mt-2 mt-lg-0 row justify-content-center">
			<!-- 중앙 정렬 및 그리드 시스템 활용(부트스트랩) -->
			<li class="nav-item col-md-auto">
				<!-- 중앙 정렬 --> 
				<a class="nav-link font-weight-bold" href="reserve.jsp">Reserve</a>
			</li>
			<li class="nav-item col-md-auto">
				<a class="nav-link font-weight-bold" href="gym.jsp">Gym</a></li>
			<li class="nav-item col-md-auto text-center">
				<!-- 중앙 정렬 --> 
				<a class="nav-link font-weight-bold" href="main">
					<img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1713515312/logo/logo_mqkknu.jpg" alt="logo" class="logo-img">
				</a>
			</li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="board">Board</a></li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="team.jsp">Team</a></li>
		</ul>
	</div>
	<!-- 드롭다운 버튼 추가 -->
	<div class="dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" id="DropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			menu
		</button>
		<div class="dropdown-menu" aria-labelledby="DropdownButton">
<%
	UserVO userVO = (UserVO) session.getAttribute("UserVO");
	if (userVO == null) {
%>
			<a class="dropdown-item" href="/STP/signup">회원가입</a>
			<a class="dropdown-item" href="/STP/login">로그인</a>
<%
	} else {
%>
			<a class="dropdown-item" href="/STP/userpage?email=<%=userVO.getEmail()%>">마이페이지</a>
			<a class="dropdown-item" href="#">고객센터</a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="/STP/logout">로그아웃</a>
<%
	}
%>
		</div>
	</div>
	
</nav>
<script>
	$(document).ready(function() {
		// 드롭다운 버튼 클릭 이벤트 처리
		$('#simpleDropdownButton').on('click', function() {
			// 드롭다운 메뉴의 토글 처리
			$(this).next('.dropdown-menu').toggle();
		});
	});
</script>