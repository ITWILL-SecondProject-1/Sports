package com.sports.sportsfacility.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sports.model.dao.BoardCommentDAO;
import com.sports.model.vo.BoardCommentVO;
import com.sports.model.vo.UserVO;

@WebServlet("/teamBoardWrite")
public class WriteTeamBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		rep.sendRedirect("main");
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		rep.sendRedirect("main");
	}

}
