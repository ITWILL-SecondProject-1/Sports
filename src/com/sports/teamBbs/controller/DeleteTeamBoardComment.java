package com.sports.teamBbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.TeamBbsDAO;
import com.sports.model.vo.UserVO;

import Paging.CommentVO;


@WebServlet("/deleteTeamBoardComment")
public class DeleteTeamBoardComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		res.getWriter().println("댓글 작성 중 오류가 발생했습니다.");
    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CommentVO comment = new CommentVO();
		UserVO user = (UserVO) req.getSession().getAttribute("UserVO");
		String commentId = req.getParameter("commentId");

		comment.setUseridx(user.getUseridx());
		comment.setCommentIdx(commentId);
		System.out.println(comment.toString());
		
		int result = TeamBbsDAO.deleteComment(comment);
		System.out.println("result : " + result);
		
		if (result > 0) {
			res.setStatus(HttpServletResponse.SC_OK);
			res.getWriter().println("댓글 업데이트 완료");
		} else {
			res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			res.getWriter().println("댓글 작성 중 오류가 발생했습니다.");
		}
		
	}

}
