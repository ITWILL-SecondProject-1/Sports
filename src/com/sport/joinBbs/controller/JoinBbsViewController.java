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
		/**/System.out.println("    >>\"/join_bbs_view\"");
		String bbsIdx = request.getParameter("bbsIdx");
		/**/System.out.println("bbsIdx : "+bbsIdx);
		JoinBbsVO vo = JoinBbsDAO.getOndJoinBbs(bbsIdx);
		List<JoinCommentVO> commlist = JoinBbsDAO.getCommentsList(bbsIdx);
		/**/System.out.println("vo : "+vo.toString());
		/**/System.out.println("commlist : "+commlist.toString());
		request.setAttribute("bbsIdx", bbsIdx);
		request.setAttribute("vo", vo);
		request.setAttribute("commentslist", commlist);
		request.setAttribute("cPage", request.getParameter("cPage"));
		request.getRequestDispatcher("join_bbs/join_bbs_view.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
