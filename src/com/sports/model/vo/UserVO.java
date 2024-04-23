package com.sports.model.vo;
import java.io.Serializable;

public class UserVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String useridx;
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private String gender;
	private String image;
	private String imagePi;
  
	public String getUseridx() {
		return useridx;
	}

	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
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
		return "UserVO [email=" + email + ", nickname=" + nickname + ", password=" + password + ", phone=" + phone
				+ ", gender=" + gender + ", image=" + image + ", useridx=" + useridx + ", imagePi=" + imagePi + "]";
	}
}