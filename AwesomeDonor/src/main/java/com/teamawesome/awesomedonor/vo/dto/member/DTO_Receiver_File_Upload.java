package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Receiver_File_Upload {

	//-----------필드: 3--------------
	private String Receiver_File_Upload_idx;
	private String Member_Receiver_idx;
	private String Receiver_File_Upload_linkName;

	//-----------생성자------------
	public DTO_Receiver_File_Upload() {
		super();
	}

	public DTO_Receiver_File_Upload(String receiver_File_Upload_idx, String member_Receiver_idx,
			String receiver_File_Upload_linkName) {
		super();
		Receiver_File_Upload_idx = receiver_File_Upload_idx;
		Member_Receiver_idx = member_Receiver_idx;
		Receiver_File_Upload_linkName = receiver_File_Upload_linkName;
	}

	//-----------Getter&Setter-----------
	public String getReceiver_File_Upload_idx() {
		return Receiver_File_Upload_idx;
	}

	public void setReceiver_File_Upload_idx(String receiver_File_Upload_idx) {
		Receiver_File_Upload_idx = receiver_File_Upload_idx;
	}

	public String getMember_Receiver_idx() {
		return Member_Receiver_idx;
	}

	public void setMember_Receiver_idx(String member_Receiver_idx) {
		Member_Receiver_idx = member_Receiver_idx;
	}

	public String getReceiver_File_Upload_linkName() {
		return Receiver_File_Upload_linkName;
	}

	public void setReceiver_File_Upload_linkName(String receiver_File_Upload_linkName) {
		Receiver_File_Upload_linkName = receiver_File_Upload_linkName;
	}
	

	

}
