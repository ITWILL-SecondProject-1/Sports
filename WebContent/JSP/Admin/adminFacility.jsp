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
		border: 1px solid black;
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
            <a class="nav-link current" href="adminFacility">
              시설관리<span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="adminBoard">
              자유게시판관리
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Products
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Customers
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Reports
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Integrations
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    	<div class="chartjs-size-monitor container">
    		<div class="chartjs-size-monitor-expand">
    			<div class="facilityList card">
    				<div class="card-header">
						<h2>시설관리</h2>
					</div>
    				<button onclick="location.href='addFacility'" class="btn btn-secondary right-box" id="writeButton">시설추가</button ><br>	    	
					<table class="table table-hover">
						<thead>
							<tr>
								<th>시설번호</th>
								<th>이름</th>
								<th>주소</th>
								<th id="facilityButton">수정/삭제</th>
							</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.facilityIdx }</td>
								<td>${vo.facilityName }</td>
								<td>${vo.address }</td>
								<td id="facilityButton">
									<form method="post" class="m-1">
										<input type="button" class="btn btn-danger" onclick="updateFacility(this.form)" value="수정">
										<input type="hidden" name="facilityIdx" value="${vo.facilityIdx }">
									</form>
									<form method="post" class="m-1">
										<input type="button" class="btn btn-danger" onclick="deleteFacility(this.form)" value="삭제">
										<input type="hidden" name="facilityIdx" value="${vo.facilityIdx }">
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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
	function updateFacility(frm) {
		
	}
	
	function deleteFacility(frm) {
		confirm("삭제하시겠습니까?");
		frm.action = "deleteFacility";
		frm.submit();
	}
</script>
</html>