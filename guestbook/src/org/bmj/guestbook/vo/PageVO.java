package org.bmj.guestbook.vo;

public class PageVO {
	private int start, end;

	public PageVO() {
		
	}
	public PageVO(int pageNo, int numPage) {
		this.end = numPage * pageNo;
		this.start = this.end - numPage + 1;
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
