package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Receiver_Like {
	
	//-----------필드: 3--------------
	private String Receiver_Like_idx;
	private String Member_Receiver_idx;
	private String Member_Donor_idx;
	
	//-----------생성자------------
	public DTO_Receiver_Like() {
		super();
	}

	public DTO_Receiver_Like(String receiver_Like_idx, String member_Receiver_idx, String member_Donor_idx) {
		super();
		Receiver_Like_idx = receiver_Like_idx;
		Member_Receiver_idx = member_Receiver_idx;
		Member_Donor_idx = member_Donor_idx;
	}

	//-----------Getter&Setter-----------
	public String getReceiver_Like_idx() {
		return Receiver_Like_idx;
	}

	public void setReceiver_Like_idx(String receiver_Like_idx) {
		Receiver_Like_idx = receiver_Like_idx;
	}

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
	
	
	
	

}
