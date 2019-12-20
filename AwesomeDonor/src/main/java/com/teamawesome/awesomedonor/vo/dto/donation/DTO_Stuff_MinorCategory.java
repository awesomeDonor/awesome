package com.teamawesome.awesomedonor.vo.dto.donation;

public class DTO_Stuff_MinorCategory {
	
	//-----------필드: 3--------------
	private String Stuff_MinorCategory_idx;
	private String Stuff_MajorCategory_idx;
	private String Stuff_MinorCategory_entry;
	
	//-----------생성자------------
	public DTO_Stuff_MinorCategory() {
		super();
	}

	public DTO_Stuff_MinorCategory(String stuff_MinorCategory_idx, String stuff_MajorCategory_idx,
			String stuff_MinorCategory_entry) {
		super();
		Stuff_MinorCategory_idx = stuff_MinorCategory_idx;
		Stuff_MajorCategory_idx = stuff_MajorCategory_idx;
		Stuff_MinorCategory_entry = stuff_MinorCategory_entry;
	}

	//-----------Getter&Setter-----------
	public String getStuff_MinorCategory_idx() {
		return Stuff_MinorCategory_idx;
	}

	public void setStuff_MinorCategory_idx(String stuff_MinorCategory_idx) {
		Stuff_MinorCategory_idx = stuff_MinorCategory_idx;
	}

	public String getStuff_MajorCategory_idx() {
		return Stuff_MajorCategory_idx;
	}

	public void setStuff_MajorCategory_idx(String stuff_MajorCategory_idx) {
		Stuff_MajorCategory_idx = stuff_MajorCategory_idx;
	}

	public String getStuff_MinorCategory_entry() {
		return Stuff_MinorCategory_entry;
	}

	public void setStuff_MinorCategory_entry(String stuff_MinorCategory_entry) {
		Stuff_MinorCategory_entry = stuff_MinorCategory_entry;
	}
	

	
	

}
