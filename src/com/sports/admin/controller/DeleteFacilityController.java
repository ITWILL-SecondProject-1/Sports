package com.sports.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;

import com.sports.model.dao.FaDAO;

@WebServlet("/deleteFacility")
public class DeleteFacilityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int facilityIdx = Integer.parseInt(request.getParameter("facilityIdx"));
		FaDAO.deleteFacility(facilityIdx);
		
		response.sendRedirect("adminFacility");
	}

}