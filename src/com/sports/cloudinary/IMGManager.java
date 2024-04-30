package com.sports.cloudinary;

import com.sports.model.dao.ImagesDAO;

public class IMGManager {
	
	// 체크된 이미지들의 pi를 담은 배열을 넣으면, db와 cloudinary에 있는 이미지를 모두 삭제해준다.
	public void deleteCheckedImages(String[] checkedImages) throws Exception {
	    if (checkedImages == null) {
	        return;
	    }
	    for (String imagePi : checkedImages) {
	        if (imagePi == null) continue;
	        try {
	            // 데이터베이스에서 이미지 삭제 시도
	            if (!ImagesDAO.deleteImage(imagePi)) {
	                throw new Exception("Database deletion failed for: " + imagePi);
	            }
	        } catch (Exception e) {
	            // 로깅 또는 에러 처리 로직
	            System.err.println("Failed to delete image " + imagePi + ": " + e.getMessage());
	            continue;
	        }
	    }
	}
}