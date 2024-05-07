<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<script>
</script>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<style>
	.sidemenu > a {
		font-size: 1em;
		color: black;
	}
	#sidebarMenu {
		margin-top: 100px;
	}
	li .sidemenu {
		border: 1px solid black;
	}
	
	.sidemenu:hover {
		background: rgb(80% 0% 0%);
		opacity: 0.8;
	}
	
	.current {
		background: rgb(80% 0% 0%);	
		opacity: 0.8;
	}
	
	.facilityList {
		/*border: 1px solid black;*/
	}
	.chartjs-size-monitor-expand {
		/*border: 1px solid red;*/
	}
	.chartjs-size-monitor {
		/*border: 1px solid pink;*/
	}
	
	.m-1 {
		display: inline-block;
	}
	#facilityButton {
		text-align: center;
	}
</style>
<div class="container">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item sidemenu">
            <a class="nav-link" href="adminFacility">
              시설관리
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link current" href="adminBoard">자유게시판관리<span class="sr-only">(current)</span></a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    	<div class="chartjs-size-monitor container">
    		<div class="chartjs-size-monitor-expand">
    			<div class="facilityList card">
    				<div class="card-header">
						<h2>자유게시판관리</h2>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th id="boardButton">삭제</th>
							</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.bbsIdx }</td>
								<td>
									<a href="viewBoardOne?cPage=${nowPage }&bbsIdx=${vo.bbsIdx }">${vo.subject }</a>
								</td>
								<td>
									<a href="userpage?email=${UserDAO.indexToUserInfo(vo.useridx).getEmail() }">${vo.nickname }</a>
								</td>
								<td id="boardButton">
									<form method="post" class="m-1">
										<input type="button" class="btn btn-danger" onclick="deleteBoard(this.form)" value="삭제">
										<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
										<input type="hidden" name="cPage" value="${nowPage }">
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" >
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		    <%-- [이전]에 대한 사용 여부 처리 --%>
		    <c:if test="${p.beginPage == 1 }">
		   		<a class="page-link" aria-label="Previous">
		    </c:if>
		    <c:if test="${p.beginPage != 1 }">
		     	<a class="page-link" href="adminBoard?cPage=${p.beginPage - 1 }" aria-label="Previous">
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
		    		<li class="page-item"><a class="page-link" href="adminBoard?cPage=${pageNo }">${pageNo }</a></li>
		    	</c:otherwise>
		    </c:choose>
		    </c:forEach>
		    <c:if test="${p.endPage < p.totalPage }">
		     	<a class="page-link" href="adminBoard?cPage=${p.endPage + 1 }" aria-label="Next">
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
   			</div>
   			<div class="chartjs-size-monitor-shrink">
   				<div class="">
   				</div>
			</div>
		</div>
     </main> 
</div>
</div>
</body>
<script>
	
	async function deleteBoard(frm) {
	    const response = await fetch('/STP/deleteBoard2', {
	        method: 'POST', // HTTP 메소드 지정
	        headers: {
	            'Content-Type': 'application/json' // 컨텐츠 타입 헤더 설정
	        },
	        body: JSON.stringify({
	            bbsIdx: frm.bbsIdx.value,
	        }) // 전송할 데이터
	    });
	
	    if (response.ok) { // 응답 성공 체크
	        const jsonResponse = await response.json();
	        Swal.fire({
	            title: 'Success',
	            text: '게시물을 삭제하였습니다.',
	            icon: 'success',
	            didClose:() => {
	            	window.location.reload();	            }
	        });
	    } else {
	        Swal.fire({
	            title: 'Error',
	            text: '오류가 발생하였습니다.',
	            icon: 'error'
	        });
	    }
	}
</script>
</html>