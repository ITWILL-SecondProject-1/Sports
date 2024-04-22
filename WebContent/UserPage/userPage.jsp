<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@page import="com.sports.model.dao.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserPage</title>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../partials/commonhead.jsp' flush = "false"/>
<jsp:include page = '../css/userPageStyle.jsp' flush = "false"/>
</head>
<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../partials/commonbody.jsp' flush = "false"/>
<!-- 요청받은 유저의 정보를 가져옴 -->
<%
	String reqEmail = ((String) request.getAttribute("email"));
	UserVO reqUserVO = UserDAO.getUserInfo(reqEmail);
	UserVO userVO = null;
	try {
		userVO = ((UserVO) session.getAttribute("UserVO"));		
	} catch (Exception e) {
		e.printStackTrace();
	}
	String userVOEmail = null;
	if (userVO != null) {
		userVOEmail = userVO.getEmail();
	}
	boolean auth = ((boolean) request.getAttribute("auth"));
%>
<div class="row user-page-card">
<div class="flex-column col-3 mr-4">
	<div class="user-info-profile-img-div">
		<img src="<%= reqUserVO.getImage() %>" alt="profile-image" id="user-info-profile-img">	
	</div>
	<div class="card user-info">
		<div class="card">
			<div class="card-body">
				<p>유저정보</p>
			</div>
	        <ul class="list-group list-group-flush">
	            <li class="list-group-item">
	                <i class="fa-regular fa-envelope"></i>
	                <span class="ms-2"><%= reqUserVO.getEmail() %></span>
	            </li>
	            <li class="list-group-item">
	                <i class="fa-regular fa-id-card"></i>
	                <span class="ms-2"><%= reqUserVO.getNickname() %></span>
	            </li>
	            <li class="list-group-item">
	                <i class="fa fa-phone fa-lg"></i>
	                <span class="ms-2"><%= reqUserVO.getPhone() %></span>
	            </li>
	            <li class="list-group-item">
	                <% if (reqUserVO.getGender().equals("female")) { %>
	                    <!-- 남자 아이콘 표시 -->
	                    <i class="fa fa-mars" aria-hidden="true"></i>
					<% } else if (reqUserVO.getGender().equals("male")) { %>
						<!-- 여자 아이콘 표시 -->
						<i class="fa fa-venus" aria-hidden="true"></i>
						<!-- 성 중립적 아이콘 -->
					<% } else { %>
						<i class="fa fa-question-circle" aria-hidden="true"></i>
					<% } %>
					<span class="ms-2"><%= reqUserVO.getGender() %></span>
				</li>
				<li class="list-group-item">
					<i class="fa-solid fa-warehouse"></i>
					<span class="ms-2"><%= reqUserVO.getImage() %></span>
				</li>
			</ul>
		</div>
	</div>
<%
	if (auth == true) {
%>
	<div class="card" id="edit-user-profile-img-button">
		<button type="button" onclick="editProfileImg();" class="btn btn-primary">프로필 사진 바꾸기</button>
	</div>
	<div class="card" id="edit-user-profile-button">
		<button type="button" onclick="showEditProfilePopup();" class="btn btn-success">프로필 바꾸기</button>
	</div>
<%
	}	
%>
</div>
	<div class="col-md-7 ml-4 card" id="user-board">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach var="vo" items="${freeBoardList}">
				<tr>
					<td>${vo.bbsIdx}</td>
					<td>
						<a href="viewBoardOne.jsp?bbsIdx=${vo.bbsIdx}">${vo.subject}</a>
					</td>
					<td>${vo.writeDate}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%
	if (auth == true) {
%>
<!-- 프로필 편집 팝업창을 띄우는 스크립트 -->
<script>
function showEditProfilePopup() {
    Swal.fire({
        title: 'User Profile Edit',
        width: 700,
        html: `
        <div class="mb-3 edit-div">
			UserName
            <input type="text" id="nickname" class="swal2-input" value="<%=userVO.getNickname()%>" placeholder="<%=userVO.getNickname()%>">
        </div>
		<div class="mb-3 edit-div">
			New-Password
			<input type="password" id="password" class="swal2-input" value="<%=userVO.getPassword()%>" placeholder="Password">
        </div>     	
        <div class="mb-3 edit-div">
			Phone
            <input type="text" id="phone" class="swal2-input" value="<%=userVO.getPhone()%>" placeholder="<%=userVO.getPhone()%>">
		</div>
        `,
        confirmButtonText: 'Edit',
        focusConfirm: false,
        didOpen: () => {
            const popup = Swal.getPopup();
            const nicknameInput = popup.querySelector('#nickname');
            const passwordInput = popup.querySelector('#password');
            const phoneInput = popup.querySelector('#phone');
            const handleEnter = (event) => { if (event.key === 'Enter') Swal.clickConfirm(); };
            nicknameInput.onkeyup = handleEnter;
            passwordInput.onkeyup = handleEnter;
            phoneInput.onkeyup = handleEnter;
        },
        preConfirm: () => {
            const nickname = document.getElementById('nickname').value;
            const password = document.getElementById('password').value;
            const phone = document.getElementById('phone').value;
            if (!nickname) {
                Swal.showValidationMessage(`Please enter username`);
            }
            if (!password) {
                Swal.showValidationMessage(`Please enter password`);
            }
            if (!phone) {
                Swal.showValidationMessage(`Please enter phone`);
            }
            confirmEditProfile(nickname, password, phone);
        },
    })
}

// 변경을 정말 할건지 띄워주는 창
function confirmEditProfile(nickname, password, phone) {
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
			confirmButtonText: "Yes, Edit it!",
			cancelButtonText: "No, cancel!",
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
	            editProfile(nickname, password, phone, function(editResult) {  // 콜백 함수 사용
					if(editResult) {
						swalWithBootstrapButtons.fire({
							title: "Edited!",
							text: "Your profile has been updated!",
							icon: "success"
						});
					} else {
						swalWithBootstrapButtons.fire({
							title: "Failed",
							text: "Profile update failed!",
							icon: "error"
						});
					}
				});
			} else if (result.dismiss === Swal.DismissReason.cancel) {
				swalWithBootstrapButtons.fire({
					title: "Cancelled",
					text: "Your profile edit is cancelled :)",
					icon: "error"
				});
			}
		});
	}

// 프로필 변경을 DB에 적용하는 코드
function editProfile(nickname, password, phone, callback) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "UserPage/editProfile.jsp", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		let result = false;
		if (this.readyState == 4 && this.status == 200) {
			var responseText = this.responseText.trim();
			console.log("responseText : " + responseText);
			if (responseText == 'true') {
				result = true;
			} else {
				result = false;
			}
			callback(responseText === 'true');
		}
		return result;
	};
	xhr.send("email=" + encodeURIComponent("<%=userVOEmail%>") +
			"&nickname=" + encodeURIComponent(nickname) + 
			"&password=" + encodeURIComponent(password) + 
			"&phone=" + encodeURIComponent(phone));
}

// 프로필 이미지 변경코드
function editProfileImg() {
    Swal.fire({
        title: 'User Profile Image Edit',
        input: "file",
        inputAttributes: {
            accept: "image/*",
            "aria-label": "Select Image",
		},
        width: 700,
        html: false,
        confirmButtonText: 'Edit',
        showLoaderOnConfirm: true,
        focusConfirm: false,
        didOpen: () => {
            const popup = Swal.getPopup();
            const imgInput = popup.querySelector('#swal-file');
			console.log(imgInput);
            const handleEnter = (event) => { if (event.key === 'Enter') Swal.clickConfirm(); };
            imgInput.onkeyup = handleEnter;
        },
        preConfirm: () => {
            const img = document.getElementById('swal-file').value;
            if (!img) {
                Swal.showValidationMessage(`Please attach the image file`);
            }
            confirmEditProfileImg(img);
        },
    })
}

// 이미지를 POST방식으로 전송
function confirmEditProfileImg(fileInput, callback) {
	console.log(fileInput.files[0]);
    var formData = new FormData();
    formData.append("img", fileInput.files[0]); // fileInput은 <input type="file"> 요소

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UserPage/editProfileImg.jsp", true);
    xhr.onreadystatechange = function() {
        if (this.readyState == 4) {
            var success = this.status == 200 && this.responseText.trim() == 'true';
            console.log("responseText : " + this.responseText);
            callback(success);
        }
    };

    xhr.send(formData); // FormData를 사용하여 파일을 전송
}
</script>
<%
	} 
%>
</body>
</html>