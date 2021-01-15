package com.doogwal.coffee.vo;

public class CrewPostPageVO {
	
	private int start, end, crewNo;
	
	public CrewPostPageVO() {
		// TODO Auto-generated constructor stub
	}

	public CrewPostPageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end-numPage+1;
	}
	
	public CrewPostPageVO(int pageNo, 
			int numPage,
			int crewNo) {
		end = pageNo * numPage;
		start = end-numPage+1;
		this.crewNo = crewNo;
	}
	
	public int getCrewNo() {
		return crewNo;
	}

	public void setCrewNo(int crewNo) {
		this.crewNo = crewNo;
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
