package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Donation_Selection {
	
	//-----------필드: 4--------------
	private String Donation_Selection_idx;
	private String Member_Donor_idx;
	private String Donation_Request_idx;
	private String Donation_Selection_decided;
	
	//-----------생성자------------
	public DTO_Donation_Selection() {
		super();
	}

	public DTO_Donation_Selection(String donation_Selection_idx, String member_Donor_idx, String donation_Request_idx,
			String donation_Selection_decided) {
		super();
		Donation_Selection_idx = donation_Selection_idx;
		Member_Donor_idx = member_Donor_idx;
		Donation_Request_idx = donation_Request_idx;
		Donation_Selection_decided = donation_Selection_decided;
	}

	//-----------Getter&Setter-----------
	public String getDonation_Selection_idx() {
		return Donation_Selection_idx;
	}

	public void setDonation_Selection_idx(String donation_Selection_idx) {
		Donation_Selection_idx = donation_Selection_idx;
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

	public String getDonation_Selection_decided() {
		return Donation_Selection_decided;
	}

	public void setDonation_Selection_decided(String donation_Selection_decided) {
		Donation_Selection_decided = donation_Selection_decided;
	}
	
	

}
