package Paging;

public class BbsVO {

	private String bbsIdx;
	private String useridx;
	private String nickname;
	private String subject;
	private String content;
	private String writeDate;
	private String imageIdx;
	private String hit;
	
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
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [bbsIdx=" + bbsIdx + ", useridx=" + useridx + ", nickname=" + nickname + ", subject=" + subject
				+ ", content=" + content + ", writeDate=" + writeDate + ", imageIdx=" + imageIdx + ", hit=" + hit + "]";
	}
	
	
}
