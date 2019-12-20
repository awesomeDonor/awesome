package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.dto.adminspace.UploadFileVo;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Admin;
import com.teamawesome.awesomedonor.vo.session.SessionData;

public interface Service_Admin {
	
	//관리자 회원가입
	public void joinMember(DTO_Admin dto_Admin);
	//관리자 로그인
	public SessionData login(DTO_Admin dto_Admin);
	
	public void updateBanner(ArrayList<UploadFileVo> fileVoList);
	
	public String selectIdxByLinkName(String f_link_name);

	public UploadFileVo readFile(int f_idx);

}
