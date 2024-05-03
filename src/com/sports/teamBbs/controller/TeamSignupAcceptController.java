package com.sports.teamBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TeamSignupAcceptController
 */
@WebServlet("/teamSignupAccept")
public class TeamSignupAcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		signupIdx
		type : 수락-true, 거절-false 
		
		- 응답파라메터 
		
		
		*/
		/**/System.out.println(">>teamSignupAccept");
		
		//요청 받기
		String signupIdx = request.getParameter("signupIdx");
		String type = request.getParameter("type");
		/**/System.out.println("    signupIdx : "+signupIdx);
		/**/System.out.println("    type : "+type);
		
		//수락/거절 업데이트
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
