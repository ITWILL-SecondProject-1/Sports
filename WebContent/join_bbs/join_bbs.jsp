<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page = '../partials/commonhead.jsp' flush = "false"/>
<title>Insert title here</title>
<style>
	.right-box {
	  float: right;
	}
</style>
<script>

/* 	function goWrite() {
		//로그인 유저가 아니면 쓰기창 못감
		if(${empty UserVO}){
			alert("로그인 후 이용가능 합니다");
			retrun;
		}
		location.href = "${writeBbsUrl }";
	} */
	
/* 	function writeBbs(frm){
		console.log(frm);
		console.log(frm.subject.value);
		if (frm.subject == null) {
			alert("제목이 작성되지 않았습니다");
		} else {
			alert("글작성 버튼 클릭");
  			frm.action = "join_bbs_write_ok";
			frm.submit(); 
		}
	} */
</script>
</head>
<body>
<jsp:include page = '../partials/commonbody.jsp' flush = "false"/>
<div class="container">
		<h2>팀모집 게시판</h2>
		<!-- 제목, 내용으로 검색 기능 -->
		<%-- 로그인 여부로 버튼 활성화 --%>
	    <div>
	    <c:if test="${empty UserVO}" >
			<button onclick="goWrite()" class="btn btn-secondary right-box">모집글작성하기</button ><br>	    	
	    </c:if>
	    <c:if test="${not empty UserVO}" >
			<!-- <button onclick="goWrite()" class="btn btn-danger right-box">모집글작성하기</button ><br> -->
			<!-- 모집글 작성 modal -->
				<button type="button" class="btn btn-primary right-box" data-toggle="modal" data-target="#staticBackdrop">
					모집글 작성하기
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				       	  <%@include file="../../join_bbs/joinBbsWrite-include.jsp" %>
				  
				</div>
			</c:if>
	    
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody id="tbody">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bbsIdx }</td>
						<td>
							<a href="${viewBbsUrl }?bbsIdx=${vo.bbsIdx }&cPage=${p.nowPage}">${vo.subject }</a>
						</td>
						<td>${vo.nickname }</td>
						<td>${vo.writeDate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<nav aria-label="Page navigation example" >
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		    <%-- [이전]에 대한 사용 여부 처리 --%>
		    <c:if test="${p.beginPage == 1 }">
		   		<a class="page-link" aria-label="Previous">
		    </c:if>
		    <c:if test="${p.beginPage != 1 }">
		     	<a class="page-link" href="${bbsUrl }?cPage=${p.beginPage - 1 }" aria-label="Previous">
		    </c:if>
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <%-- 페이지태그 --%>
		    <c:forEach var="pageNo" begin="${p.beginPage }" end="${p.endPage }">
		    <c:choose>
		    	<c:when test="${pageNo == p.nowPage }">
		    		<li class="page-item"><a class="page-link">${pageNo }</a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li class="page-item"><a class="page-link" href="${bbs }?cPage=${pageNo }">${pageNo }</a></li>
		    	</c:otherwise>
		    </c:choose>
		    </c:forEach>
		    <%-- [다음]에 대한 사용 여부 처리 --%>
		    <c:if test="${p.endPage < p.totalPage }">
		     	<a class="page-link" href="${bbsUrl }?cPage=${p.endPage + 1 }" aria-label="Next">
		    </c:if>
		    <c:if test="${p.endPage >= p.totalPage }">
		     	<a class="page-link" href="#" aria-label="Next">
		    </c:if>
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		</div>
	
</body>
</html>