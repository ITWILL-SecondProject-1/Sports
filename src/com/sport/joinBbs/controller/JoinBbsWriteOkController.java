package com.sport.joinBbs.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.dao.TeamDAO;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sport.joinBbs.vo.TeamVO;
import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.TeamMemberDAO;
import com.sports.model.vo.TeamMemberVO;
import com.sports.model.vo.UserVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
	)
@WebServlet("/join_bbs_write_ok")
public class JoinBbsWriteOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMGUpload imgUpload;
	
	  @Override
	    public void init() {
	        this.imgUpload = new IMGUpload();
	    }
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*****************************
		- 요청 파라메터
		selectTeam : 새팀/기존팀 구분, 기존팀일경우 teamIdx값
		subject
		event
		place
		time
		memberMax
		limit
		content
		
		- 응답 파라메터
		bbsIdx : 작성글idx, 작성 후 글보기창 이동
		
		*/
		String responseUrl = "join_bbs"; //응답url
		//********************************
		
	    String imageUrl = null;
	    String imagePI = null;
	    
	    
		/**/System.out.println(">join_bbs_write_ok");
		String selectTeam = request.getParameter("selectTeam");
		/**/System.out.println("    selectTeam : "+selectTeam);
		
		UserVO loginUser = (UserVO) request.getSession().getAttribute("UserVO");
		String useridx = loginUser.getUseridx();
		String bbsIdx = JoinBbsDAO.getnewBbsIdx();
		/**/System.out.println("    bbsIdx : "+bbsIdx);
		/**/System.out.println("    useridx : "+loginUser.getUseridx());
		//게시글VO생성
		JoinBbsVO vo = new JoinBbsVO();
		vo.setBbsIdx(bbsIdx);
		vo.setUseridx(useridx);
		vo.setNickname(loginUser.getNickname());
		vo.setSubject(request.getParameter("subject"));
		vo.setEvent(request.getParameter("event"));
		vo.setPlace(request.getParameter("place"));
		vo.setTime(request.getParameter("time"));
		vo.setMemberMax(request.getParameter("memberMax"));
		vo.setLimit(request.getParameter("limit"));
		vo.setContent(request.getParameter("content"));
		vo.setTeamName(request.getParameter("teamName"));
		
		//이미지 처리
		Part filePart = request.getPart("image");
        if (filePart.getSize() != 0) {
            // 파일을 Cloudinary에 업로드
        	Map<String, String> resultMap = imgUpload.uploadImage(filePart);
            imageUrl = resultMap.get("url");
            imagePI = resultMap.get("public_id");
        }
		
		if(selectTeam.equals("newTeam")) {
			//새팀생성일 경우 팀insert
			TeamVO teamVo = new TeamVO();
			String teamIdx = TeamDAO.getnewTeamIdx();
			teamVo.setTeamIdx(teamIdx);
			teamVo.setUseridx(useridx);
			teamVo.setTeamName(vo.getTeamName());
			teamVo.setJoinCheck("true");
			teamVo.setLogo(imageUrl);
			teamVo.setLogoPi(imagePI);
			vo.setTeamIdx(teamIdx);
			/**/System.out.println("    insert)teamVo : "+teamVo);
			if(TeamDAO.insertTeam(teamVo) == 1) {
				System.out.println("    팀생성 성공");
			}
			
			//팀맴버테이블에 가입자로 인서트
			TeamMemberVO teamMem = new TeamMemberVO();
			teamMem.setTeamIdx(teamIdx);
			teamMem.setUseridx(useridx);
			/**/System.out.println("    teamMem : "+teamMem);
			if(TeamMemberDAO.insertTeamMember(teamMem) == 1) {
				System.out.println("    맴버인서트 성공");
			}
			
		} else {
			//기존팀 모집글경우 팀update
			TeamVO teamVo = new TeamVO();
			teamVo.setLogo(bbsIdx);
			teamVo.setTeamIdx(request.getParameter(selectTeam));
			teamVo.setTeamName(request.getParameter("teamName"));
			teamVo.setLogo(imageUrl);
			teamVo.setLogoPi(imagePI);
			/**/System.out.println("    update)teamVo : "+teamVo);
			TeamDAO.updateTeam(teamVo);
		}
		/**/System.out.println("    vo : "+vo);
		//모집글insert
		if(JoinBbsDAO.insertJoinBbs(vo) == 1) {
			System.out.println("    모집글 입력 성공");
		}
		
//		request.setAttribute("bbsIdx", bbsIdx);
//		/**/System.out.println("    >bbsIdx : "+bbsIdx);
//		request.getRequestDispatcher(responseUrl + "?bbsIdx=" + bbsIdx).forward(request, response);
	
		response.sendRedirect(responseUrl + "?bbsIdx=" + bbsIdx);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
