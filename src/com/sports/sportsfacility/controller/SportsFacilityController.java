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

import com.sports.model.command.Command;

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
		req.getRequestDispatcher(path).forward(req, res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
