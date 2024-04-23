package com.sport.joinBbs.vo;

import java.util.List;

import com.sports.model.vo.UserVO;

public class TeamVO {
	private String teamIdx; //팀인덱스
	private String useridx; //팀장
	private String gender; //
	private String teamName; //팀명
	private String image; //팀이미지
	private String imagePi; //이미지pi
	
	private List<UserVO> memberList = null;

	// geters
	public String getTeamIdx() {
		return teamIdx;
	}

	public String getUseridx() {
		return useridx;
	}

	public String getGender() {
		return gender;
	}

	public String getTeamName() {
		return teamName;
	}

	public String getImage() {
		return image;
	}

	public String getImagePi() {
		return imagePi;
	}

	public List<UserVO> getMemberList() {
		return memberList;
	}

	//seters
	public void setTeamIdx(String teamIdx) {
		this.teamIdx = teamIdx;
	}

	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setImagePi(String imagePi) {
		this.imagePi = imagePi;
	}

	public void setMemberList(List<UserVO> memberList) {
		this.memberList = memberList;
	}

	@Override
	public String toString() {
		return "TeamVO [teamIdx=" + teamIdx + ", useridx=" + useridx + ", gender=" + gender + ", teamName=" + teamName
				+ ", image=" + image + ", imagePi=" + imagePi + ", memberList=" + memberList + "]";
	}
	
	
}
