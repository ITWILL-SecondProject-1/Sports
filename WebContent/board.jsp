<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

</head>
<body>
	<h2>자유게시판</h2>
	<select>
		<option value="1">제목</option>
		<option value="2">내용</option>
	</select>
	<input>
	<button>검색</button><br>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.bbsId }</td>
				<td>${vo.subject }</td>
				<td>${vo.writeDate }</td>
			</tr>
		</c:forEach>
		
			
		</tbody>
	</table>
</body>
</html>