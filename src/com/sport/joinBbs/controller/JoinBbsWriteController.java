package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.TeamDAO;
import com.sports.model.vo.UserVO;

@WebServlet("/join_bbs_write")
public class JoinBbsWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*****************************
		- 요청 파라메터
		
		- 응답 파라메터
		teams : 로그인 유저가 가입한 팀 목록
		
		*/
		String bbsUrl = "join_bbs";//로그아웃시 돌려보냄
		String responseUrl = "join_bbs/join_bbs_write.jsp";
		//************************
		
		/**/System.out.println(">>join_bbs_write");
		UserVO loginUser = (UserVO) request.getSession().getAttribute("UserVO");
		
		//로그아웃이면 돌려보냄
		if(loginUser == null) {
			response.sendRedirect(bbsUrl);
			return;
		}
		
		//가입한 팀 목록 띄우기
		/**/System.out.println("    useridx : "+loginUser.getUseridx());
		request.setAttribute("teams", TeamDAO.getMyTeamList(loginUser.getUseridx()));
		
		request.getRequestDispatcher(responseUrl).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
