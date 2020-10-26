package com.bmj.phonebook.vo;

import java.sql.Timestamp;

public class IP {
	int no;
	String ip;
	Timestamp regdate;
	public IP() {
		
	}
	public IP(String ip) {
		this(0,ip,null);
	}
	
	public IP(int no, String ip, Timestamp regdate) {
		this.no = no;
		this.ip = ip;
		this.regdate = regdate;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
