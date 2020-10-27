package org.bmj.ims.vo;

import java.sql.Date;
import java.util.Calendar;

public class Idol {
	
	private String name,groupName, profileImage;
	private int idolId, groupId;
	private double height, weight;
	private Date birthDate;
	private char gender;
	
	//년 월 일 얻기용 SimpleDateFormat은 객체 3개 필요하나 Calendar는 하나로 조짐
	private Calendar cal;
	
	public Idol() {
		
	}
	
	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Idol(String name, int groupId, double height, double weight, Date birthDate, char gender) {
		this( 0,name,  groupId,  height,  weight,  birthDate,  gender,"","");
	}

	public Idol(String name, int groupId, double height, double weight, Date birthDate, char gender, String profile) {
		this(0,name,  groupId,  height,  weight,  birthDate,  gender,profile,"");
	}
	public Idol(String name,int groupId,double height,double weight,Date birthDate,char gender,String profile,String groupName) {
		this(0,name,groupId,height,weight,birthDate,gender,profile, groupName);
	}
	public Idol(int idolId,String name, int groupId, double height, double weight, Date birthDate, char gender, String groupName, String profileImage) {
		this.idolId = idolId;
		this.name = name;
		this.groupId = groupId;
		this.height = height;
		this.weight = weight;
		this.birthDate = birthDate;
		this.gender = gender;
		this.groupName = groupName;
		this.profileImage = profileImage;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIdolId() {
		return idolId;
	}
	public void setIdolId(int idolId) {
		this.idolId = idolId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
		cal = Calendar.getInstance();
		cal.setTime(birthDate);
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getBirthYear() {
		return cal.get(Calendar.YEAR);
	}
	public int getBirthMonth() {
		return cal.get(Calendar.MONTH)+1;
	}
	public int getBirthDay() {
		return cal.get(Calendar.DATE);
	}
	public String getBirthDateString() {
		return getBirthYear() + "년" + getBirthMonth() + "월" + this.getBirthDay() + "일";
	}
	public String getGenderIcon() {
		String icon = "<i class='fas fa-";
		if(gender=='F') icon+="fe";		
		icon+= "male'></i>";
		return icon;
	}
}
