<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋살장 목록</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<div class="container">
	<div class="card bg-dark text-white border-dark">
		<div class="card-header d-flex justify-content-center">
			<h1>운동 시설 모음</h1>
		</div>
	</div>
	<div class="card-deck d-flex justify-content-center my-3 position-relative">
		<c:forEach var="facilityVO" items="${list}">
			<div>
				<div class="card m-3 facility-card shadow" style="width: 15rem;">
					<img src="https://picsum.photos/id/1/100/100" class="card-img-top">
					<div class="card-body">
						<h5 class="card-text">${facilityVO.facilityIdx}. ${facilityVO.facilityName}</h5>
					</div>
					<div class="card-footer">
						<small class="text=muted text-secondary">${facilityVO.address}</small>
					</div>
					<a class="stretched-link" href="facility?type=inquire&index=${facilityVO.facilityIdx}"></a>
				</div>
			</div>
		</c:forEach>
		<c:forEach var="facilityVO" items="${list}">
			<div>
				<div class="card m-3 facility-card" style="width: 15rem;">
					<img src="https://picsum.photos/id/1/100/100" class="card-img-top">
					<div class="card-body">
						<h5 class="card-text">${facilityVO.facilityIdx}. ${facilityVO.facilityName}</h5>
					</div>
					<div class="card-footer">
						<small class="text=muted">${facilityVO.address}</small>
					</div>
					<a class="stretched-link" href="facility?type=inquire&index=${facilityVO.facilityIdx}"></a>
				</div>
			</div>
		</c:forEach>
	</div>
	<nav aria-label="Page navigation example" class="my-3">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>
</body>
<script>
// 각 테이블의 행을 누르면, 해당 시설 페이지로 이동하는 함수
document.addEventListener('DOMContentLoaded', function () {
	const rows = document.querySelectorAll('tr.clickable-row');
    rows.forEach(row => {
        row.addEventListener('click', function() {
            const href = this.getAttribute('data-href');
            if(href) {
                window.location.href = href;
            }
        });
    });
});
</script>
</html>
