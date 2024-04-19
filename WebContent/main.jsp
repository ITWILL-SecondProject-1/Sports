<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>
<!-- 공통 링크 로딩 -->
<jsp:include page = 'partials/commonhead.jsp' flush = "false"/>
</head>
<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = 'partials/commonbody.jsp' flush = "false"/>
<!-- youtube-background 라이브러리 로드 -->
<script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
	<div data-vbg="https://www.youtube.com/watch?v=L3374C3OyrY"></div>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('[data-vbg]').youtube_background();
		jQuery('[data-vbg]').css('background-origin', 'border-box');
		jQuery('[data-vbg]').css('z-index', '0');
	});
</script>
</body>
</html>