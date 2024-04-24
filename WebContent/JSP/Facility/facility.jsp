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
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<%=facilityVO.getPhoneNumber()%>
</body>
</html>