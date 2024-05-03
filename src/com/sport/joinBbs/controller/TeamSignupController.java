package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.TeamDAO;
import com.sport.joinBbs.vo.TeamSignupVO;
import com.sports.model.vo.UserVO;

@WebServlet("/sign_up_ok")
public class TeamSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		content : 신청서 내용
		bbsIdx : 모집글
		teamIdx : 모집글 팀 인덱스
		cPage : 모집글의 페이지
		
		- 응답파라메터 
		
		*/
		String responseUrl = "join_bbs"; //응답url
		//********************
		
		
		/**/System.out.println(">>sign_up_ok");
		UserVO userVO = (UserVO) request.getSession().getAttribute("UserVO");
		/**/System.out.println("    userVO : " + userVO.toString());
		TeamSignupVO signupVO = new TeamSignupVO();
		signupVO.setTeamIdx(request.getParameter("teamIdx"));
		signupVO.setContent(request.getParameter("content"));
		signupVO.setUseridx(userVO.getUseridx());
		signupVO.setSignupCheck("u");
		/**/System.out.println("    signupVO : " + signupVO.toString());
		if(TeamDAO.insertSignup(signupVO) == 1 ) {
			System.out.println("    신청서 입력완료");
		};
		
		response.sendRedirect(responseUrl);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
