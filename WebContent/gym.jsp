<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋살시설 페이지</title>
<!-- 공통 헤드 로딩 -->
<jsp:include page='partials/commonhead.jsp' flush="false" />
</head>
<body>
	<!-- 공통 바디 로딩 -->
	<jsp:include page='partials/commonbody.jsp' flush="false" />

	<div id="facilityListContainer"></div>

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(document).ready(function() {
			// 페이지 로드 시 'list' 를 ajax로 불러옴
			$.ajax({
				url : "list",
				type : "GET",
				success : function(data) {
					$('#facilityListContainer').html(data);
				},
				error : function(xhr, status, error) {
					console.error("Error fetching facilities: ", error);
				}
			});
		});
	</script>
</body>
</html>
