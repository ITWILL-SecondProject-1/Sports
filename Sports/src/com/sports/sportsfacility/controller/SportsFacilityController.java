package com.sports.sportsfacility.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sports.model.command.Command;
import com.sports.model.vo.UserVO;

/**
 * Servlet implementation class SportsFacilityController
 */
@WebServlet("/facility")
public class SportsFacilityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Command> commands;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("list", new ListCommand());
		commands.put("inquire", new InquireCommand());
		commands.put("reserve", new ReserveCommand());
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String type = req.getParameter("type");
		Command command = commands.get(type);
		String path = command.exec(req, res);
		HttpSession session = req.getSession();
		UserVO vo = (UserVO) session.getAttribute("UserVO");
		req.setAttribute("UserVO", vo);
		req.getRequestDispatcher(path).forward(req, res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
