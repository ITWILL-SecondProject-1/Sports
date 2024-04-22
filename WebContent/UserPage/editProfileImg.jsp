<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.cloudinary.IMGUpload" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.sports.model.dao.UserDAO"%>
<%@ page import="org.apache.commons.beanutils.BeanUtils" %>
<%@ page import="com.sports.model.vo.UserVO" %>
<%
	IMGUpload imgUpload = new IMGUpload();
    boolean result = false;
    UserVO user = (UserVO) session.getAttribute("UserVO");
    try {
        Part filePart = request.getPart("img");
        Map<String, String> resultMap = imgUpload.uploadImage(filePart);
        if (resultMap.get("url") != null & resultMap.get("public_id") != null) {
            imgUpload.deleteImage(UserDAO.getUserInfo(user.getEmail()).getImage_pi());	
        } else {
            response.getWriter().write("EditFailed");
        }
        user.setImage(resultMap.get("url"));
        user.setImage_pi(resultMap.get("public_id"));
        if (UserDAO.editProfileImg(user)) {
            result = true;
            session.setAttribute("UserVO", UserDAO.login(user));
        } else {
            response.getWriter().write("EditFailed");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.getWriter().write(result ? "true" : "false");
%>