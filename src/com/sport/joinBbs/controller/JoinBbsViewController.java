package com.sport.joinBbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sport.joinBbs.vo.JoinCommentVO;


@WebServlet("/join_bbs_view")
public class JoinBbsViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*****************************
		- 요청 파라메터
		bbsIdx : 게시글 인덱스
		cPage : 현재페이지
		
		- 응답 파라메터
		vo : 게시글VO
		commentsList : 댓글리스트
		cPage : 현재페이지
		bbsUrl : 게시판 서블릿 url매핑
		updateBbsUrl : 게시글 수정 url
		deleteBbsUrl : 게시글 삭제 url
		updateCommentUrl : 댓글수정 url
		deleteCommentUrl : 댓글삭제 url
		teamSignupUrl : 팀 가입신청 url
		*/
		//게시글VO : JoinBbsVO, 게시글DAO : JoinBbsDAO
		//댓글VO : JoinBbsDAO
		String bbsUrl = "join_bbs";
		String updateBbsUrl = "";
		String deleteBbsUrl = "";
		String writeCommentUrl = "join_comment_write";
		String updateCommentUrl = "";
		String deleteCommentUrl = "";
		String teamSignupUrl = "sign_up_ok";
		String responseUrl = "join_bbs/join_bbs_view.jsp";
		//*****************
		
		/**/System.out.println(">>join_bbs_view");
		String bbsIdx = request.getParameter("bbsIdx");
		/**/System.out.println("    bbsIdx : "+bbsIdx);
		
		//게시글
		JoinBbsVO vo = JoinBbsDAO.getOndJoinBbs(bbsIdx);
		
		//댓글
		List<JoinCommentVO> commlist = JoinBbsDAO.getCommentsList(bbsIdx);
		/**/System.out.println("    vo : "+vo.toString());
		/**/System.out.println("    commlist : "+commlist.toString());
		
		//가입여부 확인
		
		//신청여부 확인
		
		//응답
		request.setAttribute("bbsUrl", bbsUrl);
		request.setAttribute("updateBbsUrl", updateBbsUrl);
		request.setAttribute("deleteBbsUrl", deleteBbsUrl);
		request.setAttribute("writeCommentUrl", writeCommentUrl);
		request.setAttribute("deleteCommentUrl", updateCommentUrl);
		request.setAttribute("deleteCommentUrl", deleteCommentUrl);
		request.setAttribute("teamSignupUrl", teamSignupUrl);
		
		request.setAttribute("vo", vo);
		request.setAttribute("commentList", commlist);
		request.setAttribute("cPage", request.getParameter("cPage"));
		request.getRequestDispatcher(responseUrl).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
