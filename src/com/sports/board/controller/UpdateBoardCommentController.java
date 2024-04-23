package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardCommentDAO;
import com.sports.model.vo.BoardCommentVO;

@WebServlet("/updateBoardComment")
public class UpdateBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("commentIdx"));
		int commentIdx = Integer.parseInt(request.getParameter("commentIdx"));
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		String content = request.getParameter("content");
		
		BoardCommentVO vo = (BoardCommentVO) BoardCommentDAO.selectBoardCommentOne(commentIdx);
		vo.setContent(content);
		
		System.out.println(vo);
		
		int result = BoardCommentDAO.updateBoardComment(vo);
		System.out.println("result : " + result);
		
		response.sendRedirect("board/viewBoardOne.jsp?bbsIdx=" + bbsIdx);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
