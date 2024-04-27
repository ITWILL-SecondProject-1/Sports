package com.sports.board.controller;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;
import com.sports.model.vo.UserVO;


@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
	)
@WebServlet("/boardWrite")
public class WriteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("JSP/board/boardWrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Collection<Part>parts = request.getParts();
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("UserVO");
		String useridx = vo.getUseridx();
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setUseridx(useridx);
		boardVO.setSubject(request.getParameter("subject"));
		boardVO.setContent(request.getParameter("content"));
		int result = BoardDAO.boardInsert(boardVO);
		System.out.println(result);
		
		// 파일들을 가져와서 이미지일 경우에만 업로드 (jpeg, png)
//		for (Part part : parts) {
//			if (part.getContentType().equals("image/jpeg") || part.getContentType().equals("image/png")) {
//				
//			}
//		}
		
		
		response.sendRedirect("board");
	}

}
