package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Donation_Request {
	
	//-----------필드: 9--------------
	private String Donation_Request_idx;
	private String Member_Receiver_idx;
	private String Stuff_MajorCategory_entry;
	private String Stuff_MinorCategory_entry;
	private String Donation_Request_amount;
	private String Donation_Request_writeDate;
	private String Donation_Request_note;
	private String Member_Receiver_parkingSpace;
	private String Donation_Request_progress;//후원신청가능-0, 진행중-1, 후원완료-2
	
	//-----------생성자------------
	public DTO_Donation_Request() {
		super();
	}
	
	public DTO_Donation_Request(String donation_Request_idx, String member_Receiver_idx,
			String stuff_MajorCategory_entry, String stuff_MinorCategory_entry, String donation_Request_amount,
			String donation_Request_writeDate, String donation_Request_note, String member_Receiver_parkingSpace,
			String donation_Request_progress) {
		super();
		Donation_Request_idx = donation_Request_idx;
		Member_Receiver_idx = member_Receiver_idx;
		Stuff_MajorCategory_entry = stuff_MajorCategory_entry;
		Stuff_MinorCategory_entry = stuff_MinorCategory_entry;
		Donation_Request_amount = donation_Request_amount;
		Donation_Request_writeDate = donation_Request_writeDate;
		Donation_Request_note = donation_Request_note;
		Member_Receiver_parkingSpace = member_Receiver_parkingSpace;
		Donation_Request_progress = donation_Request_progress;
	}
	
	//-----------Getter&Setter-----------
	public String getDonation_Request_idx() {
		return Donation_Request_idx;
	}

	public void setDonation_Request_idx(String donation_Request_idx) {
		Donation_Request_idx = donation_Request_idx;
	}

	public String getMember_Receiver_idx() {
		return Member_Receiver_idx;
	}

	public void setMember_Receiver_idx(String member_Receiver_idx) {
		Member_Receiver_idx = member_Receiver_idx;
	}

	public String getStuff_MajorCategory_entry() {
		return Stuff_MajorCategory_entry;
	}

	public void setStuff_MajorCategory_entry(String stuff_MajorCategory_entry) {
		Stuff_MajorCategory_entry = stuff_MajorCategory_entry;
	}

	public String getStuff_MinorCategory_entry() {
		return Stuff_MinorCategory_entry;
	}

	public void setStuff_MinorCategory_entry(String stuff_MinorCategory_entry) {
		Stuff_MinorCategory_entry = stuff_MinorCategory_entry;
	}

	public String getDonation_Request_amount() {
		return Donation_Request_amount;
	}

	public void setDonation_Request_amount(String donation_Request_amount) {
		Donation_Request_amount = donation_Request_amount;
	}

	public String getDonation_Request_writeDate() {
		return Donation_Request_writeDate;
	}

	public void setDonation_Request_writeDate(String donation_Request_writeDate) {
		Donation_Request_writeDate = donation_Request_writeDate;
	}

	public String getDonation_Request_note() {
		return Donation_Request_note;
	}

	public void setDonation_Request_note(String donation_Request_note) {
		Donation_Request_note = donation_Request_note;
	}

	public String getMember_Receiver_parkingSpace() {
		return Member_Receiver_parkingSpace;
	}

	public void setMember_Receiver_parkingSpace(String member_Receiver_parkingSpace) {
		Member_Receiver_parkingSpace = member_Receiver_parkingSpace;
	}

	public String getDonation_Request_progress() {
		return Donation_Request_progress;
	}

	public void setDonation_Request_progress(String donation_Request_progress) {
		Donation_Request_progress = donation_Request_progress;
	}
	
}
