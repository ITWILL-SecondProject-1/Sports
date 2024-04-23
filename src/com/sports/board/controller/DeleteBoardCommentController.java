package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardCommentDAO;

@WebServlet("/deleteBoardComment")
public class DeleteBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentIdx = Integer.parseInt(request.getParameter("commentIdx"));
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		
		int result = BoardCommentDAO.deleteBoardComment(commentIdx);
		
		response.sendRedirect("board/viewBoardOne.jsp?bbsIdx=" + bbsIdx);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
