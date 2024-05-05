<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sports.model.dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
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

.carousel-item {
   height: 300px; /* 원하는 높이로 설정 */
   overflow: hidden; /* 컨테이너를 벗어나는 부분은 숨깁니다 */
}

.carousel-item img {
    width: 100%; /* 너비를 컨테이너에 맞춤 */
    height: 300px; /* 높이를 고정 */
    object-fit: contain; /* 이미지를 컨테이너 내에 맞추어 전체가 보이게 함 */
    margin: auto; /* 중앙 정렬을 위해 사용 */
}
</style>
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
						게시물 작성하기
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
								<tr class="teamBoardRow" id="teamBoard${vo.bbsIdx }">
									<td class="row-bbsIdx">${vo.bbsIdx }</td>
									<td class="row-subject">${vo.subject }</td>
									<td class="row-nickname">${vo.nickname }</td>
									<td class="row-writeDate">${vo.writeDate }</td>
								    <td class="hidden-td">
								       <input type="hidden" class="row-useridx" name="useridx" value="${vo.useridx}">
								       <input type="hidden" class="row-content" name="content" value="${vo.content}">
								       <input type="hidden" class="row-imageIdx" name="imageIdx" value="${vo.imageIdx}">
								   </td>
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
										href="${bbsUrl }?cPage=${pageNo }&teamIdx=<%=request.getParameter("teamIdx") %>">${pageNo }</a></li>
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
					<form id="postForm" method="POST" enctype="multipart/form-data" action="teamBoardWrite">
					<input type="hidden" id="teamIdx" name="teamIdx" value="<%=request.getParameter("teamIdx") %>">
						<div class="form-group">
							<label for="post-title">제목</label> 
							<input type="text" class="form-control" id="post-title" name="post-title" placeholder="제목을 입력하세요" required>
						</div>
						<div class="form-group">
							<label for="post-content">내용</label>
							<textarea class="form-control" id="post-content" name="post-content" rows="7" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="post-images" name="post-images" aria-describedby="post-images" multiple>
							<label class="custom-file-label" for="post-images">Choose file</label>
						</div>
						<div class="modal-footer my-3">
							<button type="submit" class="btn btn-primary">글 작성</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 팀 게시판 읽는 모달 -->
	<div class="modal fade" id="viewTeamBoard" tabindex="-1" role="dialog" aria-labelledby="viewTeamBoard" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="teamBoardSubject"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body p-1">
					<!-- Carousel -->
					<div id="teamBoardImages"><!-- 이미지 콘텐츠 들어갈 자리 --></div>
					<!-- Carousel End -->
			        <p><strong>내용:</strong> <span id="teamBoardContent"></span></p>
			        <p>
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#commentViewCollapse" aria-expanded="false" aria-controls="commentViewCollapse">
							댓글 보기
						</button>
					</p>
				</div>
				<div class="modal-footer d-flex flex-column align-items-start">
			        <p><strong>작성자:</strong> <span id="teamBoardNickname"></span></p>
			        <p><strong>작성일:</strong> <span id="teamBoardWriteDate"></span></p>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<form method="post">
						<label for="comment-form" class="form-label">댓글작성하기</label>
						<textarea class="form-control" id="r_content" name="comment-form" rows="2"></textarea>
						<input type="hidden" name="bbsIdx" id="boardNumberData" value="bbsIdx">
						<input id="btnCommentWrite" type="submit" class="btn btn-secondary" value="입력">
					</form>
					<div class="collapse" id="commentViewCollapse">
						<div class="card card-body">
							<div id="teamBoardComments"><!-- 댓글 리스트가 들어갈 자리 --></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(
			function() {
				// 파일 업로드시, file-input 텍스트를 바꾸는 함수
				$('#post-images').on(
						'change',
						function() {
							// 선택된 파일 개수
							var filesCount = $(this).get(0).files.length;

							if (filesCount === 1) {
								// 단일 파일 선택 시, 파일 이름을 표시
								var fileName = $(this).val().split('\\').pop();
								$(this).siblings('.custom-file-label').text(
										fileName);
							} else {
								// 여러 파일 선택 시, 파일 개수를 표시
								$(this).siblings('.custom-file-label').text(
										filesCount + ' files selected');
							}
						});
				
				// 팀게시글 작성시
				$('#postForm').on('submit', function(e) {
					e.preventDefault(); // 기본 제출 방지

					var formData = new FormData(this);

					$.ajax({
						type : "POST",
						url : $(this).attr('action'),
						data : formData,
						contentType : false,
						processData : false,
						success : function(response) {
							console.log('Success:', response);
							window.location.reload();
						},
						error : function(xhr, status, error) {
							console.error('Error:', error);
						}
					});
				});
				
			// 게시글 조회 함수
			$('.teamBoardRow').click(function() {
				var bbsIdx = $(this).find('.row-bbsIdx').text();
				var subject = $(this).find('.row-subject').text();
				var nickname = $(this).find('.row-nickname').text();
				var writeDate = $(this).find('.row-writeDate').text();
		
				// 숨겨진 input에서 값 가져오기
			    var useridx = $(this).find('.hidden-td').find('.row-useridx').val();
			    var content = $(this).find('.hidden-td').find('.row-content').val();
			    var imageIdx = $(this).find('.hidden-td').find('.row-imageIdx').val();
			    
			    $.ajax({
			        type: "GET",
			        url: "teamBoardImageAndCommentList",
			        data: { bbsIdx: bbsIdx, imageIdx: imageIdx },
			        success: function(response) {
			            // 이미지 리스트 처리
			            var imagesHtml = '';
			            if (response.images && response.images.length > 0) {
			                imagesHtml += '<div id="ImagesListCarousel" class="carousel slide" data-ride="carousel">';
			                imagesHtml += '<div class="carousel-inner">';
			                
			                response.images.forEach(function(image, index) {
			                    imagesHtml += '<div class="carousel-item ' + (index === 0 ? 'active' : '') + '">';
			                    console.log(image);
			                    imagesHtml += '<img src="' + image.image + '" class="d-block w-100" alt="Carousel image">';
			                    imagesHtml += '</div>';
			                });

			                imagesHtml += '</div>';
			                imagesHtml += '<a class="carousel-control-prev" href="#ImagesListCarousel" role="button" data-slide="prev">';
			                imagesHtml += '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
			                imagesHtml += '<span class="sr-only">Previous</span>';
			                imagesHtml += '</a>';
			                imagesHtml += '<a class="carousel-control-next" href="#ImagesListCarousel" role="button" data-slide="next">';
			                imagesHtml += '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
			                imagesHtml += '<span class="sr-only">Next</span>';
			                imagesHtml += '</a>';
			                imagesHtml += '</div>';
			            } else {
			                imagesHtml += '<p></p>';
			            }
			            $('#teamBoardImages').html(imagesHtml);
						
			            var commentsHtml = '';
			            // 댓글 리스트 처리
						if (response.comments && response.comments.length > 0) {
				            response.comments.forEach(function(comment) {
			                	commentsHtml += '<div class="comment"><strong>' + comment.userName + ':</strong> ' + comment.comment + '</div>';
				            });
				        } else {
				            commentsHtml = '<p>아직 댓글이 없습니다.</p>';
				        }
						 $('#teamBoardComments').html(commentsHtml);
			            
			            // 서버로부터 받은 데이터를 사용하여 모달 내용을 업데이트
			            $('#teamBoardSubject').text(subject);
			            $('#teamBoardNickname').text(nickname);
			            $('#teamBoardWriteDate').text(writeDate);
			            $('#teamBoardContent').text(content);
			            $('#boardNumberData').val(bbsIdx);

			            // 모달 표시
			            $('#viewTeamBoard').modal('show');
			        },
			        error: function(xhr, status, error) {
			            console.error("AJAX 요청 중 오류 발생: " + error);
			        }
			    });
			});
		}
	);
</script>
</html>