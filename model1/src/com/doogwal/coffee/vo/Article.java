package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class Article {

	private int no,memberNo,hit;
	private String title,contents;
	private Timestamp regdate;

	public Article() {
		// TODO Auto-generated constructor stub
	}
	
	public Article(int memberNo, String title, String contents) {
		this.memberNo = memberNo;
		this.title = title;
		this.contents = contents;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
