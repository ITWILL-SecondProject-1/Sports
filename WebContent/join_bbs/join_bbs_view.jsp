<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse: collapse;
	}
	table th, table td {
		border: 1px solid black;
		height: 1.3em;
	}
	
	#view {
		width: 700px;
	}
	table th{
		width: 20%;
	}
	
	table td{
		width: 80%;
	}
	.center {
		text-align: center;
	}
</style>
</head>
<body>
	<h1>팀 모집글 읽기[join_bbs_view]</h1>
	<button onclick="back()">뒤로가기</button>
	<button onclick="update()">수정하기</button>
	<div id="view">
	<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${vo.subject }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.nickname }</td>
			</tr>
			<tr>
				<th>종목</th>
				<td>${vo.event }</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>${vo.place }</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>${vo.memberMax }</td>
			</tr>
			<tr>
				<th>조건</th>
				<td>${vo.limit }</td>
			</tr>
			<tr>
				<c:if test="${empty vo.content }">
					<td colspan="2" class="center">- 내용없음 -</td>	
				</c:if>
				<c:if test="!${empty vo.content }">
					<td colspan="2" class="center">${vo.content }</td>	
				</c:if>
			</tr>
			<tr>
				<td colspan="2">댓글보기 ${commentslist.size() } ></td>		
			</tr>
			<c:forEach var="commVO" items="${commentslist }">
			<tr>
				<th>${commVO.nickname }</th>
				<td>${commVO.content }(${commVO.writeDate })</td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>