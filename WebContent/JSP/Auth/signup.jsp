<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
    <!-- 공통 링크 로딩 -->
	<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
	<jsp:include page = '../../css/authStyle.jsp' flush = "false"/>
</head>
<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
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
		<div class="input-group mb-3">
			<input type="file" class="form-control" id="image" name="image">
			<label class="input-group-text" for="image">Upload</label>
		</div>
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
	
	// 이메일 길이 체크
    if (email_input.length == 0) {
    	emptyEmailInputAlert();
        return false;
    }

    // 이메일 유효성 검사 정규 표현식
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailRegex.test(email_input)) {
    	notEmailFormAlert();
        return false;
    }
    
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "JSP/Auth/emailDuplicateCheck.jsp", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        let duplication = document.getElementById('idDuplication');
        if (this.readyState == 4 && this.status == 200) {
            var responseText = this.responseText.trim();
            if (responseText == 'duplicate') {
                duplication.value = 'true';
                showBootstrapDangerAlert();
            } else {
                duplication.value = 'false';
                document.getElementById('email').value = document.getElementById('email_input').value;
                document.getElementById('email_input').disabled = true;
                showBootstrapSuccessAlert();
            }
        }
    };
    
    xhr.send("email=" + encodeURIComponent(email_input));
}

// 폼 제출 전에 이메일 중복 체크를 불러오는 함수.
function validateForm() {
    var idDuplicationStatus = document.getElementById('idDuplication').value;
    if (idDuplicationStatus == 'true') {
        return false;  // 폼 제출 차단
    }
    return true;
};

// 이메일 폼이 비어있을때 나타나는 알림창.
function emptyEmailInputAlert() {	
	Swal.fire({
	  icon: "error",
	  title: "empty...",
	  text: "Email input is empty!",
	  footer: '<span style="color:indianred">이메일을 입력해 주세요.</span>'
	});
}

// 이메일 폼이 아닐 때 나타나는 알림창
function notEmailFormAlert() {	
	Swal.fire({
	  icon: "error",
	  title: "Not email format...",
	  text: "It's not an appropriate format!",
	  footer: '<span style="color:indianred">이메일 형식을 입력해 주세요.</span>'
	});
}

// 이메일 중복 검사 통과시 나타나는 알림창.
function showBootstrapSuccessAlert() {
	Swal.fire({
		icon: "success",
		title: "Approve!!",
		text: '사용 가능한 이메일 이에요!!!',
		footer: '<span style="color:green">회원가입을 진행해 주세요.</span>'
	});
}

// 이메일 중복 검사 미통과시 나타나는 알림창
function showBootstrapDangerAlert() {
	Swal.fire({
		  icon: "error",
		  title: "Oops...",
		  text: '이미 가입된 이메일 이에요!!!',
		  footer: '<span style="color:indianred">다른 이메일을 사용해보시겠어요?</span>'
		});
}

</script>
</body>
</html>