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

@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.getRequestDispatcher("signup.jsp").forward(req, res);
	}
	
	// BeanUtils를 사용하여 UserVO와 자동적으로 매핑하고, 해당 UserVO로 회원가입 처리.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    UserVO user = new UserVO();
	    boolean result = false;
	    try {
	        BeanUtils.populate(user, req.getParameterMap());
	        result = UserDAO.register(user);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    if (result == false) {
	    	res.sendRedirect("/STP/signup");
	    } else {
	    	res.sendRedirect("/STP/login");
	    }
	    
	}
	

}
