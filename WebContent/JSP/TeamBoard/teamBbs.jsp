<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sports.model.dao.UserDAO"%>
<%@page import="com.sports.model.vo.UserVO" %>
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

.comments-writer-profile-img {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin-right: 10px;
}
</style>
</head>
<%
	UserVO currentUser = (UserVO)session.getAttribute("UserVO");
	String currentUserIdx = currentUser.getUseridx();
%>
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
									<td class="row-nickname">
										<a href="userpage?email=${vo.email}">${vo.nickname}</a>
									</td>
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
   			        <p><strong>작성자:</strong> <span id="teamBoardNickname"></span></p>
			        <p><strong>작성일:</strong> <span id="teamBoardWriteDate"></span></p>
			        <div id="UpdateDeleteButtons"></div>
				</div>
				<div class="modal-footer d-flex justify-content-center align-items-center">
				    <div class="card w-100">
				        <div class="card-header text-center">
				            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#commentViewCollapse" aria-expanded="false" aria-controls="commentViewCollapse">
				                댓글 보기
				            </button>
				        </div>
				        <div class="collapse" id="commentViewCollapse">
				            <div class="card card-body">
				                <div id="teamBoardComments"><!-- 댓글 리스트가 들어갈 자리 --></div>
				            </div>
				        </div>
				        <div class="card-footer">
				            <form method="post" class="w-100" action="">
				                <div class="form-group">
				                    <label for="comment-form" class="form-label">댓글작성하기</label>
				                    <textarea class="form-control" id="r_content" name="comment-form" rows="2"></textarea>
				                </div>
				                <input type="hidden" name="bbsIdx" id="boardNumberData" value="bbsIdx">
				                <button type="submit" class="btn btn-secondary">입력</button>
				            </form>
				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
    // 파일 업로드시, file-input 텍스트를 바꾸는 함수
    $('#post-images').on('change', function() {
        var filesCount = $(this).get(0).files.length;
        if (filesCount === 1) {
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.custom-file-label').text(fileName);
        } else {
            $(this).siblings('.custom-file-label').text(filesCount + ' files selected');
        }
    });

    // 팀 게시글 작성시
    $('#postForm').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                window.location.reload();
            },
            error: function(xhr, status, error) {
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
        var useridx = $(this).find('.hidden-td').find('.row-useridx').val();
        var content = $(this).find('.hidden-td').find('.row-content').val();
        var imageIdx = $(this).find('.hidden-td').find('.row-imageIdx').val();

        $.ajax({
            type: "GET",
            url: "teamBoardImageAndCommentList",
            data: { bbsIdx: bbsIdx, imageIdx: imageIdx },
            success: function(response) {
                var imagesHtml = '';
                if (response.images && response.images.length > 0) {
                    imagesHtml += '<div id="ImagesListCarousel" class="carousel slide" data-ride="carousel"><div class="carousel-inner">';
                    response.images.forEach(function(image, index) {
                        imagesHtml += '<div class="carousel-item ' + (index === 0 ? 'active' : '') + '"><img src="' + image.image + '" class="d-block w-100" alt="Carousel image"></div>';
                    });
                    imagesHtml += '</div><a class="carousel-control-prev" href="#ImagesListCarousel" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a>';
                    imagesHtml += '<a class="carousel-control-next" href="#ImagesListCarousel" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span></a></div>';
                } else {
                    imagesHtml += '<p>No images available.</p>';
                }
                $('#teamBoardImages').html(imagesHtml);

                if (response.comments && response.comments.length > 0) {
                	CommentsHtml(response.comments);
                } else {
                    commentsHtml = '<p>아직 댓글이 없습니다.</p>';
                    $('#teamBoardComments').html(commentsHtml);
                }
                
                var udButtons = '';
                if (response.boardVO.useridx === '<%=currentUserIdx%>') {
                	udButtons += '<div class="ml-auto">';
                	udButtons += '<button type="button" class="btn btn-warning btn-sm board-edit m-1">수정</button>';
                	udButtons += '<button type="button" class="btn btn-danger btn-sm board-delete m-1">삭제</button>';
                	udButtons += '</div>';
                	
                	$('#UpdateDeleteButtons').html(udButtons);
                }

                $('#teamBoardSubject').text(subject);
                $('#teamBoardNickname').text(nickname);
                $('#teamBoardWriteDate').text(writeDate);
                $('#teamBoardContent').text(content);
                $('#boardNumberData').val(bbsIdx);
                $('#teamBoardModal').attr('data-writer-id', useridx);

                $('#viewTeamBoard').modal('show');
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 중 오류 발생: " + error);
            }
        });
    });

    $('#viewTeamBoard .card-footer form').submit(function(e) {
        e.preventDefault();
        var postData = {
            bbsIdx: $('#boardNumberData').val(),
            comment: $('#r_content').val()
        };

        $.ajax({
            type: 'POST',
            url: '/STP/teamBoardComment',
            data: postData,
            success: function(response) {
                updateComments(postData.bbsIdx);
            },
            error: function(xhr, status, error) {
                console.error('댓글 작성 실패: ' + error);
            }
        });
    });

    function updateComments(bbsIdx) {
        $.ajax({
            type: 'GET',
            url: '/STP/teamBoardComment',
            data: {bbsIdx: bbsIdx},
            success: function(response) {
                CommentsHtml(response.comments);
            },
            error: function(xhr, status, error) {
                console.error('댓글 리스트 불러오기 실패: ' + error);
            }
        });
    }
    
    function CommentsHtml(comments) {
    	var commentsHtml = '';
    	comments.forEach(function(comment) {
    		console.log(comment);
        	commentsHtml += '<div class="card m-2" data-comment-id='+ comment.commentIdx +'>'
            	commentsHtml += '<div class="card-header d-flex justify-content-between align-items-center comment-name">'
           		commentsHtml += '<span>'
       			commentsHtml += '<img src="'+comment.profileImg+'" alt="profile-image" class="comments-writer-profile-img">'
       			commentsHtml += '<a href="userpage?email=' + comment.email + '">' + comment.nickname + '</a>'
       			commentsHtml += '<br>'
       			commentsHtml += comment.writeDate
       			commentsHtml += '</span>'
  		        if (comment.useridx === '<%=currentUserIdx%>') {
   		            commentsHtml += '<div class="ml-auto">';
   		            commentsHtml += '<button type="button" class="btn btn-warning btn-sm comment-edit m-1">수정</button>';
   		            commentsHtml += '<button type="button" class="btn btn-danger btn-sm comment-delete m-1">삭제</button>';
   		            commentsHtml += '</div>';
   		        }
    			commentsHtml += '</div>'
                commentsHtml += '<div class="comment p-2">' + comment.content + '</div>';
            	commentsHtml += '</div>'
    	})
    	$('#teamBoardComments').html(commentsHtml);
    	$('#r_content').val('');
    }
    
    $(document).on('click', '.comment-edit', function() {
        var commentDiv = $(this).closest('.card');
        var contentDiv = commentDiv.find('.comment');
        var bbsIdx = $('#boardNumberData').val();
        var currentText = contentDiv.text();;
        
        contentDiv.html('<textarea class="form-control">' + currentText + '</textarea>');
        $(this).replaceWith('<button type="button" class="btn btn-success btn-sm comment-save m-1">저장</button>');
        
        // 저장 버튼 이벤트 핸들러
        commentDiv.find('.comment-save').on('click', function() {
            var updatedText = contentDiv.find('textarea').val();
            // AJAX 요청을 통해 서버에 데이터 업데이트
            $.ajax({
                url: '/STP/updateTeamBoardComment',
                type: 'POST',
                data: {
                    commentId: commentDiv.attr('data-comment-id'),
                    newText: updatedText
                },
                success: function(response) {
                	updateComments(bbsIdx);
                }
            });
        });
    });
    
    $(document).on('click', '.comment-delete', function() {
        var commentDiv = $(this).closest('.card');
        var bbsIdx = $('#boardNumberData').val();
        Swal.fire({
            title: '정말 댓글을 삭제하시겠습니까?',
            text: "삭제하면 되돌릴 수 없어요!",
            icon: "warning",
            confirmButtonText: "삭제합니다.",
            cancelButtonText: "삭제하지 않습니다.",
            showCancelButton: true,
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/STP/deleteTeamBoardComment',
                    type: 'POST',
                    data: {
                        commentId: commentDiv.attr('data-comment-id')
                    },
                    success: function(response) {
                        updateComments(bbsIdx);
                    }
                });
            }
        });
    });
});
</script>
</html>