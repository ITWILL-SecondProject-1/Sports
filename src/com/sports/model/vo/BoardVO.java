package com.sports.model.vo;

import java.sql.Date;

public class BoardVO {

	private int bbsId;
	private String usermail;
	private String subject;
	private String content;
	private Date writeDate;
	private String image;
	
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bbsId=" + bbsId + ", usermail=" + usermail + ", subject=" + subject + ", content=" + content
				+ ", writeDate=" + writeDate + ", image=" + image + "]";
	}
	
	
}
