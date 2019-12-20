package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Donation_Action {

	//-----------필드: 8--------------
	private String Donation_Action_idx;
	private String Member_Donor_idx;
	private String Donation_Request_idx;
	private String Member_Receiver_idx;
	private String Donation_Action_contactNumber;
	private String Donation_Action_meetingDate;
	private String Donation_Action_completeDate;
	private String Donation_Action_approval;
	private String Donation_Action_completed;
	
	//-----------생성자------------
	public DTO_Donation_Action() {
		super();
	}

	public DTO_Donation_Action(String donation_Action_idx, String member_Donor_idx, String donation_Request_idx,
			String member_Receiver_idx, String donation_Action_contactNumber, String donation_Action_meetingDate,
			String donation_Action_completeDate, String donation_Action_approval, String donation_Action_completed) {
		super();
		Donation_Action_idx = donation_Action_idx;
		Member_Donor_idx = member_Donor_idx;
		Donation_Request_idx = donation_Request_idx;
		Member_Receiver_idx = member_Receiver_idx;
		Donation_Action_contactNumber = donation_Action_contactNumber;
		Donation_Action_meetingDate = donation_Action_meetingDate;
		Donation_Action_completeDate = donation_Action_completeDate;
		Donation_Action_approval = donation_Action_approval;
		Donation_Action_completed = donation_Action_completed;
	}

	//-----------Getter&Setter-----------
	public String getDonation_Action_idx() {
		return Donation_Action_idx;
	}



	public String getMember_Receiver_idx() {
		return Member_Receiver_idx;
	}

	public void setMember_Receiver_idx(String member_Receiver_idx) {
		Member_Receiver_idx = member_Receiver_idx;
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



	public String getDonation_Request_idx() {
		return Donation_Request_idx;
	}



	public void setDonation_Request_idx(String donation_Request_idx) {
		Donation_Request_idx = donation_Request_idx;
	}



	public String getDonation_Action_contactNumber() {
		return Donation_Action_contactNumber;
	}



	public void setDonation_Action_contactNumber(String donation_Action_contactNumber) {
		Donation_Action_contactNumber = donation_Action_contactNumber;
	}



	public String getDonation_Action_meetingDate() {
		return Donation_Action_meetingDate;
	}



	public void setDonation_Action_meetingDate(String donation_Action_meetingDate) {
		Donation_Action_meetingDate = donation_Action_meetingDate;
	}



	public String getDonation_Action_completeDate() {
		return Donation_Action_completeDate;
	}



	public void setDonation_Action_completeDate(String donation_Action_completeDate) {
		Donation_Action_completeDate = donation_Action_completeDate;
	}



	public String getDonation_Action_approval() {
		return Donation_Action_approval;
	}



	public void setDonation_Action_approval(String donation_Action_approval) {
		Donation_Action_approval = donation_Action_approval;
	}



	public String getDonation_Action_completed() {
		return Donation_Action_completed;
	}



	public void setDonation_Action_completed(String donation_Action_completed) {
		Donation_Action_completed = donation_Action_completed;
	}
	
	
	
	
	
}
