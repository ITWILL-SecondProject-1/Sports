package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sport.joinBbs.vo.TeamVO;


@WebServlet("/join_bbs_write_ok")
public class JoinBbsWriteOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**/System.out.println("    >join_bbs_write_ok");
		String isNew = request.getParameter("isNew");
		/**/System.out.println("isNew : "+isNew);
		if (isNew == null) {
		}
		
		
		String useridx = request.getParameter("useridx");
		/**/System.out.println("useridx : "+useridx);
		JoinBbsVO vo = new JoinBbsVO();
		vo.setUseridx(useridx);
		vo.setTeamIdx(useridx);
		vo.setSubject(request.getParameter("subject"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setEvent(request.getParameter("event"));
		vo.setPlace(request.getParameter("place"));
		vo.setTime(request.getParameter("time"));
		vo.setMemberMax(request.getParameter("memberMax"));
		vo.setLimit(request.getParameter("limit"));
		vo.setContent(request.getParameter("content"));
		
		if(isNew.equals("true")) {
			String teamIdx = JoinBbsDAO.getnewTeamIdx();
			TeamVO teamVo = new TeamVO();
			teamVo.setTeamIdx(teamIdx);
			teamVo.setUseridx(teamIdx);
			vo.setTeamIdx(teamIdx);
			JoinBbsDAO.insertTeam(teamVo);
		} else {
			
		}
		
		JoinBbsDAO.insertJoinBbs(vo);
		
		
		/* response.sendRedirect("join_bbs"); */
		//request.getRequestDispatcher("join_bbs_write").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
