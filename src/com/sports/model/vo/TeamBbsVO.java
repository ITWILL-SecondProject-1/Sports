package com.sports.model.vo;

import Paging.BbsVO;

public class TeamBbsVO extends BbsVO{

	private String teamIdx;

	public String getTeamIdx() {
		return teamIdx;
	}

	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}

	@Override
	public String toString() {
		return super.toString() + "TeamBbsVO [teamIdx=" + teamIdx + "]";
	}

	
	
}
