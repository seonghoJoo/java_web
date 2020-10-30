package com.bmj.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

public class Phone {
	private int no;
	private String name, phone;
	private char gender;
	private Date birthDate;
	private Timestamp regdate;
	
	private Calendar calendar;
	private int nowYear;

	//mybatis 기본생성자 호출 
	// 생성자가 멤버필드의 초기화를 담당하니깐 생성자에 쓰는게 맞음
	public Phone() {
		System.out.println("객체 생성자 호출");
		//인스턴스화
		calendar = Calendar.getInstance();
		nowYear = calendar.get(Calendar.YEAR);
	}
	
	public Phone(String name, String phone, char gender, Date birthDate) {
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
	}
	

	public Phone(int no, String name, String phone, char gender, Date birthDate) {
		this.no = no;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
	}
	public String getPhoneFormat() {
		return getPhone1()+"-" + getPhone2()+ "-"+getPhone3();
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
		calendar.setTime(birthDate);
		this.birthDate = birthDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getPhone1(){
		return phone.substring(0,3);
	}
	
	public String getPhone2(){
		return phone.substring(3,phone.length()-4);
	}
	
	public String getPhone3(){
		return phone.substring(phone.length()-4,phone.length());
	}
	
	public int getYear() {
		return calendar.get(Calendar.YEAR);
	}
	
	public int getMonth() {
		return calendar.get(Calendar.MONTH)+1;
	}
	
	public int getDate() {
		return calendar.get(Calendar.DATE);
	}
	
	public String getGenderIcon() {
		String tmp =  "<i class='fas fa-";
		if(gender=='F') {
			return tmp+"female'></i> 여자";
		}
		return tmp +"male'></i> 남자";
	}
	public int getAge() {
		return nowYear - getYear()+1;
	}
	
}
