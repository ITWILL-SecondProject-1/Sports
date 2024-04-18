<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo = (UserVO) session.getAttribute("UserVO");
	if (vo == null) {
%>
	<script>
		alert("로그인 후 작성 가능");
		//로그인 안했을 경우 로그인 창으로 넘기게 수정해야함!!!!!!!!!
		//우선 board로 넘겨놓음
		location.href="board";
	</script>	
<%		
	} else {
	System.out.println("vo : " + vo);
	String idx = vo.getUseridx();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성하기</title> 
<script>
	function go_boardWrite(frm) {
		frm.action="writeBoard";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>글 작성하기</h1>
	<form action="post">
		제목 : <input type="text" name="subject"><br>
		내용 : <input type="text" name="content"><br>
		<input type="submit" value="작성하기" onclick="go_boardWrite(this.form)">
	</form>
</body>
</html>