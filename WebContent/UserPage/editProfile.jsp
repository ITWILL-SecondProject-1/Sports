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
                response.sendRedirect("/STP/userpage?email=" + resultUser.getEmail());  // 사용자 고유의 페이지로 리다이렉트
            } else {
                response.sendRedirect("/STP/login");  // 로그인 실패시 로그인 페이지로
            }
        } else {
            response.getWriter().write("Update failed");  // AJAX 호출이라 가정하고 실패 응답 전송
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("/STP/main.jsp");  // 메인 페이지로 리디렉션
    }
%>