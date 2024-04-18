package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.websocket.Session;

import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;
import com.sports.model.vo.UserVO;

/**
 * Servlet implementation class BoardWriteController
 */
@WebServlet("/writeBoard")
public class WriteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("UserVO");
		String useridx = vo.getUseridx();
		
		BoardVO boardVO = new BoardVO();
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		boardVO.setUseridx(useridx);
		boardVO.setSubject(request.getParameter("subject"));
		boardVO.setContent(request.getParameter("content"));
		
		int result = BoardDAO.boardInsert(boardVO);
		
		System.out.println(result);
		
		response.sendRedirect("board");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
