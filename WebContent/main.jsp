<%@page import="com.sports.model.vo.UserVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!-- 제이쿼리 로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- youtube-background 라이브러리 로드 -->
<script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
    <jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
<script>
	function all_board(frm) {
		frm.action = "board";
		frm.submit();
	}
	
	$(document).ready(function() {
		$('[data-vbg]').youtube_background();
		
		// 'background-origin' 속성을 변경
	    $('[data-vbg]').css('background-origin', 'border-box');
	});
</script>
</head>
<body>
<jsp:include page="partials/nav.jsp"/>
	<div data-vbg="https://www.youtube.com/watch?v=L3374C3OyrY"></div>
	<div class="cursor" id="cursor"></div>
	<button onclick="location.href='board'">자유게시판</button >
	<button onclick="location.href='boardWrite.jsp'">자유게시판 글작성</button >
 <script type="text/javascript">
	jQuery(document).ready(function() {
	    jQuery('[data-vbg]').youtube_background();
	    jQuery('[data-vbg]').css('background-origin', 'border-box');
	    jQuery('[data-vbg]').css('z-index', '1');
	});
 </script>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>