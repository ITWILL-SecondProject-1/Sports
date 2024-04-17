package com.sports.auth.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.sports.cloudinary.IMGUpload;
import com.sports.model.dao.UserDAO;
import com.sports.model.vo.UserVO;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10, 
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private IMGUpload imgUpload;
	private static final long serialVersionUID = 1L;
	
    @Override
    public void init() {
        this.imgUpload = new IMGUpload();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("signup.jsp").forward(req, res);
	}
	
	// BeanUtils를 사용하여 UserVO와 자동적으로 매핑하고, 해당 UserVO로 회원가입 처리.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    UserVO user = new UserVO();
	    String imageUrl = null;
	    boolean result = false;
	    
	    Part filePart = req.getPart("image");
        if (filePart.getSize() != 0) {
            // 파일을 Cloudinary에 업로드
            imageUrl = imgUpload.uploadImage(filePart);
            req.setAttribute("image", imageUrl);
        }        
        
	    try {
	        BeanUtils.populate(user, req.getParameterMap());
	        user.setImage(imageUrl);
	        result = UserDAO.register(user);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    if (result == false) {
	    	res.sendRedirect("/STP/signup");
	    } else {
	    	res.sendRedirect("/STP/login");
	    }
	    
	}
	

}
