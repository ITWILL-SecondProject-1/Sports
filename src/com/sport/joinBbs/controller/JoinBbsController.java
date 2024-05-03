package com.sport.joinBbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.common.Paging;
import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.dao.TeamDAO;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sports.model.vo.UserVO;

/**
 * Servlet implementation class Join_BbsController
 */
@WebServlet("/join_bbs")
public class JoinBbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		cPage : 현재페이지
		
		- 응답파라메터 
		bbsServlet : 게시판 서블릿 url매핑
		viewBbsServlet : 게시글작성 서블릿 url매핑
		teamSignupUrl : 가입신청URL
		p : 페이징 객체 Paging
		list : 현재페이지 게시글 목록
		teams : 로그인유저 가입팀목록
		
		*/
		//게시글VO : JoinBbsVO, 게시글DAO : JoinBbsDAO
		String bbsUrl = "join_bbs"; //게시판 서블릿 url매핑
		String viewBbsUrl = "join_bbs_view"; //게시글보기 서블릿 url매핑
		String writeBbsUrl = "join_bbs_write"; //게시글보기 서블릿 url매핑
		String teamSignupUrl = "sign_up_ok";
		String responseUrl = "join_bbs/join_bbs.jsp"; //응답url
		int numPerPage = 8; //페이지당 게시글수
		int pagePerBlock = 5; //블럭당 페이지수
		int totalRecord = JoinBbsDAO.getTotalCount(); //DB의 총 게시글 개수
		//**************************
		
		/**/System.out.println(">>\"/join_bbs\"");
		Paging p = new Paging(numPerPage, pagePerBlock, totalRecord);
		/**/int totalRecorde = JoinBbsDAO.getTotalCount();
		/**/System.out.println("    totalRecorde : " + totalRecorde);
		String cPage = request.getParameter("cPage");
		/**/System.out.println("    cPage : " + cPage);
		if (cPage == null || cPage.length() == 0) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(cPage));
		}
		List<JoinBbsVO> joinList = JoinBbsDAO.getJoinBbsList(p.getBegin(),p.getEnd());
		/**/System.out.println("    Paging  p : "+ p.toString());
		UserVO loginUser = (UserVO) request.getSession().getAttribute("UserVO");
		if(loginUser != null) {
			request.setAttribute("teams", TeamDAO.getMyTeamList(loginUser.getUseridx()));
		}
		request.setAttribute("bbsUrl", bbsUrl);
		request.setAttribute("viewBbsUrl", viewBbsUrl);
		request.setAttribute("writeBbsUrl", writeBbsUrl);
		request.setAttribute("teamSignupUrl", teamSignupUrl);
		request.setAttribute("p", p);
		request.setAttribute("joinList", joinList);
		request.getRequestDispatcher(responseUrl).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
