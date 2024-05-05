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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**/System.out.println(">>getJsonJoinBbs");
		/**/System.out.println("    teamIdx : " + request.getParameter("teamIdx"));
		JoinBbsVO vo = JoinBbsDAO.getOndJoinBbsByTeamIdx(request.getParameter("teamIdx"));
		/**/System.out.println("    vo : "+ vo);

		request.setAttribute("bbsVO", vo);

		// JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("[{\"key\":\"bbsIdx\",\"value\":\""+ vo.getBbsIdx() + "\"},");
		result.append("{\"key\":\"useridx\",\"value\":\""+ vo.getUseridx() + "\"},");
		result.append("{\"key\":\"teamIdx\",\"value\":\""+ vo.getTeamIdx() + "\"},");
		result.append("{\"key\":\"subject\",\"value\":\""+ vo.getSubject() + "\"},");
		result.append("{\"key\":\"time\",\"value\":\""+ vo.getTime() + "\"},");
		result.append("{\"key\":\"memberMax\",\"value\":\""+ vo.getMemberMax() + "\"},");
		result.append("{\"key\":\"limit\",\"value\":\""+ vo.getLimit() + "\"},");
		result.append("{\"key\":\"place\",\"value\":\""+ vo.getPlace() + "\"},");
		result.append("{\"key\":\"event\",\"value\":\""+ vo.getEvent() + "\"},");
		result.append("{\"key\":\"bbsIdx\",\"value\":\""+ vo.getBbsIdx() + "\"},");
		result.append("{\"key\":\"content\",\"value\":\""+ vo.getContent() + "\"},");
		result.append("{\"key\":\"writeDate\",\"value\":\""+ vo.getWriteDate() + "\"},");
		result.append("{\"key\":\"imageIdx\",\"value\":\""+ vo.getImageIdx() + "\"},");
		result.append("{\"key\":\"teamName\",\"value\":\""+ vo.getTeamName() + "\"},");
		result.append("{\"key\":\"nickname\",\"value\":\""+ vo.getNickname() + "\"},");
		result.append("{\"key\":\"hit\",\"value\":\""+ vo.getHit() + "\"},");
		result.append("{\"key\":\"bbsIdx\",\"value\":\""+ vo.getBbsIdx() + "\"},");
		result.append("{\"key\":\"logo\",\"value\":\""+ vo.getLogo() + "\"}]");
		
		
		/*
		 * result.append("{"); result.append("\"bbsIdx\":" + vo.getBbsIdx() + ", ");
		 * result.append("\"useridx\": \"" + vo.getUseridx() + "\", ");
		 * result.append("\"teamIdx\":" + vo.getTeamIdx() + ", ");
		 * result.append("\"subject\": \"" + vo.getSubject() + "\", ");
		 * result.append("\"time\": \"" + vo.getTime() + "\", ");
		 * result.append("\"memberMax\": \"" + vo.getMemberMax() + "\", ");
		 * result.append("\"limit\": \"" + vo.getLimit() + "\", ");
		 * result.append("\"place\": \"" + vo.getPlace() + "\", ");
		 * result.append("\"event\": \"" + vo.getEvent() + "\", ");
		 * result.append("\"content\": \"" + vo.getContent() + "\", ");
		 * result.append("\"writeDate\": \"" + vo.getWriteDate() + "\", ");
		 * result.append("\"imageIdx\": \"" + vo.getImageIdx() + "\", ");
		 * result.append("\"teamName\": \"" + vo.getTeamName() + "\", ");
		 * result.append("\"nickname\": \"" + vo.getNickname() + "\", ");
		 * result.append("\"hit\": \"" + vo.getHit() + "\" "); result.append("}");
		 */

		// 결과출력
		/**/System.out.println("    result : " + result);
		PrintWriter out = response.getWriter();
		out.print(result);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
