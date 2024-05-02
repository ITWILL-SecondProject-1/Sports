<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sports.model.dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#teamLogo {
	height: 300px;
	background-color: rgb(220, 220, 220);
	border-radius: 8px;
}
#logo-img {
	height: 300px;
}
/* #teamLogo2 {
	height: 100%;
} */

#writer-info-profile-img {
		display: inline-block;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		margin-right: 10px;
	}

/* 
#logoDiv {
    width: 100%; /* 부모 요소인 .col-md-4의 너비에 맞춰서 너비 설정 */
    height: 300px;
    padding-top: 100%; /* 높이를 너비와 같게 설정 */
    position: relative; /* 이미지를 절대 위치로 조정하기 위해 상대 위치 설정 */
    overflow: hidden; /* 컨테이너 밖으로 나가는 이미지를 숨김 */
}

#logoDiv img {
overflow: hidden;
    position: absolute;
    top: 50%;   /* 이미지를 상자의 중앙으로 이동 */
    left: 50%;
    transform: translate(-50%, -50%); /* 이미지 중심을 상자 중앙에 정확히 위치시킴 */
    height: 100%; /* 이미지가 상자의 최소 높이를 가짐 */
    min-width: 100%;  /* 이미지가 상자의 최소 너비를 가짐 */
    object-fit: cover; /* 이미지가 비율을 유지하면서 상자를 채움 */
} */
</style>
<script>

	function goWrite() {
		location.href = "${writeBbsUrl }";
	}
	
	function accept(val){
		console.log("val : " + val);
		location.href = "${signupAccept }";
	}
</script>
</head>
<body>
	<jsp:include page='../../partials/commonbody.jsp' flush="false" />

	<div class="container">
		<div class="row justify-content-md-center">
			<!-- 화면왼쪽 -->
			<div class="col-2">
			
				<%-- 가입맴버 표시 --%>
				<div class="accordion position-fixed" id="accordionExample">
					<div class="card">
						<div class="card-header bg-dark" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-dark btn-block text-left" type="button"
									data-toggle="collapse" data-target="#teamMemberLsit"
									aria-expanded="true" aria-controls="collapseOne">가입맴버
								</button>
							</h2>
						</div>

						<div id="teamMemberLsit" class="collapse show"
							aria-labelledby="headingOne">
							<c:forEach var="row" items="${memberList}">
								<div class="card comment-row">
									<div
										class="card-body d-flex justify-content-between align-items-center comment-name">
										<span> <img
											src="${UserDAO.indexToUserInfo(row.useridx).getImage() }"
											alt="profile-image" id="writer-info-profile-img"> <a
											href="userpage?email=${UserDAO.indexToUserInfo(row.useridx).getEmail() }">${row.nickname}</a>
										</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
			<%-- 화면중앙 --%>
			<div class="col-8" id="b">
				<%-- 팀사진 --%>
				<div class="row" id="teamLogo">
					<div class="col-8 mx-auto d-block" id="teamLogo2">
						<img src="${teamVo.logo }" alt="profile-image" id="logo-img">
					</div>
				</div>
				
				<h3>팀게시판</h3>
					<%-- 팀글 목록 --%>
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
		   		<a class="page-link" aria-label="Previous" href="#">
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
		    		<li class="page-item"><a class="page-link" href="${bbsUrl }?cPage=${pageNo }&teamIdx=${teamIdx }">${pageNo }</a></li>
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
		
			</div> <%-- 중앙박스 끝 --%>
			
			
			<%-- 화면오른쪽 --%>
			<div class="col-2">


				<div class="accordion position-fixed" id="accordionExample2">
				
					<div class="card">
						<div class="card-header bg-dark" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-dark btn-block text-left collapsed"
									type="button" data-toggle="collapse" data-target="#lookJoinBbs"
									aria-expanded="false" aria-controls="collapseTwo">
									모집글</button>
							</h2>
						</div>
						<div id="lookJoinBbs" class="collapse"
							aria-labelledby="headingTwo">
							<div class="card-body">Some placeholder content for the
								second accordion panel. This panel is hidden by default.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header bg-dark" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-dark btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">
									신청서</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne">
							<c:forEach var="row" items="${signupList}">
							<c:if test="${row.signupCheck == 'u'}">
								<%-- 신청서 확인 안한 경우만 출력 --%>
								<div class="card comment-row">
									<div class="card-header d-flex justify-content-between align-items-center comment-name">
										<span> <img
											src="${UserDAO.indexToUserInfo(row.useridx).getImage() }"
											alt="profile-image" id="writer-info-profile-img"> <a
											href="userpage?email=${UserDAO.indexToUserInfo(row.useridx).getEmail() }">${row.nickname}</a>

										</span>
									</div>
									<div class="card-body">
									<p class="card-text">${row.content}</p>
										<form>
											<input type="hidden" name="signupIdx"
												value="{row.signupIdx }"> <input type="button"
												onclick="accept(this.form)"
												class="btn btn-primary right-box" value="수락"> <input
												type="button" onclick="decline(this.form)"
												class="btn btn-danger right-box" value="거절">
										</form>
									</div>
								</div>
							</c:if>
						</c:forEach>
						</div>
					</div>
					
				</div>



















<%-- 
					<div class="row">진행중인 모집글</div>
					<div class="row">
						신청자 목록
						<c:forEach var="row" items="${signupList}">
							<c:if test="${row.signupCheck == 'u'}">
								신청서 확인 안한 경우만 출력
								<div class="card comment-row">
									<div
										class="card-header d-flex justify-content-between align-items-center comment-name">
										<span> <img
											src="${UserDAO.indexToUserInfo(row.useridx).getImage() }"
											alt="profile-image" id="writer-info-profile-img"> <a
											href="userpage?email=${UserDAO.indexToUserInfo(row.useridx).getEmail() }">${row.nickname}</a>

										</span>
									</div>
									<div class="comment-content bg-light">${row.content}</div>
									<div>
										<form>
											<input type="hidden" name="signupIdx"
												value="{row.signupIdx }"> <input type="button"
												onclick="accept(this.form)"
												class="btn btn-primary right-box" value="수락"> <input
												type="button" onclick="decline(this.form)"
												class="btn btn-danger right-box" value="거절">
										</form>
									</div>
								</div>
							</c:if>
						</c:forEach> 
--%>
					</div>
				</div>
			</div>
	</div>
</body>
</html>