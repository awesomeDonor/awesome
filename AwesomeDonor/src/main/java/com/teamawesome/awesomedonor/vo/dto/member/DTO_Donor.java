package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Donor {
	
	//-----------필드: 12--------------
	private String Member_Donor_idx;
	private String Member_Donor_idEmail;
	private String Member_Donor_pw;
	private String Member_Donor_name;
	private String Member_Donor_nickName;
	private String Member_Donor_birthDate;
	private String Member_Donor_phoneNumber;
	private String Member_Donor_address;
	private String Member_Donor_identified;
	private String Member_Donor_joinDate;
	private String Member_Donor_advertiseAgreed;
	private String Member_Donor_removed;
	
	//-----------생성자------------
	public DTO_Donor() {
		super();
	}

	public DTO_Donor(String member_Donor_idx, String member_Donor_idEmail, String member_Donor_pw,
			String member_Donor_name, String member_Donor_nickName, String member_Donor_birthDate,
			String member_Donor_phoneNumber, String member_Donor_address, String member_Donor_identified,
			String member_Donor_joinDate, String member_Donor_advertiseAgreed, String member_Donor_removed) {
		super();
		Member_Donor_idx = member_Donor_idx;
		Member_Donor_idEmail = member_Donor_idEmail;
		Member_Donor_pw = member_Donor_pw;
		Member_Donor_name = member_Donor_name;
		Member_Donor_nickName = member_Donor_nickName;
		Member_Donor_birthDate = member_Donor_birthDate;
		Member_Donor_phoneNumber = member_Donor_phoneNumber;
		Member_Donor_address = member_Donor_address;
		Member_Donor_identified = member_Donor_identified;
		Member_Donor_joinDate = member_Donor_joinDate;
		Member_Donor_advertiseAgreed = member_Donor_advertiseAgreed;
		Member_Donor_removed = member_Donor_removed;
	}

	//-----------Getter&Setter-----------
	public String getMember_Donor_idx() {
		return Member_Donor_idx;
	}


	public void setMember_Donor_idx(String member_Donor_idx) {
		Member_Donor_idx = member_Donor_idx;
	}


	public String getMember_Donor_idEmail() {
		return Member_Donor_idEmail;
	}


	public void setMember_Donor_idEmail(String member_Donor_idEmail) {
		Member_Donor_idEmail = member_Donor_idEmail;
	}


	public String getMember_Donor_pw() {
		return Member_Donor_pw;
	}


	public void setMember_Donor_pw(String member_Donor_pw) {
		Member_Donor_pw = member_Donor_pw;
	}


	public String getMember_Donor_name() {
		return Member_Donor_name;
	}


	public void setMember_Donor_name(String member_Donor_name) {
		Member_Donor_name = member_Donor_name;
	}


	public String getMember_Donor_nickName() {
		return Member_Donor_nickName;
	}


	public void setMember_Donor_nickName(String member_Donor_nickName) {
		Member_Donor_nickName = member_Donor_nickName;
	}


	public String getMember_Donor_birthDate() {
		return Member_Donor_birthDate;
	}


	public void setMember_Donor_birthDate(String member_Donor_birthDate) {
		Member_Donor_birthDate = member_Donor_birthDate;
	}


	public String getMember_Donor_phoneNumber() {
		return Member_Donor_phoneNumber;
	}


	public void setMember_Donor_phoneNumber(String member_Donor_phoneNumber) {
		Member_Donor_phoneNumber = member_Donor_phoneNumber;
	}


	public String getMember_Donor_address() {
		return Member_Donor_address;
	}


	public void setMember_Donor_address(String member_Donor_address) {
		Member_Donor_address = member_Donor_address;
	}


	public String getMember_Donor_identified() {
		return Member_Donor_identified;
	}


	public void setMember_Donor_identified(String member_Donor_identified) {
		Member_Donor_identified = member_Donor_identified;
	}


	public String getMember_Donor_joinDate() {
		return Member_Donor_joinDate;
	}


	public void setMember_Donor_joinDate(String member_Donor_joinDate) {
		Member_Donor_joinDate = member_Donor_joinDate;
	}


	public String getMember_Donor_advertiseAgreed() {
		return Member_Donor_advertiseAgreed;
	}


	public void setMember_Donor_advertiseAgreed(String member_Donor_advertiseAgreed) {
		Member_Donor_advertiseAgreed = member_Donor_advertiseAgreed;
	}


	public String getMember_Donor_removed() {
		return Member_Donor_removed;
	}


	public void setMember_Donor_removed(String member_Donor_removed) {
		Member_Donor_removed = member_Donor_removed;
	}
	
	
}
