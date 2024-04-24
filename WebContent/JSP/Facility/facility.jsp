<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sports.model.vo.FaVO"%>
<%
	FaVO facilityVO = (FaVO) request.getAttribute("FaVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=facilityVO.getFacilityName()%></title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<style>
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
                await receiveDataJson(response)   
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
            endDate.setDate(endDate.getDate() + 7);

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
		timeTable.innerHTML += addRowTimeTableRow(key, value);
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
    });
});

// 추후 방향성
// 1. submit 버튼을 누르면, "#selected-time-row" 클래스들을 가져온다. 해당 클래스는 선택된 시간의 열에게만 있는 클래스이다.
// 2. 해당 클래스의 시간대와 HeadCount(예약할 인원수)를 서버에 보낸다.
// 3. db에서 유저가 선택한 시간대에 capacity - headcount의 값의 min이, 클라이언트가 보낸 HeadCount보다 크면 db에 예약을 넣는다.
// 4. 만약 HeadCount > min 의 관계가 될 경우, 데이터베이스에 예약을 넣지 않는다.

</script>
<div class="container" id="calender-container">
	<div class="row mb-4">
		<div class="col-6 card" id="calender-card">
			<div id='calendar' class="card-body"></div>
		</div>
	 	<div class="col">
		</div>
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
				<span class="input-group-text" id="HeadCount">HeadCount</span>
				<input type="number" class="form-control" aria-describedby="HeadCount">
			</div>
			<div id="reserve-submit-btn-div">
				<button type="button" class="btn btn-primary" id="reserve-submit-btn">Reserve</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col card">
			asdds
		</div>
	</div>
</div>
</body>
</html>