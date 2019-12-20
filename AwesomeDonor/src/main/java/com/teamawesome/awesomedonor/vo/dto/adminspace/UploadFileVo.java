package com.teamawesome.awesomedonor.vo.dto.adminspace;

public class UploadFileVo {

	private String f_idx;
	private String f_link_name;
	
	
	public UploadFileVo() {
		super();
	}

	public UploadFileVo(String f_idx, String f_link_name) {
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
