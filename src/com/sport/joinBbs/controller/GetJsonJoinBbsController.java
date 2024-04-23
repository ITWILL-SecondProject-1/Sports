package com.sport.joinBbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sport.joinBbs.vo.JoinBbsVO;


@WebServlet("/getJsonJoinBbs")
public class GetJsonJoinBbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**/System.out.println("    >>getJsonJoinBbs");
		/**/System.out.println("teamIdx : "+request.getParameter("teamIdx"));
		JoinBbsVO vo = JoinBbsDAO.getOndJoinBbsByTeamIdx(request.getParameter("teamIdx"));
		/**/System.out.println("vo : "+ vo.toString());
		
		request.setAttribute("bbsVO", vo);
	
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{");
		result.append("\"bbsIdx\":" + vo.getBbsIdx() + ", ");
		result.append("\"useridx\": \"" + vo.getUseridx() + "\", ");
		result.append("\"teamIdx\":" + vo.getTeamIdx() + ", ");
		result.append("\"subject\": \"" + vo.getSubject() + "\", ");
		result.append("\"time\": \"" + vo.getTime() + "\", ");
		result.append("\"memberMax\": \"" + vo.getMemberMax() + "\", ");
		result.append("\"limit\": \"" + vo.getLimit() + "\", ");
		result.append("\"place\": \"" + vo.getPlace() + "\", ");
		result.append("\"event\": \"" + vo.getEvent() + "\", ");
		result.append("\"content\": \"" + vo.getContent() + "\", ");
		result.append("\"writeDate\": \"" + vo.getWriteDate() + "\", ");
		result.append("\"image\": \"" + vo.getImage() + "\", ");
		result.append("\"image\": \"" + vo.getImage() + "\", ");
		result.append("\"teamName\": \"" + vo.getTeamName() + "\", ");
		result.append("\"nickname\": \"" + vo.getNickname() + "\", ");
		result.append("\"hit\": \"" + vo.getHit() + "\" ");
		result.append("}");
		
		//결과출력
		/**/System.out.println("result : "+result);
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
