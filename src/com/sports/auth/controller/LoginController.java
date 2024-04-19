package com.sports.auth.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.sports.model.dao.UserDAO;
import com.sports.model.vo.UserVO;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	HttpSession session = req.getSession();
    	// 세션에 저장된 유저가 있을 경우에 다른페이지로 리디렉션 (일단은 페이지가 없으므로 회원가입 페이지. 추후 수정)
    	if (session.getAttribute("UserVO") != null) {
    		res.sendRedirect("/STP/signup");
    	} else {
    		// 아니면 로그인 페이지로 포워드 한다.
    		req.getRequestDispatcher("login.jsp").forward(req, res);
    	}
	}
	
	/*
	 * 로그인으로 입력받은 아이디와 패스워드를 UserVO타입으로 변환 후, 데이터베이스에 입력하여
	 * 해당하는 아이디가 있는 경우 로그인 처리. 로그인을 성공하면 다른 페이지로 리다이렉트를 하게 만듬.
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserVO user = new UserVO();
		UserVO resultUser = null;
	    try {
	        BeanUtils.populate(user, req.getParameterMap());
	        resultUser = UserDAO.login(user);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    // 로그인 실패시 
	    if (resultUser == null) {
	    	res.sendRedirect("/STP/login");
	    // 로그인 성공시
	    } else {
	    	HttpSession session = req.getSession();
	    	session.setAttribute("UserVO", resultUser);
	    	res.sendRedirect("/STP/main.jsp");
	    }
	   
	}

}
