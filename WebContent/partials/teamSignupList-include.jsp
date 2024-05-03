<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

	function accept(val) {
		console.log("val : " + val);
		location.href = "${signupAcceptUrl}?type=t&signupIdx="+val ;
	}
	function decline(val) {
		console.log("val : " + val);
		location.href = "${signupAcceptUrl}?type=f&signupIdx="+val ;
	}
	
</script>
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
									<button onclick="accept('${row.signupIdx}')" class="btn btn-primary right-box">수락</button>
									<button onclick="decline('${row.signupIdx}')" class="btn btn-danger right-box">거절</button>
										<!-- 
										<form>
											<input type="hidden" name="signupIdx" value="{row.signupIdx }"> 
											<input type="button" onclick="accept(this.form)"
												class="btn btn-primary right-box" value="수락"> 
											<input
												type="button" onclick="decline(this.form)"
												class="btn btn-danger right-box" value="거절">
										</form> 
										-->
									</div>
								</div>
							</c:if>
						</c:forEach>
						</div>
					</div>
					
				</div>