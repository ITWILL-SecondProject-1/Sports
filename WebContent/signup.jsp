<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sports</title>
<!--     <link rel="stylesheet" type="text/css" href="resources/static/mouse.css">
    <link rel="stylesheet" type="text/css" href="resources/static/auth.css"> -->
	<jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
	<jsp:include page = 'partials/mouse_css.jsp' flush = "false"/>
    <jsp:include page = 'partials/auth_css.jsp' flush = "false"/>
</head>
<body>
<jsp:include page = 'partials/navbar.jsp' flush = "false"/>
<div class="cursor" id="cursor"></div>
<div class="auth-wrapper">
    <form method="POST" action="/auth/signup">
        <div class="text-center">
            <h3 class="mb-3 font-weight-normal">회원가입</h3>
        </div>
        <div class="mb-3">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
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

        <button type="submit" class="btn btn-primary">가입하기</button>

        <div class="text-end mt-2">
            <a href="/login">로그인 페이지로...</a>
        </div>
    </form>
</div>
<br/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<script src="scripts/cursor.js"></script>
</body>
</html>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>