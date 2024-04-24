package com.sport.joinBbs.vo;

public class TeamSignupVO {
	private String signupIdx;
	private String teamIdx;
	private String useridx;
	private String signupCheck = "u";
	private String signupDate;
	private String content;
	
	@Override
	public String toString() {
		return "TeamSignupVO [signupIdx=" + signupIdx + ", teamIdx=" + teamIdx + ", useridx=" + useridx
				+ ", signupCheck=" + signupCheck + ", signupDate=" + signupDate + ", content=" + content + "]";
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSignupIdx() {
		return signupIdx;
	}
	public void setSignupIdx(String signupIdx) {
		this.signupIdx = signupIdx;
	}
	public String getTeamIdx() {
		return teamIdx;
	}
	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public String getSignupCheck() {
		return signupCheck;
	}
	public void setSignupCheck(String signupCheck) {
		this.signupCheck = signupCheck;
	}
	public String getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}
	
	
}
