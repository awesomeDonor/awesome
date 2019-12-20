package com.teamawesome.awesomedonor.vo.dto.member;

public class DTO_Admin_File {
	
	private String f_idx;
	private String f_link_name;
	
	public DTO_Admin_File() {
		super();
	}

	public DTO_Admin_File(String f_idx, String f_link_name) {
		super();
		this.f_idx = f_idx;
		this.f_link_name = f_link_name;
	}

	public String getF_idx() {
		return f_idx;
	}

	public void setF_idx(String f_idx) {
		this.f_idx = f_idx;
	}

	public String getF_link_name() {
		return f_link_name;
	}

	public void setF_link_name(String f_link_name) {
		this.f_link_name = f_link_name;
	}
	
	

}
