package com.bmj.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Phone {
	int no;
	String name, phone; 
	char gender;
	Date birthDate;
	Timestamp regdate;
	public Phone() {
		
	}
	public Phone(String name, String phone, char gender, Date birthDate) {
		this(0,  name,  phone,  gender,  birthDate);
	}
	public Phone(int no, String name, String phone, char gender, Date birthDate) {
		this(no,  name,  phone,  gender,  birthDate, null);
	}
	public Phone(int no, String name, String phone, char gender, Date birthDate, Timestamp regdate) {
		this.no = no;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
		this.regdate = regdate;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
