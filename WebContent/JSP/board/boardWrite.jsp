<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성하기</title> 
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<script>
	function go_boardWrite(frm) {
		frm.action="boardWrite";
		frm.submit();
	}
</script>
</head>
<body>
<%
	UserVO vo = (UserVO) session.getAttribute("UserVO");
	if (vo == null) {
%>
	<script>
		alert("로그인 후 작성 가능");
		//로그인 안했을 경우 로그인 창으로 넘기게 수정해야함!!!!!!!!!
		//우선 board로 넘겨놓음
		location.href="login";
	</script>	
<%		
	} else {
	System.out.println("vo : " + vo);
	String idx = vo.getUseridx();
	}
%>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
	<div class="container">
		<h1>글 작성하기</h1>
		<form method="post">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" name="subject" class="form-control" id="exampleFormControlInput1">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  <textarea type="text" name="content" width="800px" height="800px" class="form-control" id="exampleFormControlTextarea1" required="required"></textarea>
			</div>
			<input type="submit" class="btn btn-danger" value="작성하기" onclick="go_boardWrite(this.form)">
		</form>
	</div>
	
</body>
</html>