package com.sports.sportsfacility.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.command.Command;
import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

public class InquireCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("FaVO", FaDAO.inquireData(Integer.parseInt(req.getParameter("index"))));
		return "JSP/Facility/facility.jsp";
	}

}
