package com.sport.joinBbs.vo;

public class JoinCommentVO {
	private int commentIdx; //댓글인덱스
	private String bbsIdx; //게시글인덱스
	private String useridx; //유저인덱스
	private String content; //댓글내용
	private String writeDate; //댓글작성일

	private String nickname; //작성자닉네임, SPORT_USER 테이블에서 가져옴 
	
	//getters
	public int getCommentIdx() {
		return commentIdx;
	}
	public String getBbsIdx() {
		return bbsIdx;
	}
	public String getUseridx() {
		return useridx;
	}
	public String getContent() {
		return content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public String getNickname() {
		return nickname;
	}
	
	//setters
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "JoinCommentVO [commentIdx=" + commentIdx + ", bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", content="
				+ content + ", writeDate=" + writeDate + ", nickname=" + nickname + "]";
	}
}
