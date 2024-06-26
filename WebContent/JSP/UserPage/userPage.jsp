<%@page import="com.sports.model.dao.FaDAO"%>
<%@page import="com.sports.model.dao.ResDAO"%>
<%@page import="com.sports.model.vo.ResVO"%>
<%@page import="com.sport.joinBbs.dao.TeamDAO"%>
<%@page import="com.sport.joinBbs.vo.TeamVO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.board.common.Paging"%>
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
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<jsp:include page = '../../css/userPageStyle.jsp' flush = "false"/>
</head>

<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
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
	
	//글 가져오기
	Paging p = (Paging) request.getAttribute("p");
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("lise");

	pageContext.setAttribute("p", p);
	pageContext.setAttribute("freeBoardList", list);
%>
<div class="row user-page-card">
	<div class="flex-column col-3 mr-1">
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
						<%
							UserVO user = (UserVO)request.getSession().getAttribute("UserVO");
				    		List<TeamVO> teamList = TeamDAO.getMyTeamList(user.getUseridx());
				    		pageContext.setAttribute("teamList", teamList);
						%>
							<c:forEach var="team" items="${teamList }">
								<div class="row border m-1 p-2"><img src="${team.logo }" alt="profile-image" id="logo-img">${team.teamName }</div>
							</c:forEach>
							<c:if test="${teamList.size() } == 0">
								<div class="row border">가입한 팀이 없습니다</div>
							</c:if>
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
	<div class="col-md-3 mx-2 card" id="user-board">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach var="vo" items="${freeBoardList}">
				<tr>
					<td>${vo.bbsIdx}</td>
					<td>
						<a href="viewBoardOne?bbsIdx=${vo.bbsIdx}">${vo.subject}</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div>
			<nav aria-label="Page navigation example" >
			  <ul class="pagination justify-content-center">
			    <li class="page-item">
			    <%-- [이전]에 대한 사용 여부 처리 --%>
			    <c:if test="${p.beginPage == 1 }">
			   		<a class="page-link" aria-label="Previous">
			    </c:if>
			    <c:if test="${p.beginPage != 1 }">
			     	<a class="page-link" href="userpage?email=<%= reqEmail %>&cPage=${p.beginPage - 1 }" aria-label="Previous">
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
			    		<li class="page-item"><a class="page-link" href="userpage?email=<%= reqEmail %>&cPage=${pageNo }">${pageNo }</a></li>
			    	</c:otherwise>
			    </c:choose>
			    </c:forEach>
			    <c:if test="${p.endPage < p.totalPage }">
			     	<a class="page-link" href="userpage?email=<%= reqEmail %>&cPage=${p.endPage + 1 }" aria-label="Next">
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
	</div>
<%
    if (userVO != null) {
        int userIdx = Integer.parseInt(userVO.getUseridx());
        List<ResVO> reservations = ResDAO.getList(userIdx);
        if (reservations != null && !reservations.isEmpty()) {
%>
    <div class="col-md-5 ml-2 p-2 card">
        <h3 class="section-title">나의 예약목록</h3>
        <form id="deleteForm" action="deleteReservation" method="post">
            <table class="table">
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>예약시설 이름</th>
                        <th>예약날짜</th>
                        <th>예약시간</th>
                        <th>인원 수</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
<%
                    for (ResVO res : reservations) {
                        int startTime = Integer.parseInt(res.getReserveTime()); 
                        String formattedStartTime = String.format("%02d", startTime); 
                        String formattedEndTime = String.format("%02d", startTime + 1);
                        String facilityName = FaDAO.getFacilityNameById(res.getFacilityIdx());
%>
                    <tr>
                        <td><%= res.getReserveIdx() %></td>
                        <td><%= facilityName %></td>
                        <td><%= res.getReserveDate() %></td>
                        <td><%= formattedStartTime %>:00 시 ~ <%= formattedEndTime %>:00 시</td>
                        <td><%= res.getHeadCount() %></td>
                        <td><input type="radio" name="reservationId" value="<%= res.getReserveIdx() %>" class="checkbox"></td>
                    </tr>
<%
                    }
%>
                </tbody>
            </table>
            <div class="form-actions">
            <button type="submit" class="btn btn-danger">예약 삭제</button>
    	</div>        
       </form>
    </div>
</div>    
<%
        } else {
%>
            <p>예약목록이 없습니다.</p>
<%
        }
    } else {
%>
        <p>로그인이 필요합니다.</p>
<%
    }
%>
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
							icon: "success",
							didClose: () => {
								// Timer완료 후 페이지 새로고침
								window.location.reload();
							}
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
	xhr.open("POST", "JSP/UserPage/editProfile.jsp", true)
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
async function editProfileImg() {
	await Swal.fire({
		title: "Please Select Image File",
		input: "file",
		inputAttributes: {
		accept: "image/*",
		"aria-label": "Select Image"
		},
		showLoaderOnConfirm: true,
		preConfirm: (file) => {
			if (!file) {
				Swal.showValidationMessage("No file selected");
				return;
			}

			const formData = new FormData();
			formData.append('img', file, file.name);

			Swal.fire({
				title: "Uploading...",
				onBeforeOpen: () => {
					Swal.showLoading();
				},
				willClose: () => {
					console.log('Closed without errors.');
				},
			});

			// 서버로 파일 전송
			return fetch('uploadProfileImg', {
				method: "POST",
				body: formData  // FormData를 사용하여 파일을 전송
			})
			.then(response => {
				if (!response.ok) {
					throw new Error('Something went wrong on server side');
				}
				return response.json();
			})
			.then(data => {
				Swal.update({
					title: "Success!",
					text: "File has been uploaded successfully.",
					icon: "success",
					timer: 1500,
					timerProgressBar: true,
					didClose: () => {
						// Timer완료 후 페이지 새로고침
						window.location.reload();
					}
				});
			})
			.catch(error => {
				Swal.showValidationMessage(`Request failed: ${error}`);
			});
		},
	});
}
</script>

<%
	} 
%>
<!-- 삭제버튼 클릭시 alert -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const deleteForm = document.getElementById('deleteForm');

    deleteForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const selectedRadio = document.querySelector('input[name="reservationId"]:checked');

        if (!selectedRadio) {
            alert("삭제할 예약을 선택해주세요.");
            return;
        }

        if (!confirm('선택한 예약을 삭제하시겠습니까?')) {
            return;
        }

        const reservationId = selectedRadio.value;
        fetch('deleteReservation', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'reservationId=' + encodeURIComponent(reservationId) // URL 인코딩 추가
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                selectedRadio.closest('tr').remove(); // 행 삭제
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('예약 삭제에 실패하였습니다.');
        });
    });
});
</script>



</body>
</html>