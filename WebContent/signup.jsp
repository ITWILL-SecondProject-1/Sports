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
<jsp:include page = 'partials/navbar.jsp' flush = "false"/>
<div class="cursor" id="cursor"></div>
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
                alert('이메일이 중복됩니다. 다른 이메일을 입력해주세요.');
            } else {
                duplication.value = 'false';
                document.getElementById('email').value = document.getElementById('email_input').value;
                document.getElementById('email_input').disabled = true;
                alert('사용 가능한 이메일입니다.');
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

</script>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>