package com.sports.teamBbs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONException;
import org.json.JSONObject;

import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.TeamBbsDAO;
import com.sports.model.vo.TeamBbsVO;
import com.sports.model.vo.UserVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/teamBoardWrite")
public class WriteTeamBoard extends HttpServlet {
	private IMGUpload imgUpload;
	private static final long serialVersionUID = 1L;
	
    @Override
    public void init() {
        this.imgUpload = new IMGUpload();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.sendRedirect("main");
		
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        HttpSession session = request.getSession();
        UserVO vo = (UserVO) session.getAttribute("UserVO");
        JSONObject jsonResponse = new JSONObject();
        try {
        	if (vo == null) {
        		jsonResponse.put("status", "error");
        		jsonResponse.put("message", "User not logged in.");
        		response.getWriter().write(jsonResponse.toString());
        		return;
        	}
        	
        	String useridx = vo.getUseridx();
        	TeamBbsVO teamBoard = new TeamBbsVO();
        	teamBoard.setUseridx(useridx);
        	System.out.println(request.getParameter("teamIdx"));
        	System.out.println(request.getParameter("post-title"));
        	System.out.println(request.getParameter("post-content"));
        	teamBoard.setTeamIdx(request.getParameter("teamIdx"));
        	teamBoard.setSubject(request.getParameter("post-title"));
        	teamBoard.setContent(request.getParameter("post-content"));
        	
        	try {
        		int imageIdx = TeamBbsDAO.insertBbs(teamBoard);
        		
        		// 파일들을 가져와서 이미지일 경우에만 업로드 (jpeg, png)
        		Collection<Part> parts = request.getParts();
        		imgUpload.uploadImages(parts, imageIdx);
        		
        		jsonResponse.put("status", "success");
        		jsonResponse.put("message", "Post uploaded successfully.");
        	} catch (Exception e) {
        		jsonResponse.put("status", "error");
        		jsonResponse.put("message", "Error uploading post or image.");
        		e.printStackTrace();
        	}
        } catch (JSONException e) {
        	e.printStackTrace();
        }

        response.getWriter().write(jsonResponse.toString());
    }
}