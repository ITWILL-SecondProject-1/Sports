package com.sports.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.sports.cloudinary.IMGManager;
import com.sports.model.dao.BoardDAO;
import com.sports.model.dao.ImagesDAO;
import com.sports.model.vo.BoardVO;
import com.sports.model.vo.ImagesVO;
import com.sports.model.vo.UserVO;

@WebServlet("/deleteBoard2")
public class DeleteBoardController2 extends HttpServlet {
	private IMGManager imgManager;
	private static final long serialVersionUID = 1L;
	
    @Override
    public void init() {
        this.imgManager = new IMGManager();
    }	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("board");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // JSON 데이터 읽기
	    StringBuilder jsonBuilder = new StringBuilder();
	    String line;
	    BufferedReader reader = request.getReader();

	    while((line = reader.readLine()) != null) {
	        jsonBuilder.append(line);
	    }

	    JSONObject reqJson;
	    int bbsIdx = 0;

	    try {
	        reqJson = new JSONObject(jsonBuilder.toString());
	        bbsIdx = reqJson.getInt("bbsIdx");
	    } catch (JSONException e) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        PrintWriter out = response.getWriter();
	        out.print("{\"error\": \"Invalid JSON data.\"}");
	        out.flush();
	        return;
	    }

	    BoardVO boardVO = BoardDAO.boardOne(bbsIdx);
	    if (boardVO == null ) {
	        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	        return;
	    }

	    List<ImagesVO> imagesList = ImagesDAO.imageList(boardVO.getImageIdx());
	    if (imgManager.deleteImages(imagesList) && BoardDAO.boardDelete(bbsIdx)) {
	        response.setStatus(HttpServletResponse.SC_OK);
	        PrintWriter out = response.getWriter();
	        out.print("{\"message\": \"Board deleted successfully.\"}");
	        out.flush();
	    } else {
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    }
	}

}
