package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Donor_Evaluation {
	
	//-----------필드: 5--------------
	private String Donor_Evaluation_idx;
	private String Donation_Action_idx;
	private String Member_Donor_idx;
	private String Donor_Evaluation_starNumber;
	private String Donor_Evaluation_note;
	
	//-----------생성자------------
	public DTO_Donor_Evaluation() {
		super();
	}

	public DTO_Donor_Evaluation(String donor_Evaluation_idx, String donation_Action_idx, String member_Donor_idx,
			String donor_Evaluation_starNumber, String donor_Evaluation_note) {
		super();
		Donor_Evaluation_idx = donor_Evaluation_idx;
		Donation_Action_idx = donation_Action_idx;
		Member_Donor_idx = member_Donor_idx;
		Donor_Evaluation_starNumber = donor_Evaluation_starNumber;
		Donor_Evaluation_note = donor_Evaluation_note;
	}

	//-----------Getter&Setter-----------
	public String getDonor_Evaluation_idx() {
		return Donor_Evaluation_idx;
	}

	public void setDonor_Evaluation_idx(String donor_Evaluation_idx) {
		Donor_Evaluation_idx = donor_Evaluation_idx;
	}

	public String getDonation_Action_idx() {
		return Donation_Action_idx;
	}

	public void setDonation_Action_idx(String donation_Action_idx) {
		Donation_Action_idx = donation_Action_idx;
	}

	public String getMember_Donor_idx() {
		return Member_Donor_idx;
	}

	public void setMember_Donor_idx(String member_Donor_idx) {
		Member_Donor_idx = member_Donor_idx;
	}

	public String getDonor_Evaluation_starNumber() {
		return Donor_Evaluation_starNumber;
	}

	public void setDonor_Evaluation_starNumber(String donor_Evaluation_starNumber) {
		Donor_Evaluation_starNumber = donor_Evaluation_starNumber;
	}

	public String getDonor_Evaluation_note() {
		return Donor_Evaluation_note;
	}

	public void setDonor_Evaluation_note(String donor_Evaluation_note) {
		Donor_Evaluation_note = donor_Evaluation_note;
	}
	
	
	

}
