package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;

@WebServlet("/viewBoardOne")
public class ViewBoardOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터값 추출
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		
		BoardVO vo = BoardDAO.boardOne(bbsIdx);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("JSP/board/viewBoardOne.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
