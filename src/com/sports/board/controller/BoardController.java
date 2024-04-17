package com.sports.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전체글 데이터 가져오기
		List<BoardVO> list = BoardDAO.boardAll();
		System.out.println("list : " + list);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전체글 데이터 가져오기
		List<BoardVO> list = BoardDAO.boardAll();
		System.out.println("list : " + list);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board.jsp").forward(request, response);
		
		
	}
}
