package com.sports.fa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

@WebServlet("/list")
public class FaController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB에서 데이터 가져와서 list.jsp 페이지에서 사용할 수 있도록 전달
		process(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		List<FaVO> list = FaDAO.getList();
		
		//2. 응답페이지(fa.jsp)에 전달
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(fa.jsp)로 전환(포워딩)  
		request.getRequestDispatcher("fa.jsp").forward(request, response);
		
	}
}
