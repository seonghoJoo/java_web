package com.bmj.model1.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Article {
	
	private int replyCount,
	no,hit,memberNo,likeCount;
	private String nickname, profile,
	title, contents;
	private Timestamp regdate;
	
	public Article(
			String title,
			String contents,
			int no) {
		this.no = no;
		this.title = title;
		this.contents = contents;
	}
	
	public Article(int memberNo,
			String title,
			String contents) {
		this.memberNo = memberNo;
		this.title = title;
		this.contents = contents;
	}

	public Article() {
		// TODO Auto-generated constructor stub
	}
	
	public String getFormatRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss.SSS초");
		return sdf.format(regdate);
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}



	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
