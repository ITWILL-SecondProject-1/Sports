package com.sports.model.vo;

public class BoardCommentVO {
	private int commentIdx;
	private String useridx;
	private String nickname;
	private int bbsIdx;
	private String content;
	private String writeDate;
	
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
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
	
	@Override
	public String toString() {
		return "BoardCommentVO [commentIdx=" + commentIdx + ", useridx=" + useridx + ", nickname=" + nickname
				+ ", bbsIdx=" + bbsIdx + ", content=" + content + ", writeDate=" + writeDate + "]";
	}
}
