package com.bmj.phonebook.vo;

public class PageVO {
	
	private int start,end;
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	public PageVO(int pageNo,int numPage) {
		end = numPage * pageNo;
		start = end - numPage + 1;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	

}
