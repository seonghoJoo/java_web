package org.bmj.guestbook.vo;

import java.sql.Timestamp;

public class Guest {
	private int no;
	private char emotion;
	private String writer, contents, ip;
	// timestamp 밀리초까지 테이블 만들때 regdate 무적권 필수 
	private Timestamp regdate;	//registerdate 준말
	public Guest() {
		
	}
	
	
	public Guest(char emotion, String writer, String contents, String ip) {
		this( 0,  emotion,  writer,  contents,  ip,  null);
	}
	
	public Guest(int no,char emotion, String writer, String contents, String ip) {
		this( no,  emotion,  writer,  contents,  ip,  null);
	}


	public Guest(int no, char emotion, String writer, String contents, String ip, Timestamp regdate) {
		
		this.no = no;
		this.emotion = emotion;
		this.writer = writer;
		this.contents = contents;
		this.ip = ip;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public char getEmotion() {
		return emotion;
	}
	public void setEmotion(char emotion) {
		this.emotion = emotion;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
