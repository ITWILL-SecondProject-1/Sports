<%@page import="com.sports.model.vo.BoardCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.model.dao.BoardCommentDAO"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@page import="com.sports.model.dao.BoardDAO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@page import="com.sports.model.vo.ImagesVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	//파라미터값 추출
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));

	BoardVO boardVo = (BoardVO)request.getAttribute("boardVo");
	String writer = boardVo.getUseridx();
	
	//EL, JSTL 사용을 위한 scope상에 데이터 등록
	pageContext.setAttribute("boardVo", boardVo);
	
	//로그인정보 가져오기
	UserVO userVO = (UserVO) session.getAttribute("UserVO");
	String useridx = null;
	if (userVO != null) {
		System.out.println("로그인 정보 : " + userVO);
		//작성자와 로그인 정보 일치 확인
		useridx = userVO.getUseridx();
		
		if (userVO.getUseridx().equals(boardVo.getUseridx())) {
			//일치하면 수정하기, 삭제하기 버튼
		} else {
			System.out.println("불일치");			
		}
	} else {
		System.out.println("로그인 안함");
	};
	
	//댓글목록 가져오기
	List<BoardCommentVO> list = BoardCommentDAO.selectBoardComment(bbsIdx);

	pageContext.setAttribute("commentList", list);
	pageContext.setAttribute("writer", writer);
	pageContext.setAttribute("useridx", useridx);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판-${boardVo.subject}</title>
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
<jsp:include page='../../css/viewBoardOneStyle.jsp' flush="false" />
</head>
<body>
<jsp:include page='../../partials/commonbody.jsp' flush="false" />
<div class='container'>
	<div class='row'>
		<div class='col-7'>
			<div class='card p-3'>
				<div id="readBoard">
					<div id="title">${boardVo.subject }</div>
					<%-- title 끝 --%>
					<div id="writer">작성자 : ${boardVo.nickname }&nbsp;&nbsp;&nbsp;
						${boardVo.writeDate }</div>
					<%--writer 끝 --%>
					<div id="viewList">
						<button class="btn btn-secondary" onclick="location.href='board'">목록으로가기</button>
					</div>
				</div>
				<%-- readBoard 끝 --%>
				<hr>
				<pre>${boardVo.content }</pre>
				<c:if test="${imagesList != null}">
					<div id="ImagesListCarousel" class="carousel slide card" data-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="image" items="${imagesList}" varStatus="status">
								<div class="carousel-item ${status.index == 0 ? 'active' : ''}" data-interval="10000">
									<img src="${image.image}" class="d-block w-100">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-target="#ImagesListCarousel" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-target="#ImagesListCarousel" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</button>
					</div>
				</c:if>
				<hr>
				<div id="updateDelete ml-auto">
					<c:if test="${useridx == writer }">
						<form action="updateBoard.jsp" method="post" class="m-1">
							<input type="submit" class="btn btn-danger" onclick="updateBoard(this.form)" value="수정하기">
							<input type="hidden" name="bbsIdx" value="${boardVo.bbsIdx }">
						</form>
						<form action="deleteBoard" method="post" class="m-1">
							<input type="button" class="btn btn-danger" onclick="deleteBoard(this.form)" value="삭제하기">
							<input type="hidden" name="bbsIdx" value="${boardVo.bbsIdx }">
						</form>
					</c:if>
				</div>
			</div>
			<div><%-- 카드 움직임 방지용 div --%>
			</div>
		</div>
		<%-- container 끝 --%>
		<div class='col-5'>
			<div class="commentDiv">
				<div class="align-items-center">
					<button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample">댓글보기</button>
				</div>
				<div class="collapse show">
					<div class="card card-body">
						<form method="post">
							<label for="comment" class="form-label">댓글작성하기</label>
							<textarea class="form-control" id="r_content" name="comment" rows="4"></textarea>
							<input type="hidden" name="bbsIdx" value="${boardVo.bbsIdx }">
							<input id="btnCommentWrite" type="submit" class="btn btn-info"
								value="입력" onclick="go_writeComment(this.form)">
						</form>
						<hr>
						<!-- 댓글 목록 띄우기 -->
						<c:if test="${not empty commentList }">
						<c:forEach var="row" items="${commentList}">
						    <div class="card comment-row">
						        <div class="d-flex justify-content-between align-items-center comment-name">
						            <span>닉네임: ${row.nickname}</span>
						            <c:if test="${useridx == row.useridx}">
						                <div class="ml-auto"> <!-- 오른쪽 정렬을 위해 ml-auto 추가 -->
						                    <button type="button" class="btn btn-primary btn-sm comment-edit" onclick="editComment(${useridx}, ${row.commentIdx}, '${row.content}')">수정</button>
						                    <button type="button" class="btn btn-danger btn-sm comment-delete" onclick="confirmDeleteComment(${useridx}, ${row.commentIdx})">삭제</button>
						                </div>
						            </c:if>
						        </div>
						        <hr>
						        <div class="comment-content">${row.content}</div>
						    </div>
						</c:forEach>
						</c:if>
					</div>
				</div>
				<%-- 댓글보기 토글 끝 --%>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	function updateBoard(frm) {
		frm.action="JSP/board/updateBoard.jsp";
		frm.submit();
	}
	
	function deleteBoard(frm) {
		frm.action="JSP/board/deleteBoard.jsp";
		frm.submit();
	}
	
	function go_writeComment(frm) {
		
		<%
			if (userVO == null) {
		%>
				alert("로그인 후 작성 가능");
				
		<%		
			} else {
				String idx = boardVo.getUseridx();
		%>
				frm.action="writeBoardComment";
				frm.submit();
		<%
			}
		%>
	}
	
	async function editComment(userIdx, commentIdx, previousContent) {
		Swal.fire({
			title: 'Comment Edit',
			width: 700,
			html: `
			<div class="mb-3 edit-div">
				<input type="text" id="content" class="swal2-edit-comment" value="${previousContent}">
			</div>
			`,
			confirmButtonText: 'Edit',
			focusConfirm: false,
			didOpen: () => {
				const popup = Swal.getPopup();
				const contentInput = popup.querySelector('#content');
				const handleEnter = (event) => { if (event.key === 'Enter') Swal.clickConfirm(); };
				contentInput.onkeyup = handleEnter;
			}, preConfirm: () => {
				const newContent = document.getElementById('content').value;
				if (!newContent) {
					Swal.showValidationMessage(`Please enter content`);
				}
				confirmEditComment(userIdx, commentIdx, newContent);
			}
		})
	}
	
	async function confirmEditComment(userIdx, commentIdx, newContent) {
	    const response = await fetch('/STP/updateBoardComment', {
	        method: 'POST', // HTTP 메소드 지정
	        headers: {
	            'Content-Type': 'application/json' // 컨텐츠 타입 헤더 설정
	        },
	        body: JSON.stringify({
	            userIdx: userIdx,
	            bbsIdx: <%=bbsIdx%>,
	            commentIdx: commentIdx,
	            content: newContent
	        }) // 전송할 데이터
	    });

	    if (response.ok) { // 응답 성공 체크
	        const jsonResponse = await response.json();
	        Swal.fire({
	            title: 'Success',
	            text: 'Your comment has been updated successfully.',
	            icon: 'success',
	            didClose:() => {
	            	window.location.reload();
	            }
	        });
	    } else {
	        Swal.fire({
	            title: 'Error',
	            text: 'There was a problem updating your comment.',
	            icon: 'error'
	        });
	    }
	}
	
	async function confirmDeleteComment(userIdx, commentIdx) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: "btn btn-success",
				cancelButton: "btn btn-danger"
			},
			buttonsStyling: false
			});
			swalWithBootstrapButtons.fire({
				title: "Are you sure?",
				text: "You won't be able to revert this!",
				icon: "warning",
				showCancelButton: true,
				confirmButtonText: "Yes, Delete it!",
				cancelButtonText: "No, cancel!",
				reverseButtons: true
			}).then((result) => {
				if (result.isConfirmed) {
		            deleteComment(userIdx, commentIdx, function(deleteComment) {  // 콜백 함수 사용
						if(deleteComment) {
							swalWithBootstrapButtons.fire({
								title: "Deleted!",
								text: "Your comment has been updated!",
								icon: "success",
								didClose: () => {
									// Timer완료 후 페이지 새로고침
									window.location.reload();
								}
							});
						} else {
							swalWithBootstrapButtons.fire({
								title: "Failed",
								text: "Comment delete failed!",
								icon: "error"
							});
						}
					});
				} else if (result.dismiss === Swal.DismissReason.cancel) {
					swalWithBootstrapButtons.fire({
						title: "Cancelled",
						text: "Your comment delete is cancelled :)",
						icon: "error"
					});
				}
			});
	}
	
	async function deleteComment(userIdx, commentIdx) {
	    const response = await fetch('/STP/deleteBoardComment', {
	        method: 'POST', // HTTP 메소드 지정
	        headers: {
	            'Content-Type': 'application/json' // 컨텐츠 타입 헤더 설정
	        },
	        // 전송할 데이터
	        body: JSON.stringify({
	            userIdx: userIdx,
	            commentIdx: commentIdx
	        })
	    });

	    if (response.ok) { // 응답 성공 체크
	        const jsonResponse = await response.json();
	        Swal.fire({
	            title: 'Success',
	            text: 'Your comment has been deleted successfully.',
	            icon: 'success',
	            didClose:() => {
	            	window.location.reload();
	            }
	        });
	    } else {
	        Swal.fire({
	            title: 'Error',
	            text: 'There was a problem deleting your comment.',
	            icon: 'error'
	        });
	    }
	}
	
	$(document).ready(function(){
	    $('#carouselExampleInterval').carousel();
	});
</script>
</html>