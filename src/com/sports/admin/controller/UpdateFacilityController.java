package com.sports.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.FaDAO;
import com.sports.model.dao.ImagesDAO;
import com.sports.model.vo.FaVO;
import com.sports.model.vo.ImagesVO;

@WebServlet("/updateFacility")
public class UpdateFacilityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facilityIdx = Integer.parseInt(request.getParameter("facilityIdx"));
		FaVO faVO = FaDAO.inquireData(facilityIdx);
		
		List<ImagesVO> imageList = ImagesDAO.imageList(faVO.getImageIdx());
		request.setAttribute("imagesList", imageList);
		
		request.getRequestDispatcher("JSP/Admin/updateFacility.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
