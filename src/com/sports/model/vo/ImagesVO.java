package com.sports.model.vo;

import org.json.simple.JSONObject;

public class ImagesVO {
	int imageIdx;
	String image;
	String imagePi;

	public ImagesVO() {
	}
	
	public ImagesVO(int imageIdx, String image, String imagePi) {
		this.imageIdx = imageIdx;
		this.image = image;
		this.imagePi = imagePi;
	}
	
	public int getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(int imageIdx) {
		this.imageIdx = imageIdx;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImagePi() {
		return imagePi;
	}
	public void setImagePi(String imagePi) {
		this.imagePi = imagePi;
	}
	@Override
	public String toString() {
		return "ImagesVO [imageIdx=" + imageIdx + ", image=" + image + ", imagePi=" + imagePi + "]";
	}
	
	//JSON객체로 변환하는 메소드
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject() {
		JSONObject jsonObj = new JSONObject();
        jsonObj.put("imageIdx", imageIdx);
        jsonObj.put("image", image);
        jsonObj.put("imagePi", imagePi);
        return jsonObj;
	}
}
