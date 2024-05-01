package com.sports.sportsfacility.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaReserveVO;
import com.sports.model.vo.FaVO;

@WebServlet("/get-reserve-data")
public class GetReserveDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 클라이언트로부터 date 파라미터를 가져온다.
		Gson gson = new Gson();
        String date = req.getParameter("date");
        int facilityIdx = Integer.parseInt(req.getParameter("facilityIdx"));
        HashMap<Integer, Integer> reservationMap = new HashMap<Integer, Integer>();
        
        // 해당 시설의 오픈, 클로즈 시간 조회
        FaVO facility = FaDAO.inquireData(facilityIdx);
        FaReserveVO faReserveVO = new FaReserveVO();
        faReserveVO.setReserveDate(date);
        faReserveVO.setFacilityIdx(facilityIdx);
        int openTime = facility.getOpenTime();
        int closeTime = facility.getCloseTime();
        for (int i = openTime; i < closeTime; i++) {
        	faReserveVO.setReserveTime(i);
        	reservationMap.put(i, FaDAO.getReserveData(faReserveVO).getRemainingCapacity());
        };
        
        // 응답 설정
        res.setContentType("application/json");
        String jsonResponse = gson.toJson(reservationMap);
        res.getWriter().write(jsonResponse);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
