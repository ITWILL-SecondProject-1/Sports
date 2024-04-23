package Paging;

import java.sql.Date;

public class BbsVO {

	private int bbsIdx;
	private String useridx;
	private String subject;
	private String content;
	private Date writeDate;
	private String image;
	
	public String getUseridx() {
		return useridx;
	}
	public void setUseridx(String useridx) {
		this.useridx = useridx;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bbsId=" + bbsIdx + ", userIdx=" + useridx + ", subject=" + subject + ", content=" + content
				+ ", writeDate=" + writeDate + ", image=" + image + "]";
	}

}
