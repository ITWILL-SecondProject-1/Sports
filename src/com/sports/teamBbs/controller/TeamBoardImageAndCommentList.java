package com.sports.teamBbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sports.model.dao.ImagesDAO;
import com.sports.model.dao.TeamBbsDAO;
import com.sports.model.vo.ImagesVO;
import com.sports.model.vo.TeamBbsVO;

import Paging.CommentVO;


@WebServlet("/teamBoardImageAndCommentList")
public class TeamBoardImageAndCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String bbsIdx = req.getParameter("bbsIdx");
		int imageIdx = Integer.parseInt(req.getParameter("imageIdx"));
		List<CommentVO> comments = TeamBbsDAO.getCommentsList(bbsIdx);
		List<ImagesVO> images = ImagesDAO.imageList(imageIdx);
		TeamBbsVO boardVO = TeamBbsDAO.selectOneBBS(bbsIdx);

		JSONObject jsonResponse = new JSONObject();
		JSONArray jsonImages = new JSONArray();
		JSONArray jsonComments = new JSONArray();

		for (ImagesVO image : images) {
		    jsonImages.add(image.toJSONObject());
		}

		for (CommentVO comment : comments) {
		    jsonComments.add(comment.toJSONObject());
		}

		jsonResponse.put("images", jsonImages);
		jsonResponse.put("comments", jsonComments);
		jsonResponse.put("boardVO", boardVO.toJSONObject());

		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		res.getWriter().write(jsonResponse.toString());
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
