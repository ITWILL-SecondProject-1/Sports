package com.sport.joinBbs.vo;

public class JoinBbsVO {
	private String bbsIdx; //게시글 고유번호
	private String useridx; //작성자
	private String teamIdx; //모집팀id
	private String subject; //제목
	private String time; //모집시간
	private String memberMax; //모집인원
	private String limit; //모집조건
	private String place; //모집장소
	private String event; //운동종목
	private String content; //글내용
	private String writeDate; //작성일
	private String image; //이미지 첨부파일
	private String teamName; //팀명
	
	private String nickname; //작성자 닉네임
	private int hit = 0; //조회수
	
	public String getBbsIdx() {
		return bbsIdx;
	}

	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getUseridx() {
		return useridx;
	}

	public String getTeamIdx() {
		return teamIdx;
	}

	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}

	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}

	@Override
	public String toString() {
		return "JoinBbsVO [bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", teamIdx=" + teamIdx + ", subject=" + subject
				+ ", time=" + time + ", memberMax=" + memberMax + ", limit=" + limit + ", place=" + place + ", event="
				+ event + ", content=" + content + ", writeDate=" + writeDate + ", image=" + image + ", teamName="
				+ teamName + ", nickname=" + nickname + ", hit=" + hit + "]";
	}
	
}
