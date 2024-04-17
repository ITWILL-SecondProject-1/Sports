<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script>
	function all_board(frm) {
		frm.action = "board";
		frm.submit();
	}
	function write_board(frm){
		<%
			UserVO vo = (UserVO) session.getAttribute("UserVO");
			System.out.println(vo);
			session.setAttribute("UserVO", vo);
		%>
		frm.action = "boardWrite";
		frm.submit();
	}
</script>
</head>
<body>
	<form method="post">
		<input type="button" value="자유게시판" onclick="all_board(this.form)">
		<input type="button" value="글작성" onclick="write_board(this.form)">
	</form>
</body>
</html>