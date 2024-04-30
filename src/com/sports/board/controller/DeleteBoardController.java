package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardDAO;

@WebServlet("/deleteBoard")
public class DeleteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		System.out.println("bbsIdx : " + bbsIdx);
		
		int result = BoardDAO.boardDelete(bbsIdx);
		System.out.println(result);
		response.sendRedirect("board");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
