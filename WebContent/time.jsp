<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
UserVO check = (UserVO)session.getAttribute("UserVO");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 달력 아래에 시간 선택 폼 배치 -->
	<div id="timeFormContainer" style="margin-top: 400px;">
		<h3>시간 선택</h3>
		<select id="timeSelect" class="form-control">
			<option value="09:00">09:00 ~ 10:00</option>
			<option value="10:00">10:00 ~ 11:00</option>
			<option value="11:00">11:00 ~ 12:00</option>
			<option value="12:00">12:00 ~ 13:00</option>
			<option value="13:00">13:00 ~ 14:00</option>
			<option value="14:00">14:00 ~ 15:00</option>
			<option value="15:00">15:00 ~ 16:00</option>
			<option value="16:00">16:00 ~ 17:00</option>
			<option value="17:00">17:00 ~ 18:00</option>
		</select>

		<button onclick="selectTime()">선택</button>
	</div>

	<script>

    function selectTime() {
        if (<%=check%> == null) {
            alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.");
            window.location.href = "/STP/login"; 
            return; // 함수 실행 중지
        }

        var selectedTime = document.getElementById("timeSelect").value;
        console.log(selectedTime); 
        window.opener.loadSelectedTime(selectedTime);
        window.close(); 
    }
    </script>
</body>
</html>