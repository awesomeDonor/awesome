package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Stuff_MajorCategory {
	
	//-----------필드: 2--------------
	private String Stuff_MajorCategory_idx;
	private String Stuff_MajorCategory_entry;
	
	//-----------생성자------------
	public DTO_Stuff_MajorCategory() {
		super();
	}

	public DTO_Stuff_MajorCategory(String stuff_MajorCategory_idx, String stuff_MajorCategory_entry) {
		super();
		Stuff_MajorCategory_idx = stuff_MajorCategory_idx;
		Stuff_MajorCategory_entry = stuff_MajorCategory_entry;
	}
	
	//-----------Getter&Setter-----------
	public String getStuff_MajorCategory_idx() {
		return Stuff_MajorCategory_idx;
	}

	public void setStuff_MajorCategory_idx(String stuff_MajorCategory_idx) {
		Stuff_MajorCategory_idx = stuff_MajorCategory_idx;
	}

	public String getStuff_MajorCategory_entry() {
		return Stuff_MajorCategory_entry;
	}

	public void setStuff_MajorCategory_entry(String stuff_MajorCategory_entry) {
		Stuff_MajorCategory_entry = stuff_MajorCategory_entry;
	}

}
