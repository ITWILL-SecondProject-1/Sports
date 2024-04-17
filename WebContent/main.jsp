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
		frm.action = "write";
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