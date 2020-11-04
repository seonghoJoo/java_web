package com.bmj.phonebook.vo;

import java.sql.Timestamp;

public class Member{
	private int no;
	private String id,password,nickName ;
	private Timestamp regdate;
	private String profileImage;
	
	
	public Member() {
	}
	

	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

		
	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	

}
