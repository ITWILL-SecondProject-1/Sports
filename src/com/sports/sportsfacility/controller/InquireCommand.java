package com.sports.sportsfacility.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.command.Command;
import com.sports.model.dao.FaDAO;
import com.sports.model.dao.ImagesDAO;
import com.sports.model.vo.FaVO;
import com.sports.model.vo.ImagesVO;

public class InquireCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		FaVO faVO = FaDAO.inquireData(Integer.parseInt(req.getParameter("index")));
		List<ImagesVO> imageList = ImagesDAO.imageList(faVO.getImageIdx());
		req.setAttribute("FaVO", faVO);
		req.setAttribute("imageList", imageList);
		return "JSP/Facility/facility.jsp";
	}

}
