package com.sports.teamBbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.sports.model.dao.TeamBbsDAO;
import com.sports.model.vo.UserVO;

import Paging.CommentVO;


@WebServlet("/teamBoardComment")
public class TeamBbsCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String bbsIdx = req.getParameter("bbsIdx");

        try (PrintWriter out = res.getWriter()) {
            List<CommentVO> comments = TeamBbsDAO.getCommentsList(bbsIdx);

            // JSON으로 변환
            JSONObject jsonResponse = new JSONObject();
            JSONArray jsonComments = new JSONArray();
            
    		for (CommentVO comment : comments) {
    		    jsonComments.add(comment.toJSONObject());
    		}
    		jsonResponse.put("comments", jsonComments);
    		res.setStatus(HttpServletResponse.SC_OK);
    		res.setContentType("application/json");
    		res.setCharacterEncoding("UTF-8");
    		res.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            res.getWriter().println("댓글을 불러오는 중 오류가 발생했습니다.");
        }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
        	UserVO loginUser = (UserVO) req.getSession().getAttribute("UserVO");
            String bbsIdx = req.getParameter("bbsIdx");
            String commentText = req.getParameter("comment");
            
            System.out.println(bbsIdx);
            System.out.println(commentText);
            System.out.println(loginUser.getUseridx());

            // 댓글 객체 생성 및 설정
            CommentVO comment = new CommentVO();
            comment.setBbsIdx(bbsIdx);
            comment.setContent(commentText);
            comment.setUseridx(loginUser.getUseridx());

            TeamBbsDAO.insertComment(comment);

            out.println("댓글이 성공적으로 작성되었습니다.");
        } catch (Exception e) {
            res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            res.getWriter().println("댓글 작성 중 오류가 발생했습니다.");
        }

	}

}
