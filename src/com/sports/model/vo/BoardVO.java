package com.sports.model.vo;

import java.sql.Date;

public class BoardVO {

	private int bbsIdx;
	private String useridx;
	private String nickname;
	private String subject;
	private String content;
	private String writeDate;
	private String image;
	
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
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
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
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
		return "BoardVO [bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", nickname=" + nickname + ", subject=" + subject
				+ ", content=" + content + ", writeDate=" + writeDate + ", image=" + image + "]";
	}
}
