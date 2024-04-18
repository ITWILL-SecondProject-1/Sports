package com.sports.model.vo;

import java.sql.Date;

public class BoardVO {

	private int bbsIdx;
	private int userIdx;
	private String subject;
	private String content;
	private Date writeDate;
	private String image;
	
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
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
		return "BoardVO [bbsId=" + bbsIdx + ", userIdx=" + userIdx + ", subject=" + subject + ", content=" + content
				+ ", writeDate=" + writeDate + ", image=" + image + "]";
	}

}
