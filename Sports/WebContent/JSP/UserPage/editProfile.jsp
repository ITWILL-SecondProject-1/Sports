<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.model.dao.UserDAO"%>
<%@ page import="org.apache.commons.beanutils.BeanUtils" %>
<%@ page import="com.sports.model.vo.UserVO" %>
<%
    UserVO user = new UserVO();
    boolean result = false;
    try {
        BeanUtils.populate(user, request.getParameterMap());
        result = UserDAO.editUserProfile(user);
        
        if (result) {
            UserVO resultUser = UserDAO.login(user);
            if (resultUser != null) {
                session.setAttribute("UserVO", resultUser);
            } else {
            	response.getWriter().write("LoginFailed");
            }
        } else {
            response.getWriter().write("EditFailed");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    response.getWriter().write(result ? "true" : "false");
%>