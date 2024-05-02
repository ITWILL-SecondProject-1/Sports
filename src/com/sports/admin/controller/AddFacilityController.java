package com.sports.admin.controller;

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

import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.BoardDAO;
import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
	)
@WebServlet("/addFacility")
public class AddFacilityController extends HttpServlet {
	private IMGUpload imgUpload;
	private static final long serialVersionUID = 1L;

	@Override
    public void init() {
        this.imgUpload = new IMGUpload();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("JSP/Admin/addFacility.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("faName : " + request.getParameter("faName"));
		System.out.println("address : " + request.getParameter("address"));
		System.out.println("phone : " + request.getParameter("phone"));
		System.out.println("capacity : " + request.getParameter("capacity"));
		System.out.println("event : " + request.getParameter("event"));
		System.out.println("openTime : " + request.getParameter("openTime"));
		System.out.println("closeTime : " + request.getParameter("closeTime"));
		
		Collection<Part> parts = request.getParts();
		
		FaVO faVO = new FaVO();
		
		faVO.setFacilityName(request.getParameter("faName"));
		faVO.setAddress(request.getParameter("address"));
		faVO.setPhoneNumber(request.getParameter("phone"));
		faVO.setCapacity((int)Integer.parseInt(request.getParameter("capacity")));
		faVO.setEvent(request.getParameter("event"));
		faVO.setOpenTime((int)Integer.parseInt(request.getParameter("openTime")));
		faVO.setCloseTime((int)Integer.parseInt(request.getParameter("closeTime")));
		
		int imageIdx = FaDAO.insertFacility(faVO);
		
		try {
			imgUpload.uploadImages(parts, imageIdx);			
		} catch(NullPointerException e) {
			System.out.println("이미지를 입력하지 않음.");
		}
		
		response.sendRedirect("adminFacility");
				
	}

}
