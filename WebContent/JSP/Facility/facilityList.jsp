<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋살장 목록</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<h1>풋살장 전체 목록</h1>
<table border="1">
    <tr>
        <th>시설 번호</th>
        <th>풋살장 이름</th>
        <th>풋살장 주소</th>
        <th>풋살장 번호</th>
        <th>이벤트</th>
        <th>운영시간</th>
        <th>수용량</th>
    </tr>
    <c:forEach var="facilityVO" items="${list}">
        <tr class="clickable-row" data-href="facility?type=inquire&index=${facilityVO.facilityIdx}">
            <td>${facilityVO.facilityIdx}</td>
            <td>${facilityVO.facilityName}</td>
            <td>${facilityVO.address}</td>
            <td>${facilityVO.phoneNumber}</td>
            <td>${facilityVO.event}</td>
            <td>${facilityVO.openTime} ~ ${facilityVO.closeTime}</td>
            <td>${facilityVO.capacity}</td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
// 각 테이블의 행을 누르면, 해당 시설 페이지로 이동하는 함수
document.addEventListener('DOMContentLoaded', function () {
	const rows = document.querySelectorAll('tr.clickable-row');
    rows.forEach(row => {
        row.addEventListener('click', function() {
            const href = this.getAttribute('data-href');
            if(href) {
                window.location.href = href;
            }
        });
    });
});
</script>
</html>
