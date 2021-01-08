package vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//데코레이트 패턴 클래스 위에다가 속성을 무시할거야라고 작성하는 것(전처리)
@JsonIgnoreProperties({
	"id",
	"icon",
	"userId",
	"postId",
	"forumId",
	"parentId",
	"type",
	"status",
	"flags",
	"createdAt",
	"updatedAt",
	"childCount",
	"recommendCount",
	"screenedByKeeper"
})
public class Comment {
	
	private int likeCount;
	private int dislikeCount;
	private int rating;
	private String content;
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(int dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
