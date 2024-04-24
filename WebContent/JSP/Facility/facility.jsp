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
            // 선택가능 날짜 조절
            var startDate = new Date(currentDate.valueOf());
            var endDate = new Date(currentDate.valueOf());

            startDate.setDate(startDate.getDate());
            endDate.setDate(endDate.getDate() + 7);

            return { start: startDate, end: endDate };
        }
    });
    calendar.render();
});


function receiveDataJson(data) {
	let timeTable = document.getElementById("reserve-time-table");
	timeTable.innerHTML = "";
	for (const [key, value] of Object.entries(data)) {
		timeTable.innerHTML += addRowTimeTableRow(key, value);
	}
	return;
};

function addRowTimeTableRow(key, value) {
	return '<tr>' +
	'<th scope="row" class="text-center">' + key + ':00' + '</th>' +
	  '<td>' + value + '</td>' +
	'</tr>'
}


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