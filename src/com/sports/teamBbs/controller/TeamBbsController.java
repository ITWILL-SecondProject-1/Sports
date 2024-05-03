package com.sports.teamBbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.TeamDAO;
import com.sports.model.dao.TeamBbsDAO;
import com.sports.model.vo.TeamSignupVO;
import com.sports.model.vo.UserVO;

import Paging.BbsVO;
import Paging.Paging;


@WebServlet("/teamBbs")
public class TeamBbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		cPage : 현재페이지
		teamIdx : 팀인덱스
		
		- 응답파라메터 
		bbsUrl : 게시판 컨트롤러
		viewBbsUrl : 게시글작성 컨트롤러
		signupUrl : 팀 가입신청 수락/거절 컨트롤러
		teamVo : 팀Vo
		p : 페이징 객체 Paging
		memberList : 팀가입맴버 리스트
		signupList : 팀신청서 리스트
		list : 현재페이지 게시글 목록
		
		*/
		//게시글VO : TeamBbsVO, 게시글DAO : JoinBbsDAO
		String bbsUrl = "teamBbs";
		String viewBbsUrl = "teamBbsview";
		String writeBbsUrl = "teamBbsWrite";
		String signupAcceptUrl = "teamSignupAccept";
		UserVO loginUser = (UserVO) request.getSession().getAttribute("UserVO");
		String teamIdx = request.getParameter("teamIdx");
		int numPerPage = 10; //페이지당 게시글수
		int pagePerBlock = 5; //블럭당 페이지수
		String responseUrl = "JSP/TeamBoard/teamBbs.jsp";
	
		/**/System.out.println(">>teamBbs");
		/**/System.out.println("    teamIdx : " + teamIdx);
		//********************
		
		//각각 처리 구현
		if(teamIdx == null) {
			System.out.println("    팀정보 없음");
			request.getRequestDispatcher(responseUrl).forward(request, response);
			return;
		}
		
		if(loginUser == null) {
			System.out.println("    로그인유저 아님");
			request.getRequestDispatcher(responseUrl).forward(request, response);
			return;
		}
		
		if(!TeamBbsDAO.isMyTeam(teamIdx, loginUser.getUseridx())) {
			System.out.println("    가입팀 아님");
			request.getRequestDispatcher(responseUrl).forward(request, response);
			return;
		}
		
		//페이징
		int totalRecord = TeamBbsDAO.getTotalCount(teamIdx); //DB의 총 게시글 개수
		Paging p = new Paging(numPerPage, pagePerBlock, totalRecord);
		String cPage = request.getParameter("cPage");
		if (cPage == null || cPage.length() == 0) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//팀 맴버 리스트
		List<UserVO> memberList = TeamBbsDAO.getTeamMembers(teamIdx);
		/**/System.out.println("    memberList : "+ memberList);
		
		//신청서&신청자 목록
		List<TeamSignupVO> signupList = TeamBbsDAO.getSignupList(teamIdx);
		
		//게시글 리스트 
		List<BbsVO> list = TeamBbsDAO.getBbsList(p.getBegin(),p.getEnd(), Integer.parseInt(teamIdx));
		
		//응답
		request.setAttribute("bbsUrl", bbsUrl);
		request.setAttribute("viewBbsUrl", viewBbsUrl);
		request.setAttribute("writeBbsUrl", writeBbsUrl);
		request.setAttribute("signupAcceptUrl", signupAcceptUrl);
		request.setAttribute("teamVo", TeamDAO.getOneTeam(teamIdx));
		/**/System.out.println("    teamVo : " + TeamDAO.getOneTeam(teamIdx));
		request.setAttribute("p", p);
		request.setAttribute("memberList", memberList);
		request.setAttribute("signupList", signupList);
		request.setAttribute("list", list);
		request.getRequestDispatcher(responseUrl).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
