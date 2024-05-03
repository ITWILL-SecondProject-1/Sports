<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sports.model.dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>팀 게시판!</title>
<style>
#teamLogo {
	height: 300px;
	background-color: rgb(220, 220, 220);
	border-radius: 8px;
}

#logo-img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 10px;
}
#writer-info-profile-img {
	display: inline-block;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 10px;
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

	<div class="container-fluid">
		<div class="row">
			<!-- 화면왼쪽 -->
			<div class="col-2">
				<%-- 가입맴버 표시 --%>
				<%@include file="../../partials/teamMemberList-include.jsp"%>
			</div>
			<%-- 화면중앙 --%>
			<div class="col-7" id="b">
				<h3><img src="${teamVo.logo }" alt="profile-image" id="logo-img"> ${teamVo.teamName }게시판</h3>
				<%-- 팀글 목록 --%>
				<div class="row border">
					<button type="button" class="btn btn-primary m-2" data-toggle="modal" data-target="#writeTeamBoard">
						모집글 작성하기
					</button>				
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
									<td><a
										href="${viewBbsUrl }?bbsIdx=${vo.bbsIdx }&cPage=${p.nowPage}">${vo.subject }</a>
									</td>
									<td>${vo.nickname }</td>
									<td>${vo.writeDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<%-- [이전]에 대한 사용 여부 처리 --%> <c:if test="${p.beginPage == 1 }">
								<a class="page-link" aria-label="Previous" href="#">
							</c:if> <c:if test="${p.beginPage != 1 }">
								<a class="page-link" href="${bbsUrl }?cPage=${p.beginPage - 1 }"
									aria-label="Previous">
							</c:if> <span aria-hidden="true">&laquo;</span> </a>
						</li>
						<%-- 페이지태그 --%>
						<c:forEach var="pageNo" begin="${p.beginPage }"
							end="${p.endPage }">
							<c:choose>
								<c:when test="${pageNo == p.nowPage }">
									<li class="page-item"><a class="page-link">${pageNo }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${bbsUrl }?cPage=${pageNo }&teamIdx=${teamIdx }">${pageNo }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<%-- [다음]에 대한 사용 여부 처리 --%>
						<c:if test="${p.endPage < p.totalPage }">
							<a class="page-link" href="${bbsUrl }?cPage=${p.endPage + 1 }"
								aria-label="Next">
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
			<%-- 중앙박스 끝 --%>

			<%-- 화면오른쪽 --%>
			<div class="col-3" id="teamSignUpDiv">
				<!-- 모집글&가입신청 표시 -->
				<%@include file="../../partials/teamSignupList-include.jsp"%>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="teamBoardModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalSubject"></h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" id="close1">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      	
	      </div>
	      <div class="modal-body">
	        <p id="modalEmail"></p>
	        <p id="modalDate"></p>
	        <p id="modalContent"></p>
	        <p id="modalTime"></p>
	        <input type="hidden" id="modalTeamIdx">
	      </div>
	      <div class="modal-footer">
	      	<!-- <button type="button" class="btn btn-primary" onclick="application()">신청하기</button> -->
	      	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#showSignUp"
						aria-expanded="false" aria-controls="collapseExample">가입신청
			</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close2">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 팀 보드 작성시 나오는 모달 -->
	<div class="modal fade" id="writeTeamBoard" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="writeTeamBoardLabel">${teamVo.teamName } 게시글 작성</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Form -->
					<form>
						<div class="form-group">
							<label for="post-title">제목</label> 
							<input type="text" class="form-control" id="post-title" placeholder="제목을 입력하세요" required>
						</div>
						<div class="form-group">
							<label for="post-content">내용</label>
							<textarea class="form-control" id="post-content" rows="7" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="post-images" name="post-images" aria-describedby="post-images" multiple>
							<label class="custom-file-label" for="post-images">Choose file</label>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">글 작성</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
// 파일 입력칸의 라벨을 입력한 파일의 개수로 바꿔주는 코드
$(document).ready(function() {
    $('#post-images').on('change', function() {
        // 선택된 파일 개수
        var filesCount = $(this).get(0).files.length;

        if (filesCount === 1) {
            // 단일 파일 선택 시, 파일 이름을 표시
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.custom-file-label').text(fileName);
        } else {
            // 여러 파일 선택 시, 파일 개수를 표시
            $(this).siblings('.custom-file-label').text(filesCount + ' files selected');
        }
    });
});
</script>
</html>