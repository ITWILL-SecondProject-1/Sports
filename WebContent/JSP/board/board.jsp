<%@page import="java.util.List"%>
<%@page import="com.sports.board.common.Paging"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@page import="com.sports.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//페이징 처리
	Paging p = new Paging();

	p.setTotalRecord(BoardDAO.getTotalCount());
	p.setTotalPage();
	
	System.out.println("전체게시글 수 : " + p.getTotalRecord());
	System.out.println("전체페이지 수 : " + p.getTotalPage());
	
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	int nowBlock = (p.getNowPage() - 1) / p.getPagePerBlock() + 1;
	p.setNowBlock(nowBlock);
	p.setEndPage(nowBlock * p.getPagePerBlock());
	p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	List<BoardVO> list = BoardDAO.boardList(p.getBegin(), p.getEnd());
	
	request.setAttribute("list", list);
	request.setAttribute("p", p);

	pageContext.setAttribute("p", p);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<title>Bootstrap Example</title>
<style>
	.right-box {
	  float: right;
	}
</style>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
	<div class="container">
		<h2>자유게시판</h2>
		<!-- 제목, 내용으로 검색 기능 -->
	    <div>
		<button onclick="location.href='boardWrite'" class="btn btn-danger right-box">글작성하기</button ><br>	    	
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
							<a href="viewBoardOne.jsp?bbsIdx=${vo.bbsIdx }">${vo.subject }</a>
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
		     	<a class="page-link" href="board.jsp?cPage=${p.beginPage - 1 }" aria-label="Previous">
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
		    		<li class="page-item"><a class="page-link" href="board.jsp?cPage=${pageNo }">${pageNo }</a></li>
		    	</c:otherwise>
		    </c:choose>
		    </c:forEach>
		    <c:if test="${p.endPage < p.totalPage }">
		     	<a class="page-link" href="board.jsp?cPage=${p.endPage + 1 }" aria-label="Next">
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