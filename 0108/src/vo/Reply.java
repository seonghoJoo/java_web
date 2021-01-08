package vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({"likeCount"})
public class Reply {
	
	private String comment, nickname;
	private int no;

	public Reply() {
	}

	public Reply(int no,
			String comment,
			String nickname) {
		this.comment = comment;
		this.nickname = nickname;
		this.no = no;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
		
}
