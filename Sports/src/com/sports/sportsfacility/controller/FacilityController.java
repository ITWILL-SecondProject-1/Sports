package com.sports.sportsfacility.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

import Paging.Paging;

/**
 * Servlet implementation class FacilityController
 */
@WebServlet("/facilityController")
public class FacilityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bbsUrl = "facilityController"; //게시판url
		int numPerPage = 8; //페이지당 게시글수
		int pagePerBlock = 5; //블럭당 페이지수
		//*****************************************
	
		//패이징클래스 생성
		int totalRecord = FaDAO.getList().size();
		Paging p = new Paging(numPerPage, pagePerBlock, totalRecord);
		String cPage = request.getParameter("cPage");
		if (cPage == null || cPage.length() == 0) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//페이지의 게시글리스트
		List<FaVO> list = FaDAO.getPagingList(p.getBegin(),p.getEnd());
		
		//응답
		request.setAttribute("bbsUrl", bbsUrl);
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.getRequestDispatcher("JSP/Facility/facilityList.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
