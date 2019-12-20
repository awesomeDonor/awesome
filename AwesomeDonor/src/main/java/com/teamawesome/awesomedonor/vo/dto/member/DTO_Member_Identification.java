package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Member_Identification {

	private String Member_Receiver_idx;
	private String Member_Donor_idx;
	private String Member_identificationCode;
	
	//---------------------
	public DTO_Member_Identification() {
		super();
	}

	public DTO_Member_Identification(String member_Receiver_idx, String member_Donor_idx,
			String member_identificationCode) {
		super();
		Member_Receiver_idx = member_Receiver_idx;
		Member_Donor_idx = member_Donor_idx;
		Member_identificationCode = member_identificationCode;
	}

	//----------------------
	public String getMember_Receiver_idx() {
		return Member_Receiver_idx;
	}

	public void setMember_Receiver_idx(String member_Receiver_idx) {
		Member_Receiver_idx = member_Receiver_idx;
	}

	public String getMember_Donor_idx() {
		return Member_Donor_idx;
	}

	public void setMember_Donor_idx(String member_Donor_idx) {
		Member_Donor_idx = member_Donor_idx;
	}

	public String getMember_identificationCode() {
		return Member_identificationCode;
	}

	public void setMember_identificationCode(String member_identificationCode) {
		Member_identificationCode = member_identificationCode;
	}
	
	
	
	
}
