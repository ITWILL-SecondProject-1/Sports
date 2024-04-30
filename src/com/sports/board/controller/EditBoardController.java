package com.sports.board.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sports.cloudinary.IMGManager;
import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.BoardDAO;
import com.sports.model.dao.ImagesDAO;
import com.sports.model.vo.BoardVO;
import com.sports.model.vo.ImagesVO;
import com.sports.model.vo.UserVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
	)
@WebServlet("/editBoard")
public class EditBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("UserVO");
		
		int bbsIdx = 0;
		int cPage = 0;
		
		try {
			bbsIdx = Integer.parseInt(req.getParameter("bbsIdx"));
			cPage = Integer.parseInt(req.getParameter("cPage"));
		} catch(Exception e) {
			// 잘못된 요청! 보드 메인으로 돌아간다!
			e.printStackTrace();
			res.sendRedirect("board");
			return;
		}

		//수정할 게시글 조회
		BoardVO boardVO = BoardDAO.boardOne(bbsIdx);
		boardVO.getUseridx();
		userVO.getUseridx();
		
		if (boardVO.getUseridx().equals(userVO.getUseridx())) {
			// 요청 유저의 유저 인덱스와 요청한 보드의 유저 인덱스가 같은 경우에만 forward
			req.setAttribute("boardVO", boardVO);
			List<ImagesVO> imageList = ImagesDAO.imageList(boardVO.getImageIdx());
			req.setAttribute("imagesList", imageList);
			req.setAttribute("cPage", cPage);
			req.getRequestDispatcher("JSP/board/editBoard.jsp").forward(req, res);
		} else {
			// 요청 유저의 유저 인덱스와, 요청한 보드의 유저 인덱스가 다를경우!
			// 보드의 메인으로 돌아간다!
			res.sendRedirect("board");
			return;
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();		
		IMGManager imageManager = new IMGManager();
		IMGUpload imageUpload = new IMGUpload();
		Collection<Part>parts = req.getParts();
		int bbsIdx = 0;
		int cPage = 0;
		UserVO userVO = (UserVO)session.getAttribute("UserVO");
		
		try {
			bbsIdx = Integer.parseInt(req.getParameter("bbsIdx"));
			cPage = Integer.parseInt(req.getParameter("cPage"));
		} catch(Exception e) {
			// 잘못된 요청! 보드 메인으로 돌아간다!
			e.printStackTrace();
			res.sendRedirect("board");
			return;
		}

		BoardVO boardVO = BoardDAO.boardOne(bbsIdx);
		
		// 요청 유저의 유저 인덱스와 요청한 보드의 유저 인덱스가 같은 경우에만 forward
		if (boardVO.getUseridx().equals(userVO.getUseridx())) {
			// 체크된 체크박스의 값들을 배열로 가져옴
			// input의 name과 매칭된다.
			String[] checkedImages = req.getParameterValues("imagesCheckList");
			try {
				imageManager.deleteCheckedImages(checkedImages);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			imageUpload.uploadImages(parts, boardVO.getImageIdx());
			boardVO.setSubject(req.getParameter("subject"));
			boardVO.setContent(req.getParameter("content"));
			if(BoardDAO.boardUpdate(boardVO) > 0) {
				res.sendRedirect("viewBoardOne?cPage=" + cPage + "&bbsIdx=" + bbsIdx);
				return;
			}
		} else {
			// 요청 유저의 유저 인덱스와, 요청한 보드의 유저 인덱스가 다를경우!
			// 보드의 메인으로 돌아간다!
			res.sendRedirect("board");
			return;
		}	
	}
}
