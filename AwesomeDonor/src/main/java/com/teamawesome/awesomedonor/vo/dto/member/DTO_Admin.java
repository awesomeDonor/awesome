package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Admin {
	
	//-----------필드: 3--------------
	private String Member_Admin_idx;
	private String Member_Admin_id;
	private String Member_Admin_pw;
	
	//-----------생성자------------
	public DTO_Admin() {
		super();
	}

	public DTO_Admin(String member_Admin_idx, String member_Admin_id, String member_Admin_pw) {
		super();
		Member_Admin_idx = member_Admin_idx;
		Member_Admin_id = member_Admin_id;
		Member_Admin_pw = member_Admin_pw;
	}

	//-----------Getter&Setter-----------
	public String getMember_Admin_idx() {
		return Member_Admin_idx;
	}



	public void setMember_Admin_idx(String member_Admin_idx) {
		Member_Admin_idx = member_Admin_idx;
	}



	public String getMember_Admin_id() {
		return Member_Admin_id;
	}



	public void setMember_Admin_id(String member_Admin_id) {
		Member_Admin_id = member_Admin_id;
	}



	public String getMember_Admin_pw() {
		return Member_Admin_pw;
	}



	public void setMember_Admin_pw(String member_Admin_pw) {
		Member_Admin_pw = member_Admin_pw;
	}
	
	
	
	

}
