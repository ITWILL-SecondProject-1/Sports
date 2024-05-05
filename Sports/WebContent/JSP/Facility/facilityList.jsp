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
					<img src="${facilityVO.thumb }" class="card-img-top img-thumbnail">
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
	</div>
	<nav aria-label="Page navigation example" >
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		    <%-- [이전]에 대한 사용 여부 처리 --%>
		    <c:if test="${p.beginPage == 1 }">
		   		<a class="page-link" aria-label="Previous">
		    </c:if>
		    <c:if test="${p.beginPage != 1 }">
		     	<a class="page-link" href="${bbsUrl }?cPage=${p.beginPage - 1 }" aria-label="Previous">
		    </c:if>
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <%-- 페이지태그 --%>
		    <c:forEach var="pageNo" begin="${p.beginPage }" end="${p.endPage }">
		    <c:choose>
		    	<c:when test="${pageNo == p.nowPage }">
		    		<li class="page-item"><a class="page-link">${pageNo }</a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li class="page-item"><a class="page-link" href="${bbs }?cPage=${pageNo }">${pageNo }</a></li>
		    	</c:otherwise>
		    </c:choose>
		    </c:forEach>
		    <%-- [다음]에 대한 사용 여부 처리 --%>
		    <c:if test="${p.endPage < p.totalPage }">
		     	<a class="page-link" href="${bbsUrl }?cPage=${p.endPage + 1 }" aria-label="Next">
		    </c:if>
		    <c:if test="${p.endPage >= p.totalPage }">
		     	<a class="page-link" href="#" aria-label="Next">
		    </c:if>
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	
	
	
	
	
	
	
	
	
	<!-- <nav aria-label="Page navigation example" class="my-3">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav> -->
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
