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
</script>
</head>
<body>
	<button onclick="location.href='board'">자유게시판</button >
	<button onclick="location.href='boardWrite.jsp'">자유게시판 글작성</button >
</body>
</html>