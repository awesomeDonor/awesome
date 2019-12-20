package com.teamawesome.awesomedonor.vo.dto.adminspace;

public class DTO_Website_Introduction {
	
	//-----------필드: 2--------------
	private String Website_Introduction_idx;
	private String Website_Introduction_content;
	
	//-----------생성자------------
	public DTO_Website_Introduction() {
		super();
	}

	public DTO_Website_Introduction(String website_Introduction_idx, String website_Introduction_content) {
		super();
		Website_Introduction_idx = website_Introduction_idx;
		Website_Introduction_content = website_Introduction_content;
	}

	//-----------Getter&Setter-----------
	public String getWebsite_Introduction_idx() {
		return Website_Introduction_idx;
	}

	public void setWebsite_Introduction_idx(String website_Introduction_idx) {
		Website_Introduction_idx = website_Introduction_idx;
	}

	public String getWebsite_Introduction_content() {
		return Website_Introduction_content;
	}

	public void setWebsite_Introduction_content(String website_Introduction_content) {
		Website_Introduction_content = website_Introduction_content;
	}
	
	
	

}
