package Paging;

public class CommentVO {
	private String commentIdx;
	private String useridx;
	private String nickname;
	private String bbsIdx;
	private String content;
	private String writeDate;

	public String getCommentIdx() {
		return commentIdx;
	}

	public void setCommentIdx(String commentIdx) {
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

	public String getBbsIdx() {
		return bbsIdx;
	}

	public void setBbsIdx(String bbsIdx) {
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
