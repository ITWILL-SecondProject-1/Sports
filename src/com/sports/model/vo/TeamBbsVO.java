package com.sports.model.vo;

import java.io.Serializable;

public class TeamBbsVO implements Serializable {
	private static final long serialVersionUID = 1L;

	private String teamIdx;
	private String bbsIdx;
	private String useridx;
	private String nickname;
	private String subject;
	private String content;
	private String writeDate;
	private int imageIdx;
	private String hit;
		
	
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
	public String getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(String bbsIdx) {
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
	public int getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(int imageIdx) {
		this.imageIdx = imageIdx;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getTeamIdx() {
		return teamIdx;
	}

	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}
	
	@Override
	public String toString() {
		return "TeamBbsVO [teamIdx=" + teamIdx + ", bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", nickname="
				+ nickname + ", subject=" + subject + ", content=" + content + ", writeDate=" + writeDate
				+ ", imageIdx=" + imageIdx + ", hit=" + hit + "]";
	}

	
	
}
