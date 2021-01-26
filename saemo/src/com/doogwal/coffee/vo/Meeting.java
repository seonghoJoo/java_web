package com.doogwal.coffee.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Meeting {
	
		// schedules table
		private int no,districtNo,crewNo;	
		private char type;
		private Timestamp startDate,endDate;
		private String name,address,description;
		private double lat,lng;
		private Timestamp regdate;
		
		// meetings table
		private int point,themeNo, categoryNo;
		private char confirmation;
		private String img,place;
		
		public Meeting() {
			// TODO Auto-generated constructor stub
		}

		public int getNo() {
			return no;
		}

		public int getDistrictNo() {
			return districtNo;
		}

		public int getCrewNo() {
			return crewNo;
		}

		public char getType() {
			return type;
		}

		public Timestamp getStartDate() {
			return startDate;
		}

		public Timestamp getEndDate() {
			return endDate;
		}

		public String getName() {
			return name;
		}

		public String getAddress() {
			return address;
		}

		public String getDescription() {
			return description;
		}

		public double getLat() {
			return lat;
		}

		public double getLng() {
			return lng;
		}

		public Timestamp getRegdate() {
			return regdate;
		}

		public int getPoint() {
			return point;
		}

		public int getThemeNo() {
			return themeNo;
		}

		public int getCategoryNo() {
			return categoryNo;
		}

		public char getConfirmation() {
			return confirmation;
		}

		public String getImg() {
			return img;
		}

		public String getPlace() {
			return place;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public void setDistrictNo(int districtNo) {
			this.districtNo = districtNo;
		}

		public void setCrewNo(int crewNo) {
			this.crewNo = crewNo;
		}

		public void setType(char type) {
			this.type = type;
		}

		public void setStartDate(Timestamp startDate) {
			this.startDate = startDate;
		}

		public void setEndDate(Timestamp endDate) {
			this.endDate = endDate;
		}

		public void setName(String name) {
			this.name = name;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public void setLat(double lat) {
			this.lat = lat;
		}

		public void setLng(double lng) {
			this.lng = lng;
		}

		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}

		public void setPoint(int point) {
			this.point = point;
		}

		public void setThemeNo(int themeNo) {
			this.themeNo = themeNo;
		}

		public void setCategoryNo(int categoryNo) {
			this.categoryNo = categoryNo;
		}

		public void setConfirmation(char confirmation) {
			this.confirmation = confirmation;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public void setPlace(String place) {
			this.place = place;
		}

		
}
