package com.doogwal.coffee.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {

	private int no,score;
	private String id,password,nickname,profile;
	private Date birthDate;
	private Timestamp regdate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Member(String id, String password, String nickname, String profile, Date birthDate) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.profile = profile;
		this.birthDate = birthDate;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
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

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
}

