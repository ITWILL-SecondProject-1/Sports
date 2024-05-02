package com.sports.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

@WebServlet("/adminFacility")
public class AdminFacilityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<FaVO> list = FaDAO.getList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("JSP/Admin/adminFacility.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
