package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sports.model.dao.BoardCommentDAO;
import com.sports.model.vo.BoardCommentVO;
import com.sports.model.vo.UserVO;

@WebServlet("/writeBoardComment")
public class WriteBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment = request.getParameter("comment");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		System.out.println(request.getParameter("bbsIdx"));
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		
		//작성자 정보
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("UserVO");
		String useridx = vo.getUseridx();
		
		BoardCommentVO commentVO = new BoardCommentVO();
		commentVO.setContent(comment);
		commentVO.setUseridx(useridx);
		commentVO.setBbsIdx(bbsIdx);
		
		int result = BoardCommentDAO.writeBoardComment(commentVO);
		System.out.println(result);
		
		response.sendRedirect("viewBoardOne?cPage=" + nowPage + "&bbsIdx=" + bbsIdx);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
