<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
	<jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
	<jsp:include page = 'css/mouseStyle.jsp' flush = "false"/>
	<jsp:include page = 'css/authStyle.jsp' flush = "false"/>
	<script>
        function sendEmail() {
            var email = document.getElementById('email').value;
<%
			
%>
            alert("이메일이 " + email + " 로 전송되었습니다!");
        }
    </script>
</head>
<body>
<jsp:include page = 'partials/navbar.jsp' flush = "false"/>
<div class="cursor" id="cursor"></div>
<div class="auth-wrapper">
    <form method="POST" action="/STP/signup" enctype="multipart/form-data">
        <div class="text-center">
            <h3 class="mb-3 font-weight-normal">회원가입</h3>
        </div>
        <div class="mb-3">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <button onclick="sendEmail()" class="btn btn-primary">이메일 중복확인</button>
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

        <button type="submit" class="btn btn-primary">가입하기</button>

        <div class="text-end mt-2">
            <a href="/STP/login">로그인 페이지로...</a>
        </div>
    </form>
</div>
<br/>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>