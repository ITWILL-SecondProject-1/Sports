package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.vo.TeamSignupVO;


/**
 * Servlet implementation class TeamSignupController
 */
@WebServlet("/sign_up_ok")
public class TeamSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeamSignupVO signupVO = new TeamSignupVO();
		signupVO.setTeamIdx(request.getParameter("teamIdx"));
		signupVO.setContent(request.getParameter("content"));
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
