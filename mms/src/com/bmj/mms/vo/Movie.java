package com.bmj.mms.vo;

import java.sql.Date;
import java.util.Calendar;

public class Movie {
	private int no,audienceNum,genre;
	private String name,director,posterImage;
	private Date releaseDate,endDate;
	
	public String getPosterImage() {
		return posterImage;
	}

	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	private Calendar endCalendar;
	private Calendar releaseCalendar;
	
	private String genreName;
	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public Movie() {
		// 기본 생성자 호출
		endCalendar = Calendar.getInstance();
		releaseCalendar = Calendar.getInstance();
	}
	
	
	public Movie(int no, int audienceNum, int genre, String name, String director, Date releaseDate) {
		this(no,audienceNum,genre,name,director,releaseDate,null,"");
	}
	public Movie(int no, int audienceNum, int genre, String name, String director, Date releaseDate,Date endDate) {
		this(no,audienceNum,genre,name,director,releaseDate,endDate,"");
	}

	public Movie(int no, int audienceNum, int genre, String name, String director, Date releaseDate, Date endDate,
			String genreName) {
		this.no = no;
		this.audienceNum = audienceNum;
		this.genre = genre;
		this.name = name;
		this.director = director;
		this.releaseDate = releaseDate;
		this.endDate = endDate;
		this.genreName = genreName;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAudienceNum() {
		return audienceNum;
	}
	public void setAudienceNum(int audienceNum) {
		this.audienceNum = audienceNum;
	}
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		releaseCalendar.setTime(releaseDate);
		this.releaseDate = releaseDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		if(endDate!=null) {
			endCalendar.setTime(endDate);
		}
		this.endDate = endDate;
	}

	public int getEndYear() {
		return endCalendar.get(Calendar.YEAR);
	}
	public int getEndMonth() {
		return endCalendar.get(Calendar.MONTH)+1;
	}
	public int getEndDay() {
		return endCalendar.get(Calendar.DATE);
	}
	public int getReleaseYear() {
		return releaseCalendar.get(Calendar.YEAR);
	}
	public int getReleaseMonth() {
		return releaseCalendar.get(Calendar.MONTH)+1;
	}
	public int getReleaseDay() {
		return releaseCalendar.get(Calendar.DATE);
	}
	
}
