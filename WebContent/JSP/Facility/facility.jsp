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
	.calender-card {
		height: 540px;
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
		height: 500,
		selectable: true,
		dateClick: function(info) {
            // AJAX 요청
            $.ajax({
                url: 'get-reserve-data', // 서버의 URL
                data: {
                	facilityIdx: <%=facilityVO.getFacilityIdx()%>,
                    date: info.dateStr // 선택된 날짜
                },
                type: 'GET',
                success: function(response) {
                    // 성공적으로 데이터를 받아왔을 때의 처리 로직
                    console.log('Data received:', response);
                    alert('Data for ' + info.dateStr + ': ' + response);
                },
                error: function(xhr, status, error) {
                    // 에러 처리 로직
                    console.error('Error fetching data:', error);
                }
            });
		},
		validRange: function(currentDate) {
			// 선택가능 날짜 조절
		    var startDate = new Date(currentDate.valueOf());
		    var endDate = new Date(currentDate.valueOf());
	
		    startDate.setDate(startDate.getDate());
		    endDate.setDate(endDate.getDate() + 7);
	
		    return { start: startDate, end: endDate };
		}});
	calendar.render();
});

/* $('#calendar'). */
</script>
<div class="container" id="calender-container">
	<div class="row">
		<div class="col-7">
			<div class="card calender-card">
				<div id='calendar' class="card-body"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>