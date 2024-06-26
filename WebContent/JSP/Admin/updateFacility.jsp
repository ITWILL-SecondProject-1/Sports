<%@page import="com.sports.model.dao.FaDAO"%>
<%@page import="com.sports.model.vo.FaVO"%>
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
	function UpdateFacility(frm) {
		var faName = document.getElementById('faName').value;
		console.log(faName);
		var address = document.getElementById('address').value;
		var phone = document.getElementById('phone').value;
		var capacity = document.getElementById('capacity').value;
		var openTime = parseInt(document.getElementById('openTime').value, 10);
		var closeTime = parseInt(document.getElementById('closeTime').value, 10);

		if (faName.length == 0) {
			emptyFaNameAlert();
			return false;
		}
		
		if (address.length == 0) {
			emptyAddressAlert();
			return false;
		}

		if (phone.length == 0) {
			emptyPhoneAlert();
			return false;
		}
		
		if (capacity.length == 0) {
			emptyCapacityAlert();
			return false;
		}

		if (openTime > closeTime) {
			emptyTimeAlert();
			return false;
		}
		
		frm.action="addFacility";
		frm.submit();
	}
	
	function go_back() {
		window.history.back();
	}
	
	function emptyFaNameAlert() {	
		Swal.fire({
		  icon: "error",
		  title: "empty...",
		  text: "시설 이름이 없습니다!",
		  footer: '<span style="color:indianred">시설 이름을 입력해 주세요.</span>'
		});
	}

	function emptyPhoneAlert() {	
		Swal.fire({
		  icon: "error",
		  title: "empty...",
		  text: "시설의 전화번호가 없습니다!",
		  footer: '<span style="color:indianred">시설의 번호를 입력해 주세요.</span>'
		});
	}

	function emptyAddressAlert() {	
		Swal.fire({
		  icon: "error",
		  title: "empty...",
		  text: "시설의 주소가 없습니다!",
		  footer: '<span style="color:indianred">시설의 주소를 입력해 주세요.</span>'
		});
	}

	function emptyCapacityAlert() {	
		Swal.fire({
		  icon: "error",
		  title: "empty...",
		  text: "시간당 이용가능 인원이 없습니다!!",
		  footer: '<span style="color:indianred">시간당 이용가능 인원을 입력해 주세요.</span>'
		});
	}

	function emptyTimeAlert() {	
		Swal.fire({
		  icon: "error",
		  title: "time error...",
		  text: "시간값이 정확하지 않습니다!",
		  footer: '<span style="color:indianred">시간을 정확히 선택해주세요.</span>'
		});
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
<style>
	.popover {
	    max-width: 500px !important; /* 팝오버 최대 너비 설정 */
	}
	
	.popover .popover-body {
	    max-height: 500px; /* 팝오버 내부 내용의 최대 높이 설정 */
	    overflow: auto; /* 필요 시 스크롤바 표시 */
	}
	.popover-body img {
		    width: 100%; /* 너비를 컨테이너에 맞춤 */
		    height: 480px; /* 높이를 고정 */
		    object-fit: contain; /* 이미지를 컨테이너 내에 맞추어 전체가 보이게 함 */
		    margin: auto; /* 중앙 정렬을 위해 사용 */
	}
</style>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<%
	int facilityIdx = Integer.parseInt(request.getParameter("facilityIdx"));
	FaVO faVO = FaDAO.inquireData(facilityIdx);

	System.out.println(faVO);
	List<Integer> timeList = new ArrayList<>();
	for (int i = 0; i < 25; i++) {
		timeList.add(i, i);
	}
	
	pageContext.setAttribute("timeList", timeList);
	pageContext.setAttribute("faVO", faVO);
%>
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
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    	<div class="chartjs-size-monitor container">
    		<div class="chartjs-size-monitor-expand">
    			<div class="facilityList card p-3">
    				<div class="card-header">
						<h2>시설수정하기</h2>
					</div>
    				<form method="post" enctype="multipart/form-data">
    					<input type="hidden" name="facilityIdx" value="${faVO.facilityIdx }">
						<div class="mb-3">
							<label for="faName" class="form-label">이름</label>
							<input type="text" name="faName" class="form-control" placeholder = "시설이름을 입력해주세요!!" id="faName" value="${faVO.facilityName }">
						</div>
						<div class="mb-3">
							<label for="address" class="form-label">주소</label>
							<input type="text" name="address" class="form-control" placeholder = "시설주소를 입력해주세요!!" id="address" value="${faVO.address }">
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">전화번호</label>
							<input type="text" name="phone" class="form-control" placeholder = "전화번호를 입력해주세요!!" id="phone" value="${faVO.phoneNumber }">
						</div>
						<div class="mb-3">
							<label for="DateRangeForReservation" class="form-label">예약가능 일수</label>
							<input type="number" name="DateRangeForReservation" class="form-control" placeholder = "수용인원을 입력해주세요!!" id="DateRangeForReservation" value="<%=faVO.getDateRangeForReservation()%>">
						</div>
						<div class="mb-3">
							<label for="capacity" class="form-label">수용인원</label>
							<input type="number" name="capacity" class="form-control" placeholder = "수용인원을 입력해주세요!!" id="capacity" value="${faVO.capacity }">
						</div>
						<div class="mb-3">
							<label for="event" class="form-label">종목</label>
							<select class="form-control" name="event" id="event" value="${faVO.event }">
								<c:choose>
									<c:when test="${faVO.event == '풋살'}">
										<option value="풋살" selected="selected">풋살</option>
										<option value="농구">농구</option>
	  									<option value="테니스">테니스</option>
									</c:when>
									<c:when test="${faVO.event == '농구' }">
										<option value="풋살">풋살</option>
										<option value="농구" selected="selected">농구</option>
	  									<option value="테니스">테니스</option>
									</c:when>
									<c:when test="${faVO.event == '테니스' }">
										<option value="풋살">풋살</option>
										<option value="농구">농구</option>
	  									<option value="테니스" selected="selected">테니스</option>
									</c:when>
								</c:choose>
							</select>
						</div>
						<div class="mb-3">
							<div>
								오픈
								<select class="form-control time" name="openTime" id="openTime">
								<c:forEach var="i" items="${timeList }">
									<c:choose>
										<c:when test="${faVO.openTime == i }">
											<option value="${i }" selected="selected">${i }:00</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }:00</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</select>
								 ~ 마감
								<select class="form-control time" name="closeTime" id="closeTime">
								<c:forEach var="i" items="${timeList }">
									<c:choose>
										<c:when test="${faVO.closeTime == i }">
											<option value="${i }" selected="selected">${i }:00</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }:00</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Card-Thumbnail</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="card-thumbnail" name="card-thumbnail" aria-describedby="card-thumbnail">
								<label class="custom-file-label" for="card-thumbnail">Choose file</label>
							</div>
						</div>
						
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Upload</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="images-carousel" name="images-carousel" aria-describedby="images" multiple>
								<label class="custom-file-label" for="images-carousel">Choose file</label>
							</div>
						</div>
						<c:if test="${imagesList.isEmpty() == false}">
						삭제할 이미지를 체크해주세요!
						    <c:forEach var="image" items="${imagesList}">
						        <div class="form-check card mb-1">
						            <input class="form-check-input imagesCheckList" type="checkbox" value="${image.imagePi}" id="${image.imagePi}" name="imagesCheckList">
						            <label class="form-check-label" for="image-${image.imagePi}" data-toggle="popover" data-placement="top" title="Image Preview" data-html="true" data-content="<img src='${image.image}'>">
						                ${image.image}
						            </label>
						        </div>
						    </c:forEach>
						</c:if>
						<input type="submit" class="btn btn-success" value="작성하기" onclick="updateFacilityOk(this.form)">
										<input type="button" class="btn btn-secondary" value="취소" onclick="go_back()">
					</form>
    			</div>
   			</div>
		</div>
     </main> 
</body>
<script>
	function updateFacilityOk(frm) {
		frm.action="updateFacilityOk";
		frm.submit();
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

	$(document).ready(function(){
	    // 팝오버 초기화
	    $('[data-toggle="popover"]').popover({
	        trigger: 'hover',  // 마우스 오버 시 팝오버 표시
	        container: 'body'  // 팝오버를 body 태그 내부에 배치 (위치 문제 해결)
	    });
	});
</script>
</html>