<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	//null 확인
	
	function go_addFacility(frm) {
		alert(frm.faName.value);
		if (frm.faName.value.trim() == "") {
			alert("시설이름을 입력하세요");
			return false;
		}
		if (frm.address.value.trim() == "") {
			alert("시설주소를 입력하세요");
			return false;
		}
		if (frm.phone.value.trim() == "") {
			alert("전화번호를 입력하세요");
			return false;
		}
		if (frm.event.value.trim() == "") {
			alert("종목을 입력하세요");
			return false;
		}
		if (frm.openTime.value.trim() == "") {
			alert("오픈시간을 입력하세요");
			return false;
		}
		if (frm.closeTime.value.trim() == "") {
			alert("마감시간을 입력하세요");
			return false;
		}
		
		frm.action="addFacility";
		frm.submit();
	}
	
	function go_back() {
		window.history.back();
	}
	
	// 파일 입력칸의 라벨을 입력한 파일의 개수로 바꿔주는 코드
	$(document).ready(function() {
	    $('.custom-file-input').on('change', function() {
	        // 선택된 파일 개수
	        var filesCount = $(this).get(0).files.length;

	        if (filesCount === 1) {
	            // 단일 파일 선택 시, 파일 이름을 표시
	            var fileName = $(this).val().split('\\').pop();
	            $(this).siblings('.custom-file-label').text(fileName);
	        } else {
	            // 여러 파일 선택 시, 파일 개수를 표시
	            $(this).siblings('.custom-file-label').text(filesCount + ' files selected');
	        }
	    });
	});
</script>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<%
	List<Integer> timeList = new ArrayList<>();
	for (int i = 0; i < 25; i++) {
		timeList.add(i, i);
	}
	
	pageContext.setAttribute("timeList", timeList);
%>
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
	.time {
		width: 100px;
		display: inline-block;
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
    			<div class="facilityList card p-3">
    				<div class="card-header">
						<h2>시설추가하기</h2>
					</div>
    				<form method="post" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="faName" class="form-label">이름</label>
							<input type="text" name="faName" class="form-control" placeholder = "시설이름을 입력해주세요!!" id="faName" required>
						</div>
						<div class="mb-3">
							<label for="address" class="form-label">주소</label>
							<input type="text" name="address" class="form-control" placeholder = "시설주소를 입력해주세요!!" id="address" required>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">전화번호</label>
							<input type="text" name="phone" class="form-control" placeholder = "전화번호를 입력해주세요!!" id="phone" required>
						</div>
						<div class="mb-3">
							<label for="event" class="form-label">종목</label>
							<select class="form-control" name="event" id="event">
	  							<option>풋살</option>
	  							<option>농구</option>
	  							<option>테니스</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="time" class="form-label">이용시간</label><br>
							<select class="form-control time" name="openTime" id="openTime">
							<c:forEach var="i" items="${timeList }">
								<option>${i }:00</option>
							</c:forEach>
							</select>
							 ~ 
							<select class="form-control time" name="closeTime" id="closeTime">
							<c:forEach var="i" items="${timeList }">
								<option>${i }:00</option>
							</c:forEach>
							</select>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="images">Upload</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="images" name="images" aria-describedby="images" multiple>
								<label class="custom-file-label" for="images">Choose file</label>
							</div>
						</div>
						<input type="submit" class="btn btn-secondary" value="작성하기" onclick="go_addFacility(this.form)">
						<input type="button" class="btn btn-secondary" value="취소" onclick="go_back()">
					</form>
    			</div>
   			</div>
   			
		</div>
     </main> 

</body>
</html>