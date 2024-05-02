<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.model.vo.FaVO"%>
<%@page import="com.sports.model.vo.ResVO"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@page import="com.sports.model.vo.ImagesVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	FaVO facilityVO = (FaVO) request.getAttribute("FaVO");
  	UserVO userVO = (UserVO) request.getAttribute("UserVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=facilityVO.getFacilityName()%></title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<style>
	.carousel-item {
    height: 500px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 컨테이너를 벗어나는 부분은 숨깁니다 */
	}

	.carousel-item img {
	    width: 100%; /* 너비를 컨테이너에 맞춤 */
	    height: 500px; /* 높이를 고정 */
	    object-fit: contain; /* 이미지를 컨테이너 내에 맞추어 전체가 보이게 함 */
	    margin: auto; /* 중앙 정렬을 위해 사용 */
	}
	#calender-card {
		height: 540px;
	}
	#time-card {
		max-height: 540px;
		overflow-y: scroll;
	}
	#reserve-submit-btn-div {
		position: relative;
		min-height:40px;
	}
	#reserve-submit-btn {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
	.reserve-table-row.zero {
    background-color: #ccc; /* 어두운 회색으로 설정 */
    color: #666; /* 텍스트 색상도 조금 어둡게 */
    pointer-events: none; /* 클릭 이벤트 비활성화 */
    cursor: not-allowed; /* 마우스 커서를 변경 */
	}
</style>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        themeSystem: 'bootstrap',
        height: 500,
        selectable: true,
        dateClick: function(info) {
            // AJAX 요청을 프로미스로 처리
            $.ajax({
                url: 'get-reserve-data', // 서버의 URL
                data: {
                    facilityIdx: <%=facilityVO.getFacilityIdx()%>,
                    date: info.dateStr // 선택된 날짜
                },
                type: 'GET'
            })
            .then(async function(response) {
                await receiveDataJson(response);
                selectedDate = info.dateStr;
                
            })
            .catch(function(xhr) {
                // 에러 처리 로직
                console.error('Error fetching data:', xhr.status);
            });
        },
        validRange: function(currentDate) {
            // 선택가능 날짜 조절(현재 날짜를 기준으로, 7일이란 기간을 잡았다.)
            var startDate = new Date(currentDate.valueOf());
            var endDate = new Date(currentDate.valueOf());
            startDate.setDate(startDate.getDate());
            endDate.setDate(endDate.getDate() + <%=facilityVO.getDateRangeForReservation()%>);

            return { start: startDate, end: endDate };
        }
    });
    calendar.render();
});

// Json을 받아서, 해당 데이터를 key, value를 얻기위해 iterator한다.
function receiveDataJson(data) {
    let timeTable = document.getElementById("reserve-time-table");
    timeTable.innerHTML = "";
    for (const [key, value] of Object.entries(data)) {
        let adjustedValue = Math.max(0, value); // 수용 가능 인원이 음수가 되지 않도록 조정
        timeTable.innerHTML += addRowTimeTableRow(key, adjustedValue);
    }
    return;
};

// key는 시간, value는 수용가능 인원을 나타낸다
// 선택한 날짜에 따라, 동적으로 html요소를 추가
// 만약 해당 value(수용가능 인원)이 0이면 zero클래스를 추가하여, 해당 시간대는 선택이 불가능하게 만든다.
function addRowTimeTableRow(key, value) {
	let zero = "";
	if (value == 0) {
		zero = "zero";
	}
	return '<tr class="reserve-table-row ' + zero + '" id=' + key + '>' +
	'<th scope="row" class="text-center">' + key + ':00' + '</th>' +
	  '<td>' + value + '</td>' +
	'</tr>';
}

// 예약 테이블 클릭시, 이벤트가 발생하는 함수
// 클래스에 제로(즉, 수용가능 인원이 0이면) 토글 이벤트가 발생하지 않는다.
$(document).ready(function() {
    $(document).on('click', '.reserve-table-row', function() {
    	let bbsreplll = $(this).attr('id');
    	if($(this).hasClass("zero") === true) {
    		return;
    	}
    	$(this).toggleClass("table-primary");
    	$(this).toggleClass("selected-time-row");
    	selectedTime = $(this).attr('id');
    });
});

// 추후 방향성
// 1. submit 버튼을 누르면, "#selected-time-row" 클래스들을 가져온다. 해당 클래스는 선택된 시간의 열에게만 있는 클래스이다.
// 2. 해당 클래스의 시간대와 HeadCount(예약할 인원수)를 서버에 보낸다.
// 3. db에서 유저가 선택한 시간대에 capacity - headcount의 값의 min이, 클라이언트가 보낸 HeadCount보다 크면 db에 예약을 넣는다.
// 4. 만약 HeadCount > min 의 관계가 될 경우, 데이터베이스에 예약을 넣지 않는다.
// 선택사항
//		- 달력에 날짜 클릭시 너무 흐리게 표시되서, 선명하게 표시 할 수 있게 만든다.
// 		- innerHTML로 구현했는데, 너무안좋은 방향 같음.... 다른 방안 있으면 개선
//		- 한 계정이 신청 가능한 최대 인원수를 정하는게 나을 것 같음 (계정당 인원수가 정해져 있지 않아서, 지금은 백명도 신청이 가능하다.)


$(document).ready(function() {
    // 예약 버튼에 이벤트 핸들러 바인딩
    $('#reserve-submit-btn').click(function() {
        // 인원수 입력 값 가져오기
        var headCount = $('#headCount').val();
        var selectedTimes = $('.selected-time-row').map(function() {
            return this.id; 
        }).get();
        
        // 예약 확인 창 표시
        if (confirm("예약하시겠습니까?")) {
            // AJAX 요청 전송
            $.ajax({
                url: 'submitReservation',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    facilityIdx: <%=facilityVO.getFacilityIdx()%>,
                    userIdx: <%=userVO.getUseridx()%>,
                    reserveDate: selectedDate,  
                    reserveTime: selectedTime,
                    headCount: headCount
                }),
                success: function(response) {
                    alert("예약 성공");
                    window.location.reload();
                },
                error: function(xhr) {
                    alert('예약 실패: 수용인원을 초과하였습니다'  );
                }
            });
        } else {
            // 사용자가 '아니요'를 선택했을 때
            alert("예약이 취소되었습니다.");
        }
    });
});

</script>
<div class="container" id="calender-container">
		<div class="row mb-4">
			<div class="col-6 card" id="calender-card">
				<div id='calendar' class="card-body"></div>
			</div>
			<div class="col"></div>
			<div class="col-5 card p-1" id="time-card">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col" class="text-center">Time</th>
							<th scope="col">maximum occupancy</th>
						</tr>
					</thead>
					<tbody id="reserve-time-table">
					</tbody>
				</table>
				<div class="input-group mb-3">
					<span class="input-group-text" id="HeadCount-label">HeadCount</span>
					<input type="number" class="form-control" id="headCount"
						aria-describedby="HeadCount-label">
				</div>

				<div id="reserve-submit-btn-div">
					<button type="button" class="btn btn-primary"
						id="reserve-submit-btn">Reserve</button>
				</div>
			</div>
		</div>
		<div class="row">
		<div class="col card">
				<c:if test="${imagesList.isEmpty() == false}">
					<div id="ImagesListCarousel" class="carousel slide card" data-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="image" items="${imagesList}" varStatus="status">
								<div class="carousel-item ${status.index == 0 ? 'active' : ''}" data-interval="10000">
									<img src="${image.image}" class="d-block w-100">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-target="#ImagesListCarousel" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-target="#ImagesListCarousel" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</button>
					</div>
				<hr>
				</c:if>
		</div>
	</div>
</div>
</body>
</html>