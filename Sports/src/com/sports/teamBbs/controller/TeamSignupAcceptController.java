package com.sports.teamBbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.TeamDAO;
import com.sports.model.dao.TeamMemberDAO;
import com.sports.model.dao.UserDAO;
import com.sports.model.vo.TeamMemberVO;
import com.sports.model.vo.TeamSignupVO;
import com.sports.model.vo.UserVO;

/**
 * Servlet implementation class TeamSignupAcceptController
 */
@WebServlet("/teamSignupAccept")
public class TeamSignupAcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		signupIdx
		type : 수락-true, 거절-false 
		
		- 응답파라메터 
		teamIdx : 팀인덱스 - 팀게시판에 돌아가기위한 파라메터
		
		*/
		String responseUrl = "teamBbs";
		//*********************************8
		/**/System.out.println(">>teamSignupAccept");
		
		//요청 받기
		String signupIdx = request.getParameter("signupIdx");
		String type = request.getParameter("type");
		/**/System.out.println("    signupIdx : "+signupIdx);
		/**/System.out.println("    type : "+type);
		
		//수락/거절 버튼 누른사람이 팀장인지 확인?
		/*UserVO loginUser = (UserVO) request.getSession().getAttribute("UserVO");*/
		
		//signupIdx 로 signupVO 얻기
		TeamSignupVO signupVO = TeamDAO.getSignupVO(signupIdx);
		String teamIdx = signupVO.getTeamIdx();
		
		//수락/거절 업데이트 - 해당팀 같은유저의 신청서 전부 업데이트
		TeamSignupVO updSignupVO = new TeamSignupVO();
		updSignupVO.setUseridx(signupVO.getUseridx());
		updSignupVO.setTeamIdx(teamIdx);
		updSignupVO.setSignupCheck(type);
		
		int num = TeamDAO.updateTeamSignup(updSignupVO);
		/**/System.out.println("    신청서 업데이트 : " + num);
		
		//수락일경우 : 팀멤버 인서트
		if(type.equals("t")) {
			TeamMemberVO teamMemVO = new TeamMemberVO();
			teamMemVO.setTeamIdx(teamIdx);
			teamMemVO.setUseridx(signupVO.getUseridx());
			if(TeamMemberDAO.insertTeamMember(teamMemVO) == 1) {
				/**/System.out.println("    맴버인서트 성공");
			}
		}
		
		//응답
		response.sendRedirect(responseUrl + "?teamIdx="+ teamIdx);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
