<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../partials/commonhead.jsp' flush="false" />
<title>팀 모집 게시판</title>
<style>
.right-box {
	float: right;
}

.square-image {
    width: 100%; /* 부모 요소인 .col-md-4의 너비에 맞춰서 너비 설정 */
    height: 100%;
    padding-top: 100%; /* 높이를 너비와 같게 설정 */
    position: relative; /* 이미지를 절대 위치로 조정하기 위해 상대 위치 설정 */
    overflow: hidden; /* 컨테이너 밖으로 나가는 이미지를 숨김 */
}

.square-image img {
    position: absolute;
    top: 50%;   /* 이미지를 상자의 중앙으로 이동 */
    left: 50%;
    transform: translate(-50%, -50%); /* 이미지 중심을 상자 중앙에 정확히 위치시킴 */
    height: 100%; /* 이미지가 상자의 최소 높이를 가짐 */
    min-width: 100%;  /* 이미지가 상자의 최소 너비를 가짐 */
    object-fit: cover; /* 이미지가 비율을 유지하면서 상자를 채움 */
}
</style>
<script>

	function goWrite() {
		//로그인 유저가 아니면 쓰기창 못감
		if(${empty UserVO}){
			alert("로그인 후 이용가능 합니다");
			return;
		}
		location.href = "${writeBbsUrl }";
	}
	
/* 	function writeBbs(frm){
		console.log(frm);
		console.log(frm.subject.value);
		if (frm.subject == null) {
			alert("제목이 작성되지 않았습니다");
		} else {
			alert("글작성 버튼 클릭");
  			frm.action = "join_bbs_write_ok";
			frm.submit(); 
		}
	} */
</script>
</head>
<body>
	<jsp:include page='../partials/commonbody.jsp' flush="false" />
	<div class="container">
		<div class="card bg-dark text-white border-dark">
			<div class="card-header d-flex justify-content-center">
				<h1>팀 모집 게시판</h1>
			</div>
		</div>
		<!-- 제목, 내용으로 검색 기능 -->
		<%-- 로그인 여부로 버튼 활성화 --%>
		<div class="m-3">
			<div class="row">
				<div class="col">
					<c:if test="${empty UserVO}">
						<button onclick="goWrite()" class="btn btn-secondary right-box">모집글작성하기</button>
						<br>
					</c:if>
				</div>
			</div>
			<c:if test="${not empty UserVO}">
				<!-- <button onclick="goWrite()" class="btn btn-danger right-box">모집글작성하기</button ><br> -->
				<!-- 모집글 작성 modal -->
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-primary right-box"
							data-toggle="modal" data-target="#staticBackdrop">모집글 작성하기
						</button>				
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					data-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<%@include file="../../join_bbs/joinBbsWrite-include.jsp"%>

				</div>
			</c:if>
		</div>
		<div class="card-deck d-flex justify-content-center my-3 position-relative">
			<c:forEach var="joinVO" items="${joinList}">
				<div>
					<div class="card border-secondary shadow mb-3 join-card" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 480px;">
						<div class="row no-gutters">
							<div class="col-md-4 border">
								<div class="square-image">
									<img src="${joinVO.logo }" alt="Team's logo" class="card-img image-fluid">								
								</div>
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">${joinVO.teamName}</h5>
									<p class="card-text">${joinVO.subject }</p>
									<p class="card-text">
										<small class="text-muted">${joinVO.writerEmail }</small>
									</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">${joinVO.writeDate }</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- [이전]에 대한 사용 여부 처리 --%> <c:if test="${p.beginPage == 1 }">
						<a class="page-link" aria-label="Previous">
					</c:if> <c:if test="${p.beginPage != 1 }">
						<a class="page-link" href="${bbsUrl }?cPage=${p.beginPage - 1 }" aria-label="Previous">
					</c:if> <span aria-hidden="true">&laquo;</span> </a>
				</li>
				<%-- 페이지태그 --%>
				<c:forEach var="pageNo" begin="${p.beginPage }" end="${p.endPage }">
					<c:choose>
						<c:when test="${pageNo == p.nowPage }">
							<li class="page-item"><a class="page-link">${pageNo }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${bbs }?cPage=${pageNo }">${pageNo }</a></li>
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
	</div>
</body>
</html>