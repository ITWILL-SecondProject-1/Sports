<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
	<!-- 공통 링크 로딩 -->
	<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
	<!-- 회원가입, 로그인 창 스타일 -->
    <jsp:include page = '../../css/authStyle.jsp' flush = "false"/>
</head>
<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<div class="auth-wrapper">
    <form method="POST" action="/STP/login">
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
        <div class="text-end mt-2">
            <a role="button" class="btn btn-info" href="/STP/signup">회원 가입</a>
        </div>
    </form>
</div>
</body>
</html>