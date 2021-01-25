package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class CrewApp {
	
	private int no,userNo,crewNo;
	private char acceptance;
	private Timestamp regdate;
	private String introduce;
	
	public CrewApp() {
		// TODO Auto-generated constructor stub
	}

	public CrewApp( int crewNo, int userNo) {
		this.crewNo = crewNo;
		this.userNo = userNo;
	}

	
	
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCrewNo() {
		return crewNo;
	}

	public void setCrewNo(int crewNo) {
		this.crewNo = crewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public char getAcceptance() {
		return acceptance;
	}

	public void setAcceptance(char acceptance) {
		this.acceptance = acceptance;
	}
	
}
