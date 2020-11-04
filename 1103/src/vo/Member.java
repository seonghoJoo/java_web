package vo;

import java.sql.Timestamp;

public class Member{
	private int no;
	private String id,password,nickname ;
	private Timestamp regdate;
	private String imageProfile;
	
	public String getImageProfile() {
		return imageProfile;
	}


	public void setImageProfile(String imageProfile) {
		this.imageProfile = imageProfile;
	}


	public Member() {
	}
	
		
	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	

}
