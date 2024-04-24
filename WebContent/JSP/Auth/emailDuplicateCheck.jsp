<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sports.model.dao.UserDAO"%>
<%
    String email = request.getParameter("email");
	boolean isDuplicate = false;
    try {
    	isDuplicate = UserDAO.emailDuplicateCheck(email);
    } catch (Exception e) {
    	e.printStackTrace();
    }
    response.getWriter().write(isDuplicate ? "duplicate" : "not_duplicate");
%>