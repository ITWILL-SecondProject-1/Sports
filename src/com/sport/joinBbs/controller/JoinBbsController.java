package com.sport.joinBbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.common.Paging;
import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.vo.JoinBbsVO;

/**
 * Servlet implementation class Join_BbsController
 */
@WebServlet("/join_bbs")
public class JoinBbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		현재페이지에 표시할 데이터를 화면에 표시 
		1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
		2. 페이징 객체에 설정할 데이터 저장(만들어서)
		3. (DB) 전체 데이터 건수 조회
		4. (DB) 현재 페이지 표시할 게시글 데이터 조회
		5. 데이터 화면 표시(화면컨트롤 - 스타일 지정)
		********************************/
		Paging p = new Paging(10, 5, JoinBbsDAO.getTotalCount());
		/**/int totalRecorde = JoinBbsDAO.getTotalCount();
		/**/System.out.println("totalRecorde : "+totalRecorde);
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		List<JoinBbsVO> list = JoinBbsDAO.getJoinBbsList(p.getBegin(),p.getEnd());
		/**/System.out.println("Paging  p : "+ p.toString());
		request.setAttribute("paging", p);
		request.setAttribute("list", list);
		request.getRequestDispatcher("join_bbs/join_bbs.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
