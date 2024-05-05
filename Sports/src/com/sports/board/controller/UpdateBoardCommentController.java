package com.sports.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.sports.model.dao.BoardCommentDAO;
import com.sports.model.vo.BoardCommentVO;

@WebServlet("/updateBoardComment")
public class UpdateBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		response.sendRedirect("viewBoardOne?bbsIdx=" + bbsIdx);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // JSON 데이터 읽기
	    StringBuilder jsonBuilder = new StringBuilder();
	    String line;
	    BufferedReader reader = request.getReader();
	    int commentIdx = 0;
	    String content = null;
	    while ((line = reader.readLine()) != null) {
	        jsonBuilder.append(line);
	    }

	    // JSON 파싱
	    JSONObject requestJson;
	    JSONObject responseObj = new JSONObject();
		try {
			requestJson = new JSONObject(jsonBuilder.toString());
			commentIdx = requestJson.getInt("commentIdx");
			content = requestJson.getString("content");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		BoardCommentVO vo = (BoardCommentVO) BoardCommentDAO.selectBoardCommentOne(commentIdx);
		vo.setContent(content);
		int result = BoardCommentDAO.updateBoardComment(vo);
		
		if (result > 0) {
			try {
				response.setStatus(HttpServletResponse.SC_OK);
				responseObj.put("status", "success");
				responseObj.put("message", "Editing Comment success");
			} catch (JSONException e) {
			e.printStackTrace();
			}  
		} else {
			try {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				responseObj.put("status", "error");
				responseObj.put("message", "Editing Comment fail");
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
	    out.print(responseObj.toString());
	    out.flush();
		
	}

}
