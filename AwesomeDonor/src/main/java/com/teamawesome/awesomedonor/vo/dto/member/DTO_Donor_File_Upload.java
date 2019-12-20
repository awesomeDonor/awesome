package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Donor_File_Upload {
	
	//-----------필드: 3--------------
	private String Donor_File_Upload_idx;
	private String Member_Donor_idx;
	private String Donor_File_Upload_linkName;
	
	//-----------생성자------------
	public DTO_Donor_File_Upload() {
		super();
	}

	public DTO_Donor_File_Upload(String donor_File_Upload_idx, String member_Donor_idx,
			String donor_File_Upload_linkName) {
		super();
		Donor_File_Upload_idx = donor_File_Upload_idx;
		Member_Donor_idx = member_Donor_idx;
		Donor_File_Upload_linkName = donor_File_Upload_linkName;
	}
	
	//-----------Getter&Setter-----------
	public String getDonor_File_Upload_idx() {
		return Donor_File_Upload_idx;
	}


	public void setDonor_File_Upload_idx(String donor_File_Upload_idx) {
		Donor_File_Upload_idx = donor_File_Upload_idx;
	}


	public String getMember_Donor_idx() {
		return Member_Donor_idx;
	}


	public void setMember_Donor_idx(String member_Donor_idx) {
		Member_Donor_idx = member_Donor_idx;
	}


	public String getDonor_File_Upload_linkName() {
		return Donor_File_Upload_linkName;
	}


	public void setDonor_File_Upload_linkName(String donor_File_Upload_linkName) {
		Donor_File_Upload_linkName = donor_File_Upload_linkName;
	}
	
	

}
