package com.sports.cloudinary;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sports.model.dao.ImagesDAO;
import com.sports.model.vo.ImagesVO;
import com.sports.utils.config.Config;

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class IMGUpload {
    private Cloudinary cloudinary;

    public IMGUpload() {
        this.cloudinary = new Cloudinary(Config.getENV());
    }

    public void uploadImages(Collection<Part> parts, int imageIdx) throws IOException, NullPointerException {
		for (Part part : parts) {
			if (part.getSubmittedFileName() == null) continue;
			if (part.getContentType().equals("image/jpeg") || part.getContentType().equals("image/png")) {
				Map<String, String> resultMap = uploadImage(part);
				ImagesVO imagesVO = new ImagesVO();
				imagesVO.setImageIdx(imageIdx);
				imagesVO.setImage(resultMap.get("url"));
				imagesVO.setImagePi(resultMap.get("public_id"));
				ImagesDAO.insertImage(imagesVO);
			}
		}
		return;
    }
    
    public void uploadImagesCarousel(Collection<Part> parts, int imageIdx) throws IOException, NullPointerException {
    	for (Part part : parts) {
    		if (part.getSubmittedFileName() == null) continue;
    		if (part.getContentType().equals("image/jpeg") || part.getContentType().equals("image/png") || part.getName().equals("images-carousel")) {
    			Map<String, String> resultMap = uploadImage(part);
    			ImagesVO imagesVO = new ImagesVO();
    			imagesVO.setImageIdx(imageIdx);
    			imagesVO.setImage(resultMap.get("url"));
    			imagesVO.setImagePi(resultMap.get("public_id"));
    			ImagesDAO.insertImage(imagesVO);
    		}
    	}
    	return;
    }
    
    // 이미지 업로드 메소드
    public Map<String, String> uploadImage(Part filePart) throws IOException {
        File tempFile = File.createTempFile("upload-", ".tmp"); // 임시 파일 생성
        try (InputStream input = filePart.getInputStream();
             OutputStream output = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }
        
        // 업로드 옵션에 ITWILL_STP 폴더 경로 지정
        Map options = ObjectUtils.asMap(
            "folder", "ITWILL_STP"
        );

        // 이미지를 클라우디너리에 업로드
        Map uploadResult = cloudinary.uploader().upload(tempFile, options);
        tempFile.delete(); // 임시 파일 삭제

        Map<String, String> result = new HashMap<>();
        result.put("url", (String) uploadResult.get("url"));
        result.put("public_id", (String) uploadResult.get("public_id"));
        
        return result;
    }
    
    // 이미지 삭제 메소드
    public boolean deleteImage(String publicId) throws IOException {
        // public_id를 사용하여 이미지 삭제
    	System.out.println(publicId.trim());
        if (cloudinary.uploader().destroy(publicId.trim(), ObjectUtils.emptyMap()).get("result").equals("ok")) {
        	return true;
        }
        return false;
    }
}