package com.bmj.model1.vo;

import java.sql.Timestamp;

public class Like {
	
	//Type의 약어(키워드)를 상수로 처리
	public static final String BOARD = "B";
	public static final String REPLY = "R";
	
	private int no, memberNo, typeNo;
	private String type; // board B, reply R 
	private Timestamp regdate;
	
	public Like() {
	}

	public Like(int memberNo, int typeNo, String type) {
		super();
		this.memberNo = memberNo;
		this.typeNo = typeNo;
		this.type = type;
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

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	

}
