package com.sports.userpage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sports.board.common.Paging;
import com.sports.model.dao.BoardDAO;
import com.sports.model.vo.BoardVO;
import com.sports.model.vo.UserVO;

@WebServlet("/userpage")
public class UserPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		boolean auth = false;
		String email = req.getParameter("email");
	    UserVO userVO = ((UserVO) session.getAttribute("UserVO"));
		if (userVO != null & email != null) {
			if (userVO.getEmail() != null) {
				auth = userVO.getEmail().equals(email);
			}
		}
		
		//유저작성 게시글 목록
		String useridx = userVO.getUseridx();
		
		Paging p = new Paging();

		p.setTotalRecord(BoardDAO.getUserBoardCount(useridx));
		p.setTotalPage();
		
		System.out.println("전체게시글 수 : " + p.getTotalRecord());
		System.out.println("전체페이지 수 : " + p.getTotalPage());
		
		String cPage = req.getParameter("cPage");
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
		
	    List<BoardVO> list = BoardDAO.selectUserFreeBoards(p.getBegin(), p.getEnd(), useridx);
	    
	    req.setAttribute("p", p);
	    req.setAttribute("email", email);
	    req.setAttribute("freeBoardList", list);
	    req.setAttribute("auth", auth);
		req.getRequestDispatcher("JSP/UserPage/userPage.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
