package com.sports.sportsfacility.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetReserveDataController
 */
@WebServlet("/get-reserve-data")
public class GetReserveDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 클라이언트로부터 date 파라미터를 가져옵니다.
        String date = req.getParameter("date");
        String facilityIdx = req.getParameter("facilityIdx");
        
        // 응답 설정
        res.setContentType("application/json");
        res.getWriter().write("{\"message\": \"Date received: " + date + "\"}");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
