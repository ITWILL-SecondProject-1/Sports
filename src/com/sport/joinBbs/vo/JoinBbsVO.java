package com.sport.joinBbs.vo;

import com.sport.joinBbs.dao.JoinBbsDAO;
import com.sports.model.dao.UserDAO;

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
	private String imageIdx; //이미지 첨부파일
	private String teamName; //팀명
	private String hit = "0"; //조회수
	
	private String nickname; //작성자 닉네임
	
	// 자동생성 항목
	private String logo; // 로고 이미지 주소
	private String writerEmail;
	
	public String getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		// useridx가 셋팅되면, 자동적으로 작성자의 정보를 가져온다.
		this.writerEmail = UserDAO.indexToUserInfo(useridx).getEmail();
		this.useridx = useridx;
	}
	public String getTeamIdx() {
		return teamIdx;
	}
	public void setTeamIdx(String teamIdx) {
		// TeamIdx가 셋팅되면, 데이터베이스의 팀 로고도 자동으로 셋팅되게 만듬
		this.logo = JoinBbsDAO.getTeamLogo(Integer.parseInt(teamIdx));
		this.teamIdx = teamIdx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMemberMax() {
		return memberMax;
	}
	public void setMemberMax(String memberMax) {
		this.memberMax = memberMax;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
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
	public String getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(String imageIdx) {
		this.imageIdx = imageIdx;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getLogo() {
		return logo;
	}
	public String getWriterEmail() {
		return writerEmail;
	}	
	@Override
	public String toString() {
		return "JoinBbsVO [bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", teamIdx=" + teamIdx + ", subject=" + subject
				+ ", time=" + time + ", memberMax=" + memberMax + ", limit=" + limit + ", place=" + place + ", event="
				+ event + ", content=" + content + ", writeDate=" + writeDate + ", imageIdx=" + imageIdx + ", teamName="
				+ teamName + ", hit=" + hit + ", nickname=" + nickname + ", logo=" + logo + "]";
	}
	
	
}
