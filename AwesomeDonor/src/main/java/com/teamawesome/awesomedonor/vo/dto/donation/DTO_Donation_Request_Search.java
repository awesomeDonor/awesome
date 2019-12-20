package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Donation_Request_Search {
	
	//-----------필드: 7--------------
	private String Donation_Request_Search_idx;
	private String Member_Receiver_idx;
	private String Member_Receiver_Category;
	private String Member_Receiver_name;
	private String Member_Receiver_AdCategory;
	private String Member_Receiver_adDetail;
	private String Donation_Request_idx;
	private String Donation_Request_progress;
	
	//-----------생성자------------	
	public DTO_Donation_Request_Search() {
		super();
	}

	public DTO_Donation_Request_Search(String donation_Request_Search_idx, String member_Receiver_idx,
			String member_Receiver_Category, String member_Receiver_name, String member_Receiver_AdCategory,
			String member_Receiver_adDetail, String donation_Request_idx, String donation_Request_progress) {
		super();
		Donation_Request_Search_idx = donation_Request_Search_idx;
		Member_Receiver_idx = member_Receiver_idx;
		Member_Receiver_Category = member_Receiver_Category;
		Member_Receiver_name = member_Receiver_name;
		Member_Receiver_AdCategory = member_Receiver_AdCategory;
		Member_Receiver_adDetail = member_Receiver_adDetail;
		Donation_Request_idx = donation_Request_idx;
		Donation_Request_progress = donation_Request_progress;
	}

	//-----------Getter&Setter-----------
	public String getDonation_Request_Search_idx() {
		return Donation_Request_Search_idx;
	}

	public void setDonation_Request_Search_idx(String donation_Request_Search_idx) {
		Donation_Request_Search_idx = donation_Request_Search_idx;
	}

	public String getMember_Receiver_idx() {
		return Member_Receiver_idx;
	}

	public void setMember_Receiver_idx(String member_Receiver_idx) {
		Member_Receiver_idx = member_Receiver_idx;
	}

	public String getMember_Receiver_Category() {
		return Member_Receiver_Category;
	}

	public void setMember_Receiver_Category(String member_Receiver_Category) {
		Member_Receiver_Category = member_Receiver_Category;
	}

	public String getMember_Receiver_name() {
		return Member_Receiver_name;
	}

	public void setMember_Receiver_name(String member_Receiver_name) {
		Member_Receiver_name = member_Receiver_name;
	}

	public String getMember_Receiver_AdCategory() {
		return Member_Receiver_AdCategory;
	}

	public void setMember_Receiver_AdCategory(String member_Receiver_AdCategory) {
		Member_Receiver_AdCategory = member_Receiver_AdCategory;
	}

	public String getMember_Receiver_adDetail() {
		return Member_Receiver_adDetail;
	}

	public void setMember_Receiver_adDetail(String member_Receiver_adDetail) {
		Member_Receiver_adDetail = member_Receiver_adDetail;
	}

	public String getDonation_Request_idx() {
		return Donation_Request_idx;
	}

	public void setDonation_Request_idx(String donation_Request_idx) {
		Donation_Request_idx = donation_Request_idx;
	}

	public String getDonation_Request_progress() {
		return Donation_Request_progress;
	}

	public void setDonation_Request_progress(String donation_Request_progress) {
		Donation_Request_progress = donation_Request_progress;
	}

}