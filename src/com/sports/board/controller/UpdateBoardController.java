package com.sports.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;

@WebServlet("/updateBoard")
public class UpdateBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));

		//수정할 게시글 조회
		BoardVO vo = BoardDAO.boardOne(bbsIdx);
		
		//vo수정
		vo.setSubject(subject);
		vo.setContent(content);
		
		//update처리
		int result = BoardDAO.boardUpdate(vo);
		System.out.println(result);
		
		//수정된 게시글 조회 페이지로 이동
		response.sendRedirect("viewBoardOne.jsp?bbsIdx=" + bbsIdx);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
