package com.sport.joinBbs.vo;

public class JoinBbsVO {
	private int bbsId;
	private String userEmail;
	private int teamId;
	private String subject;
	private String time;
	private String memberMax;
	private String limit;
	private String place;
	private String event;
	private String content;
	private String writeDate;
	private String image;
	private String teamName;
	
	private String nickname;

	public int getBbsId() {
		return bbsId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public int getTeamId() {
		return teamId;
	}

	public String getSubject() {
		return subject;
	}

	public String getTime() {
		return time;
	}

	public String getMemberMax() {
		return memberMax;
	}

	public String getLimit() {
		return limit;
	}

	public String getPlace() {
		return place;
	}

	public String getEvent() {
		return event;
	}

	public String getContent() {
		return content;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public String getImage() {
		return image;
	}

	public String getTeamName() {
		return teamName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setMemberMax(String memberMax) {
		this.memberMax = memberMax;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "JoinBbsVO [bbsId=" + bbsId + ", userEmail=" + userEmail + ", teamId=" + teamId + ", subject=" + subject
				+ ", time=" + time + ", memberMax=" + memberMax + ", limit=" + limit + ", place=" + place + ", event="
				+ event + ", content=" + content + ", writeDate=" + writeDate + ", image=" + image + ", teamName="
				+ teamName + ", nickname=" + nickname + "]";
	}
	
	
}
