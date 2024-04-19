<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserPage</title>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../partials/commonhead.jsp' flush = "false"/>
</head>
<body>
<!-- 공통 링크 로딩 -->
<jsp:include page = '../partials/commonbody.jsp' flush = "false"/>
<%	
	pageContext.setAttribute("auth", false);
	String ReqEmail = ((String) request.getAttribute("email"));
	UserVO userVO = ((UserVO) session.getAttribute("UserVO"));
	if (userVO != null & ReqEmail != null) {
		pageContext.setAttribute("auth", ReqEmail.equals(userVO.getEmail()));		
	}
	if ((boolean) pageContext.getAttribute("auth")) {
%>

<%	} else {  %>

<%  }  %>
들어오기 성공
</body>
</html>