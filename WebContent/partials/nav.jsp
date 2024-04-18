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
				<a class="nav-link font-weight-bold" href="Reserve.jsp">Reserve</a>
			</li>
			<li class="nav-item col-md-auto"><a
				class="nav-link font-weight-bold" href="Gym.jsp">Gym</a></li>
			<li class="nav-item col-md-auto text-center">
				<!-- 중앙 정렬 --> 
				<a class="nav-link font-weight-bold">
					<img src="image/KakaoTalk_20240417_120243743.jpg" alt="logo" class="logo-img">
				</a>
			</li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="Board.jsp">Board</a></li>
			<li class="nav-item col-md-auto"><a class="nav-link font-weight-bold" href="Team.jsp">Team</a></li>
		</ul>
	</div>
	<!-- 드롭다운 버튼 추가 -->
	<div class="dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" id="DropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">menu</button>
		<div class="dropdown-menu" aria-labelledby="DropdownButton">
			<a class="dropdown-item" href="#">마이페이지</a> <a class="dropdown-item" href="#">고객센터</a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="#">로그아웃</a>
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