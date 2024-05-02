<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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