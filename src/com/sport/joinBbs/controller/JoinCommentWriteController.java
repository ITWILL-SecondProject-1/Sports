package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.vo.JoinCommentVO;
import com.sports.model.vo.UserVO;

/**
 * Servlet implementation class JoinCommentWrite
 */
@WebServlet("/join_comment_write")
public class JoinCommentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**/System.out.println("    >>\"/join_comment_write\"");
		JoinCommentVO commVO = new JoinCommentVO();
		UserVO writerVO = (UserVO) request.getSession().getAttribute("UserVO");
		/**/System.out.println("writerVO : " + writerVO.toString());
		commVO.setNickname(writerVO.getNickname());
		commVO.setUseridx(writerVO.getUseridx());
		commVO.setBbsIdx(request.getParameter("bbsIdx"));
		commVO.setContent(request.getParameter("content"));
		//join_bbs_view?bbsIdx=${vo.bbsIdx }&cPage=${paging.nowPage}
		
		if (JoinBbsDAO.insertComment(commVO) == 1) {
			request.setAttribute("bbsIdx", request.getParameter("bbsIdx"));
			request.setAttribute("cPage", request.getParameter("cPage"));
			request.getRequestDispatcher("join_bbs_write").forward(request, response);
		};
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
