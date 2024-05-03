package com.sports.admin.controller;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.sports.cloudinary.IMGManager;
import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.BoardDAO;
import com.sports.model.dao.FaDAO;
import com.sports.model.vo.FaVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10, 
	    maxRequestSize = 1024 * 1024 * 50
	)
@WebServlet("/updateFacilityOk")
public class UpdateFacilityOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMGManager imageManager = new IMGManager();
		IMGUpload imageUpload = new IMGUpload();
		Collection<Part>parts = request.getParts();
		
		int facilityIdx = Integer.parseInt(request.getParameter("facilityIdx"));
		System.out.println("facilityIdx : " + facilityIdx);
		
		FaVO faVO = FaDAO.inquireData(facilityIdx);
		
		String[] checkedImages = request.getParameterValues("imagesCheckList");
		try {
			imageManager.deleteCheckedImages(checkedImages);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		imageUpload.uploadImages(parts, faVO.getImageIdx());
		
		
		faVO.setFacilityName(request.getParameter("faName"));
		faVO.setAddress(request.getParameter("address"));
		faVO.setPhoneNumber(request.getParameter("phoneNumber"));
		faVO.setCapacity((int)Integer.parseInt(request.getParameter("capacity")));
		faVO.setEvent(request.getParameter("event"));
		faVO.setOpenTime((int)Integer.parseInt(request.getParameter("openTime")));
		faVO.setCloseTime((int)Integer.parseInt(request.getParameter("closeTime")));
		faVO.setDateRangeForReservation((int)Integer.parseInt(request.getParameter("DateRangeForReservation")));
		
		response.sendRedirect("adminFacility");
		
	}

}
