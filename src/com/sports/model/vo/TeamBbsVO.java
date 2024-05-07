package com.sports.model.vo;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.sports.model.dao.UserDAO;

public class TeamBbsVO implements Serializable {
	private static final long serialVersionUID = 1L;

	private String teamIdx;
	private String bbsIdx;
	private String useridx;
	private String nickname;
	private String subject;
	private String content;
	private String writeDate;
	private String email;
	private int imageIdx;
	private String hit;
		
	
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		this.email = UserDAO.indexToUserInfo(useridx).getEmail();
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
	
	public String getEmail() {
		return email;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject() {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("teamIdx", teamIdx);
		jsonObj.put("bbsIdx", bbsIdx);
		jsonObj.put("useridx", useridx);
		jsonObj.put("nickname", nickname);
		jsonObj.put("subject", subject);
		jsonObj.put("content", content);
		jsonObj.put("writeDate", writeDate);
		jsonObj.put("email", email);
		jsonObj.put("imageIdx", imageIdx);
		return jsonObj;
	}
	
	@Override
	public String toString() {
		return "TeamBbsVO [teamIdx=" + teamIdx + ", bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", nickname="
				+ nickname + ", subject=" + subject + ", content=" + content + ", writeDate=" + writeDate + ", email="
				+ email + ", imageIdx=" + imageIdx + ", hit=" + hit + "]";
	}	
	
	
}
