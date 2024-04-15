<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
    <jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
	<link rel="stylesheet" type="text/css" href="css/mouse.css?ver=1">
    <link rel="stylesheet" type="text/css" href="css/auth.css?ver=1"> 
</head>
<body>
<div class="cursor" id="cursor"></div>
<jsp:include page = 'partials/navbar.jsp' flush = "false"/>
<div class="auth-wrapper">
    <form method="POST" action="/auth/login">
        <div class="text-center">
            <h3 class="mb-3 font-weight-normal">로그인</h3>
        </div>
        <div class="mb-3">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="email">
        </div>
        <div class="mb-3">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>

        <div class="d-flex flex-column align-items-center">
            <div class="mb-2">
                <button type="submit" class="btn btn-primary">로그인</button>
            </div>
            <div class="mb-2">
                <a href="/auth/google">
                    <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1697744118/Noritur/web_neutral_sq_SU2x_k7etbi.png" alt="구글 로그인" />
                </a>
            </div>
            <div class="mb-2">
                <a href="/auth/kakao">
                    <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1697744118/Noritur/kakao_login_large_narrow_n6oxnr.png" alt="카카오 로그인" />
                </a>
            </div>
        </div>
        <div class="text-end mt-2">
            <a role="button" class="btn btn-info" href="/signup">회원 가입</a>
        </div>
    </form>
</div>
<br/>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>