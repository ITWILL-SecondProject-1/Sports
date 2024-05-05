package com.sports.userpage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONException;
import org.json.JSONObject;

import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.UserDAO;
import com.sports.model.vo.UserVO;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10, 
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/uploadProfileImg")
public class UploadProfileImg extends HttpServlet {
	private IMGUpload imgUpload;
	private static final long serialVersionUID = 1L;
	
    @Override
    public void init() {
        this.imgUpload = new IMGUpload();
    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {		    
		res.sendRedirect("/STP/main");
	}
	
	/*
	 * 기존 프로필 이미지를 서버에서 삭제후에, 새로운 이미지를 서버에 등록한다.
	 * 해당 응답은 JSON형태로 반환된다.
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("UserVO");
		Part filePart = req.getPart("img");
		boolean deleteResult = true;
		if (user == null) {
			res.sendRedirect("login"); 
			return;
		}
	    String imageUrl = "null";
	    String imagePI = UserDAO.getUserInfo(user.getEmail()).getImagePi();
	    
	    // public_id를 사용하여 서버에서 이미지 삭제
	    if (imagePI != null) deleteResult = imgUpload.deleteImage(UserDAO.getUserInfo(user.getEmail()).getImagePi());
	    
	    JSONObject responseObj = new JSONObject();
	    
	    // req의 image가 있을 경우, 이미지를 서버에 업로드
	    
	    if (filePart.getSize() != 0 & deleteResult == true) {
	        Map<String, String> resultMap = imgUpload.uploadImage(filePart);
	        imageUrl = resultMap.get("url");
	        imagePI = resultMap.get("public_id");
	        
	        user.setImage(imageUrl);
	        user.setImagePi(imagePI);
	        UserDAO.editProfileImg(user);
	        
	        try {
	        	res.setStatus(HttpServletResponse.SC_OK); // 200 상태 코드 설정
				responseObj.put("status", "success");
				responseObj.put("message", "File has been uploaded successfully.");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    } else {
	        try {
	        	res.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 상태 코드 설정
				responseObj.put("status", "error");
				responseObj.put("message", "No file uploaded.");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }

	    session.setAttribute("UserVO", (UserVO) UserDAO.login(user));
	    res.setContentType("application/json");
	    PrintWriter out = res.getWriter();
	    out.print(responseObj.toString());
	    out.flush();
	}

}
