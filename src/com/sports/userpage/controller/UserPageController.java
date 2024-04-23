package com.sports.userpage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	    List<BoardVO> list = BoardDAO.selectUserFreeBoards(email);
	    
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
