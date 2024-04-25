package com.sport.joinBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.dao.TeamDAO;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sport.joinBbs.vo.TeamVO;


@WebServlet("/join_bbs_write_ok")
public class JoinBbsWriteOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**/System.out.println("    >join_bbs_write_ok");
		String selectTeam = request.getParameter("selectTeam");
		/**/System.out.println("selectTeam : "+selectTeam);
		if (selectTeam == null) {
		}
		
		String bbsIdx = JoinBbsDAO.getnewBbsIdx();
		String useridx = request.getParameter("useridx");
		/**/System.out.println("bbsIdx : "+bbsIdx);
		/**/System.out.println("useridx : "+useridx);
		JoinBbsVO vo = new JoinBbsVO();
		
		vo.setBbsIdx(bbsIdx);
		vo.setUseridx(useridx);
		vo.setTeamIdx(request.getParameter("teamIdx"));
		vo.setSubject(request.getParameter("subject"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setEvent(request.getParameter("event"));
		vo.setPlace(request.getParameter("place"));
		vo.setTime(request.getParameter("time"));
		vo.setMemberMax(request.getParameter("memberMax"));
		vo.setLimit(request.getParameter("limit"));
		vo.setContent(request.getParameter("content"));
		vo.setTeamName(request.getParameter("teamName"));
		
		if(selectTeam.equals("newTeam")) {
			TeamVO teamVo = new TeamVO();
			String teamIdx = TeamDAO.getnewTeamIdx();
			teamVo.setTeamIdx(teamIdx);
			teamVo.setUseridx(useridx);
			teamVo.setTeamName(vo.getTeamName());
			vo.setTeamIdx(teamIdx);
			TeamDAO.insertTeam(teamVo);
		} else {
			TeamVO teamVo = new TeamVO();
			teamVo.setTeamIdx(request.getParameter("teamIdx"));
			teamVo.setTeamName(request.getParameter("teamName"));
			/**/System.out.println("teamVo : "+teamVo);
			TeamDAO.updateTeam(teamVo);
		}
		/**/System.out.println("vo : "+vo);
		JoinBbsDAO.insertJoinBbs(vo);
		
		
		/* request.setAttribute("bbsIdx", bbsIdx); */
		
		response.sendRedirect("join_bbs_view?bbsIdx="+bbsIdx);
		//request.getRequestDispatcher("join_bbs_write").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
