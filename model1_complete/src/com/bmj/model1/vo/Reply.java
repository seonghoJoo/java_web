package com.bmj.model1.vo;

import java.sql.Timestamp;

public class Reply {
	
	private int no,memberNo,boardNo;
	private String contents,nickname, profile;
	private Timestamp regdate;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int memberNo, int boardNo, String contents) {
		super();
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.contents = contents;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
