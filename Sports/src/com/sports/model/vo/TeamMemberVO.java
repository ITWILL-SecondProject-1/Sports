package com.sports.model.vo;

public class TeamMemberVO extends UserVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String teamIdx;
	private String useridx;
	private String joinDate;
	private String leaveDate;
	private String teamManager;
	
	public String getTeamIdx() {
		return teamIdx;
	}

	public String getUseridx() {
		return useridx;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public String getTeamManager() {
		return teamManager;
	}

	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}

	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public void setTeamManager(String teamManager) {
		this.teamManager = teamManager;
	}

	@Override
	public String toString() {
		return "TeamMemberVO [teamIdx=" + teamIdx + ", useridx=" + useridx + ", joinDate=" + joinDate + ", leaveDate="
				+ leaveDate + ", teamManager=" + teamManager + "]";
	}
	
	
	
}
