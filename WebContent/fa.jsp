<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋살장 목록</title>
</head>
<body>
<h1>풋살장 전체 목록</h1>
<table border="1">
    <tr>
        <th>시설 번호</th>
        <th>풋살장 이름</th>
        <th>풋살장 주소</th>
        <th>풋살장 번호</th>
        <th>수용량</th>
        <th>이벤트</th>
        <th>풋살장 사진</th>
        <th>사진 미리보기</th>
    </tr>
    <c:forEach var="vo" items="${list}">
        <tr>
            <td>${vo.facilityidx}</td>
            <td>${vo.facilityname}</td>
            <td>${vo.address}</td>
            <td>${vo.phonenumber}</td>
            <td>${vo.capacity}</td>
            <td>${vo.event}</td>
            <td><img src="${vo.image}" alt="Facility Image" style="width:100px; height:auto;"></td>
            <td><img src="${vo.imagepi}" alt="Facility Image Preview" style="width:100px; height:auto;"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
