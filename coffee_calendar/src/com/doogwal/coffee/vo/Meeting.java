package com.doogwal.coffee.vo;



import java.sql.Timestamp;

public class Meeting {
	
		// schedules table
		private int no,districtNo,crewNo;	
		private char type;
		//private Date startDate,endDate;
		private Timestamp startDate,endDate;//정진하 2021 0121 Date형에서 Timestamp형으로 수정함
		private String name,address,description;
		private double lat,lng;
		private Timestamp regdate;
		
		// meetings table
		private int meetingNo,point,themeNo;
		private char confirmation;
		private String img,place;
		
		//정진하 2021 01 24 crewName 멤버 필드 추가함
		private String crewName;
		private String startFrom, endHere;
		
		

		public Meeting() {
			// TODO Auto-generated constructor stub
		}
		
		//20210121 정진하 일별일정 에이젝스 서블릿 위해 인자 두개짜리 생성자 작성함.
//		public Meeting(int crewNo, Timestamp startDate) {
//			this.crewNo = crewNo;
//			this.startDate = startDate;
//		}
		
//		
//		
//		public Meeting(int crewNo, Date startDate) {
//			this.crewNo = crewNo;
//			this.startDate = startDate;
//		}
//		//20210122 정진하 monthly를 위해 추가
//		public Meeting(int crewNo) {
//			this.crewNo = crewNo;
//		}

		public Meeting(int no, int districtNo, int crewNo, char type, Timestamp startDate, Timestamp endDate, String name,
				String address, String description, double lat, double lng, int meetingNo, int point, int themeNo,
				char confirmation, String img, String place) {
			this.no = no;
			this.districtNo = districtNo;
			this.crewNo = crewNo;
			this.type = type;
			this.startDate = startDate;
			this.endDate = endDate;
			this.name = name;
			this.address = address;
			this.description = description;
			this.lat = lat;
			this.lng = lng;
			this.meetingNo = meetingNo;
			this.point = point;
			this.themeNo = themeNo;
			this.confirmation = confirmation;
			this.img = img;
			this.place = place;
		}
		
		

		public String getStartFrom() {
			return startFrom;
		}

		public void setStartFrom(String startFrom) {
			this.startFrom = startFrom;
		}

		public String getEndHere() {
			return endHere;
		}

		public void setEndHere(String endHere) {
			this.endHere = endHere;
		}

		public String getCrewName() {
			return crewName;
		}

		public void setCrewName(String crewName) {
			this.crewName = crewName;
		}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public int getDistrictNo() {
			return districtNo;
		}

		public void setDistrictNo(int districtNo) {
			this.districtNo = districtNo;
		}

		public int getCrewNo() {
			return crewNo;
		}

		public void setCrewNo(int crewNo) {
			this.crewNo = crewNo;
		}

		public char getType() {
			return type;
		}

		public void setType(char type) {
			this.type = type;
		}

		

//		public Date getStartDate() {
//			return startDate;
//		}
//
//		public void setStartDate(Date startDate) {
//			this.startDate = startDate;
//		}
//
//		public Date getEndDate() {
//			return endDate;
//		}
//
//		public void setEndDate(Date endDate) {
//			this.endDate = endDate;
//		}
		
		

		

		public Timestamp getStartDate() {
			return startDate;
		}

		public void setStartDate(Timestamp startDate) {
			this.startDate = startDate;
		}

		public Timestamp getEndDate() {
			return endDate;
		}

		public void setEndDate(Timestamp endDate) {
			this.endDate = endDate;
		}
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public double getLat() {
			return lat;
		}

		public void setLat(double lat) {
			this.lat = lat;
		}

		public double getLng() {
			return lng;
		}

		public void setLng(double lng) {
			this.lng = lng;
		}

		public int getMeetingNo() {
			return meetingNo;
		}

		public void setMeetingNo(int meetingNo) {
			this.meetingNo = meetingNo;
		}

		public int getPoint() {
			return point;
		}

		public void setPoint(int point) {
			this.point = point;
		}

		public int getThemeNo() {
			return themeNo;
		}

		public void setThemeNo(int themeNo) {
			this.themeNo = themeNo;
		}

		public char getConfirmation() {
			return confirmation;
		}

		public void setConfirmation(char confirmation) {
			this.confirmation = confirmation;
		}

		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public String getPlace() {
			return place;
		}

		public void setPlace(String place) {
			this.place = place;
		}
		
	
}
