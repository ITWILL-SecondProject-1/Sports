<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>팀원모집글 작성[join_bbs_write]</h1>
	<form method="post">
		<select name="idx">
			<option value="0">team1</option>
			<option value="1">team2</option>
			<option value="2">team3</option>
			<option value="3">새팀 만들기</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" name="동적검색">
	</form>
</body>
</html>