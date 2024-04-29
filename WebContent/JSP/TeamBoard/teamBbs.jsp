<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#a {
	height: 500px;
	border: 1px solid red;
}

#b {
	height: 500px;
	border: 1px solid green;
}

#c {
	height: 300px;
	border: 1px solid orange;
}

#d {
	height: 500px;
	border: 1px solid blue;
}
</style>
<script>
	function goWrite() {
		location.href = "${writeBbsUrl }";
	}
</script>
</head>
<body>
	<jsp:include page='../../partials/commonbody.jsp' flush="false" />
	<div class="container-fluid px-4">
		<div class="row" id="a">
			<!-- 화면왼쪽 -->
			<div class="col-2">
				<div>온라인맴버</div>
			</div>
			
			
			<!-- 화면중앙 -->
			<div class="col-8" id="b">
				<!-- 팀사진 -->
				<div class="row" id="c">
					<div class="col-8 mx-auto d-block border">
						<img src="#" class="img-fluid">팀사진
					</div>
				</div>
				
				<h3>팀게시판</h3>
					<!-- 팀글 목록 -->
				   <div class="row border"> 
		<button onclick="goWrite()" class="btn btn-danger right-box">글작성하기</button ><br>	    	
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody id="tbody">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bbsIdx }</td>
						<td>
							<a href="${viewBbsUrl }?bbsIdx=${vo.bbsIdx }&cPage=${p.nowPage}">${vo.subject }</a>
						</td>
						<td>${vo.nickname }</td>
						<td>${vo.writeDate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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
		    		<li class="page-item"><a class="page-link" href="${bbs }?cPage=${pageNo }&teamIdx=${teamIdx }">${pageNo }</a></li>
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
		
			</div> <!-- 중앙박스 끝 -->
			
			
			<!-- 화면오른쪽 -->
			<div class="col-2">
				<div class="row">진행중인 모집글</div>
				<div class="row" id="d">신청자 목록</div>
			</div>
		</div>
	</div>
</body>
</html>