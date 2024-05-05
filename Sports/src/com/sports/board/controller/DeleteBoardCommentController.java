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

@WebServlet("/deleteBoardComment")
public class DeleteBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
		response.sendRedirect("viewBoardOne?bbsIdx=" + bbsIdx);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// JSON 데이터 읽기
		StringBuilder jsonBuilder = new StringBuilder();
		String line;
		BufferedReader reader = req.getReader();
		int userIdx = 0;
		int commentIdx = 0;
		while((line = reader.readLine()) != null) {
			jsonBuilder.append(line);
		}
		
		// JSON파싱
	    JSONObject reqJson;
		JSONObject resObj = new JSONObject();
		try {
			reqJson = new JSONObject(jsonBuilder.toString());
			commentIdx = reqJson.getInt("commentIdx");
			userIdx = reqJson.getInt("userIdx");
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		
		// 추후 userIdx활용
		int result = BoardCommentDAO.deleteBoardComment(commentIdx);
		
		if (result > 0) {
			try {
				res.setStatus(HttpServletResponse.SC_OK);
				resObj.put("status", "success");
				resObj.put("message", "Editing Comment success");				
			} catch(JSONException e) {
				e.printStackTrace();
			}
		} else {
			try {
				res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				resObj.put("status", "error");
				resObj.put("message", "Editing Comment fail");
			} catch(JSONException e) {
				e.printStackTrace();
			}
		}
		
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
	    out.print(resObj.toString());
	    out.flush();
		
	}

}
