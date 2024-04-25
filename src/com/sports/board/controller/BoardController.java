package com.sports.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.board.common.Paging;
import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리
		Paging p = new Paging();

		p.setTotalRecord(BoardDAO.getTotalCount());
		p.setTotalPage();
		
		System.out.println("전체게시글 수 : " + p.getTotalRecord());
		System.out.println("전체페이지 수 : " + p.getTotalPage());
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		int nowBlock = (p.getNowPage() - 1) / p.getPagePerBlock() + 1;
		p.setNowBlock(nowBlock);
		p.setEndPage(nowBlock * p.getPagePerBlock());
		p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		List<BoardVO> list = BoardDAO.boardList(p.getBegin(), p.getEnd());
		
		request.setAttribute("list", list);
		request.setAttribute("p", p);
		
		request.getRequestDispatcher("JSP/board/board.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
