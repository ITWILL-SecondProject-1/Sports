<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
	<jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
	<jsp:include page = 'css/mouseStyle.jsp' flush = "false"/>
	<jsp:include page = 'css/authStyle.jsp' flush = "false"/>
</head>
<body>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>

<jsp:include page = 'partials/navbar.jsp' flush = "false"/>
<div class="cursor" id="cursor"></div>
<div id="alertPlaceholder"></div>
<div class="auth-wrapper">
    <form method="POST" action="/STP/signup" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="text-center">
            <h3 class="mb-3 font-weight-normal">회원가입</h3>
        </div>
        <div class="mb-3">
            <label for="email_input">Email address</label>
            <input type="email" class="form-control" id="email_input" name="email_input" required>
        </div>
        <button type="button" onclick="checkIdDuplication()" class="btn btn-primary">이메일 중복확인</button>
        <div class="mb-3">
            <label for="nickname">Nickname</label>
            <input type="text" class="form-control" id="nickname" name="nickname" required>
        </div>
        <div class="mb-3">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="mb-3">
            <label for="phone">Phone-Number</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
		<div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="maleRadio" value="male" checked>
            <label class="form-check-label" for="maleRadio">
                Male
            </label>
		</div>
		<div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="femaleRadio" value="female">
            <label class="form-check-label" for="femaleRadio">
                Female
            </label>
		</div>
		<input type="file" name="image" id="image">
		<!-- 아이디 중복 체크 여부 -->
		<input type="hidden" id="idDuplication" name="idDuplication" value="true"/>
		<input type="hidden" id="email" name="email" value="non"/>

        <button type="submit" class="btn btn-primary">가입하기</button>

        <div class="text-end mt-2">
            <a href="/STP/login">로그인 페이지로...</a>
        </div>
    </form>
</div>
<script>

// 이메일 중복 체크 함수
function checkIdDuplication() {
	var email_input = document.getElementById('email_input').value;
	var xhr = new XMLHttpRequest();
	let message;
    let alertType;
	xhr.open("POST", "emailDuplicateCheck.jsp", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        let duplication = document.getElementById('idDuplication');
        if (this.readyState == 4 && this.status == 200) {
            var responseText = this.responseText.trim();
            console.log('Server response:', this.responseText);
            console.log(responseText);
            if (responseText == 'duplicate') {
                duplication.value = 'true';
                message = "이메일이 중복됩니다. 다른 이메일을 입력해주세요.";
                showBootstrapDangerAlert(message);
            } else {
                duplication.value = 'false';
                document.getElementById('email').value = document.getElementById('email_input').value;
                document.getElementById('email_input').disabled = true;
                message = "사용가능한 이메일 입니다.";
                showBootstrapSuccessAlert(message);
            }
        }
    };
    
    xhr.send("email=" + encodeURIComponent(email_input));
}

// 폼 제출 전에 이메일 중복 체크를 불러오는 함수.
function validateForm() {
    var idDuplicationStatus = document.getElementById('idDuplication').value;
    if (idDuplicationStatus == 'true') {
        alert('이메일 중복확인을 해주세요.');
        return false;  // 폼 제출 차단
    }
    return true;
};

function showBootstrapDangerAlert(message) {
    var alertPlaceholder = document.getElementById('alertPlaceholder');
    var wrapper = document.createElement('div');
    wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
    					' <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>' + 
                        message +
                        '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

    alertPlaceholder.append(wrapper);
}

function showBootstrapSuccessAlert(message) {
    var alertPlaceholder = document.getElementById('alertPlaceholder');
    var wrapper = document.createElement('div');
    wrapper.innerHTML = '<div class="alert alert-success alert-dismissible fade show" role="alert">' +
    					'<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>' + 
                        message +
                        '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

    alertPlaceholder.append(wrapper);
}

</script>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>