package com.sports.sportsfacility.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;
import com.sports.model.command.Command;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			List<FaVO> list = FaDAO.getList();
			req.setAttribute("list", list);
		return "JSP/Facility/facilityList.jsp";
	}

}
