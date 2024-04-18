<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <jsp:include page = 'css/mouseStyle.jsp' flush = "false"/>
<script>
	function all_board(frm) {
		frm.action = "board";
		frm.submit();
	}
	
	$(document).ready(function() {
		$('[data-vbg]').youtube_background();
	});
</script>
</head>
<body>
	<button onclick="location.href='board'">자유게시판</button >
	<button onclick="location.href='boardWrite.jsp'">자유게시판 글작성</button >
	<div style="position: fixed !important; width: 100vw; height: 100%; left: 0; bottom: 0;">
		<div data-vbg-autoplay="true" data-vbg="https://www.youtube.com/watch?v=L3374C3OyrY"></div>
	</div>
</body>
</html>