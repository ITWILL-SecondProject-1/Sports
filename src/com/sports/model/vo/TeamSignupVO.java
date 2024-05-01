package com.sports.model.vo;

public class TeamSignupVO extends UserVO{
	private String signupIdx;
	private String teamIdx;
	private String useridx;
	private String signupCheck;
	private String signupDate;
	private String content;
	//gettr
	public String getSignupIdx() {
		return signupIdx;
	}
	public String getTeamIdx() {
		return teamIdx;
	}
	public String getUseridx() {
		return useridx;
	}
	public String getSignupCheck() {
		return signupCheck;
	}
	public String getSignupDate() {
		return signupDate;
	}
	public String getContent() {
		return content;
	}
	//setter
	public void setSignupIdx(String signupIdx) {
		this.signupIdx = signupIdx;
	}
	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public void setSignupCheck(String signupCheck) {
		this.signupCheck = signupCheck;
	}
	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "TeamSignupVO [signupIdx=" + signupIdx + ", teamIdx=" + teamIdx + ", useridx=" + useridx
				+ ", signupCheck=" + signupCheck + ", signupDate=" + signupDate + ", content=" + content + "]";
	}
}
