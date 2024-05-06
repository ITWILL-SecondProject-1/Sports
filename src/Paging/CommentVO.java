package Paging;

import org.json.simple.JSONObject;

import com.sports.model.dao.UserDAO;

public class CommentVO {
	private String commentIdx;
	private String useridx;
	private String nickname;
	private String bbsIdx;
	private String content;
	private String writeDate;
	private String profileImg;
	private String email;

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
		this.profileImg = UserDAO.indexToUserInfo(useridx).getImage();
		this.email = UserDAO.indexToUserInfo(useridx).getEmail();
		this.nickname = UserDAO.indexToUserInfo(useridx).getNickname();
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

	public String getProfileImg() {
		return profileImg;
	}

	public String getEmail() {
		return email;
	}

	//JSON객체로 변환하는 메소드
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject() {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("commentIdx", commentIdx);
		jsonObj.put("useridx", useridx);
		jsonObj.put("nickname", nickname);
		jsonObj.put("bbsIdx", bbsIdx);
		jsonObj.put("content", content);
		jsonObj.put("writeDate", writeDate);
		jsonObj.put("profileImg", profileImg);
		jsonObj.put("email", email);
		
		return jsonObj;
	}

	@Override
	public String toString() {
		return "CommentVO [commentIdx=" + commentIdx + ", useridx=" + useridx + ", nickname=" + nickname + ", bbsIdx="
				+ bbsIdx + ", content=" + content + ", writeDate=" + writeDate + ", profileImg=" + profileImg
				+ ", email=" + email + "]";
	}
	
}
