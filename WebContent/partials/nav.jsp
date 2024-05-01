<%@page import="com.sport.joinBbs.dao.TeamDAO"%>
<%@page import="com.sport.joinBbs.vo.TeamVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!-- 메뉴 바 -->
<nav id="menu" class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">

	<button class="navbar-toggler ml-2" type="button"
		data-toggle="collapse" data-target="#menuCollapse"
		aria-controls="menuCollapse" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="menuCollapse">
		<ul class="navbar-nav mx-auto mt-2 mt-lg-0 row justify-content-center">
			<!-- 중앙 정렬 및 그리드 시스템 활용(부트스트랩) -->
				<!-- 중앙 정렬 --> 
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="facility?type=list">Gym</a></li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="board">Board</a></li>
			<li class="nav-item col-md-auto text-center">
				<!-- 중앙 정렬 --> 
				<a class="nav-link font-weight-bold" href="main">
					<img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1713515312/logo/logo_mqkknu.jpg" alt="logo" class="logo-img">
				</a>
			</li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="join_bbs">모집</a></li>
			
			<c:if test="${empty UserVO }">
				<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="">Team</a></li>
			</c:if>
			<c:if test="${not empty UserVO }">
				<li class="nav-item col-md-auto dropdown">
					<a class="nav-link font-weight-bold dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false" href="#">Team</a>
					<%
						UserVO user = (UserVO)request.getSession().getAttribute("UserVO");
			    		List<TeamVO> teamList = TeamDAO.getMyTeamList(user.getUseridx());
			    		pageContext.setAttribute("teamList", teamList);
					%>
					
					<ul class="dropdown-menu">
						<c:forEach var="team" items="${teamList }">
							<li><a class="dropdown-item text-secondary" href="../STP/teamBbs?teamIdx=${team.teamIdx }">${team.teamName }</a></li>
						</c:forEach>
						<c:if test="${teamList.size() } == 0">
							<li><a class="dropdown-item text-secondary" href="#">가입한 팀이 없습니다</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			
		</ul>
	</div><!-- reserve.jsp -->
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
			<c:if test="">
			
			</c:if>
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