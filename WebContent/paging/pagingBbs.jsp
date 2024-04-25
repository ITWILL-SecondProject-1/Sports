<%@page import="com.sport.joinBbs.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bbs table {
		border-collapse: collapse;
	}
	#bbs th, #bbs td {
		border: 1px solid black;
		text-align: center;
	}
	#bbs .align-left { text-align: left; }
	.paging { list-style: none; }
	.paging li {
		border: 1px solid black;
		float: left;
		padding: 3px 7px;
	}

</style>
<script>
	function goWrite(frm) {
		location.href = "${bbs_write }";
	}
	
</script>
</head>
<body>
	<h1>[paging_jsp_formet.jsp]</h1>
	<div>
			<button onclick="goWrite()">글쓰기</button>
	</div>
	<hr>
	<div id="bbs">
	<table>
		<caption>모집글 목록</caption>
		<thead>
			<tr>
				<th class="no">번호</th>
				<th class="subject">제목</th>
				<th class="writer">글쓴이</th>
				<th class="regdate">날짜</th>
				<th class="hit">조회수</th>
			</tr>
		</thead>
		<tbody>
		<%-- 게시글목록 출력 --%>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.bbsIdx }</td>
				<td class="align-left">
					<a href="${bbs_view }?bbsIdx=${vo.bbsIdx }&cPage=${paging.nowPage}">${vo.subject }</a>
				</td>
				<td>${vo.nickname }</td>
				<td>${vo.writeDate }</td>
				<td>${vo.hit }</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<ol class="paging">
					<%--[이전]에 대한 사용여부 처리 --%>
					<c:if test="${paging.beginPage == 1 }">
						<li class="disable">이전</li> 
					</c:if>
					<c:if test="${paging.beginPage != 1 }">
						<li>
							<a href="${bbs }?cPage=${paging.beginPage - 1 }">이전</a>
						</li>
					</c:if>
					<%--블록내에 표시할 페이지 태그 작성(시작~끝) --%>
						<c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
						<c:choose>
						<c:when test="${pageNo == paging.nowPage }">
							<li class="now">${pageNo }</li>
						</c:when>
						<c:otherwise>
							<li><a href="${bbs }?cPage=${pageNo }">${pageNo }</a></li>
						</c:otherwise>
					</c:choose>
						</c:forEach>
					<%--[다음]에 대한 사용여부 처리 --%>
					<c:if test="${paging.endPage == paging.totalPage }">
						<li class="disable">다음</li> 
					</c:if>
					<c:if test="${paging.endPage != paging.totalPage }">
						<li>
							<a href="${bbs }?cPage=${paging.endPage + 1 }">다음</a>
						</li>
					</c:if>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
</body>
</html>