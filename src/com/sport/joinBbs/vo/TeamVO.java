package com.sport.joinBbs.vo;

import java.util.List;

import com.sports.model.vo.UserVO;

public class TeamVO {
	private String teamIdx; //팀인덱스
	private String useridx; //팀장
	private String joinCheck; //
	private String teamName; //팀명
	private String imageIdx; //팀이미지
	private String startDate;
	private String endDate;
	
	private List<UserVO> memberList = null;

	public List<UserVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<UserVO> memberList) {
		this.memberList = memberList;
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
	public String getJoinCheck() {
		return joinCheck;
	}
	public void setJoinCheck(String joinCheck) {
		this.joinCheck = joinCheck;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(String imageIdx) {
		this.imageIdx = imageIdx;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "TeamVO [teamIdx=" + teamIdx + ", useridx=" + useridx + ", joinCheck=" + joinCheck + ", teamName="
				+ teamName + ", imageIdx=" + imageIdx + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", memberList=" + memberList + "]";
	}

	
}
