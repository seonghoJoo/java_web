package org.bmj.ims.vo;

import java.sql.Date;
import java.util.Calendar;

public class Group {
	private int groupId;
	private String name;
	private Date debutDate;
	
	//내부에서 사용만 하는 멤버필드 세터게터 노필요
	private Calendar cal;
	public Group () {
		
	}
	public Group( String name, Date debutDate) {
		this(0,name,debutDate);
	}
	public Group(int groupId, String name, Date debutDate) {
		this.groupId = groupId;
		this.name = name;
		this.debutDate = debutDate;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDebutDate() {
		return debutDate;
	}
	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
		cal = Calendar.getInstance();
		cal.setTime(debutDate);
	}
	// 자바에서는 캘린더 객체를 사용해서 연 월 일 을 구함
	public int getDebutYear() {
		return cal.get(Calendar.YEAR);
	}
	public int getDebutMonth() {
		return cal.get(Calendar.MONTH)+1;
	}
	public int getDebutDay() {
		return cal.get(Calendar.DATE);
	}
	
}
