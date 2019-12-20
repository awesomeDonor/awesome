package com.teamawesome.awesomedonor.mapper.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Admin;

public interface Mapper_Admin {

	//관리자 회원가입
	@Insert("INSERT INTO MEMBER_ADMIN VALUES(MEMBER_ADMIN_SEQ.NEXTVAL,#{Member_Admin_id},#{Member_Admin_pw})")
	public void insert(DTO_Admin dto_Admin);
	
	//관리자 로그인
	@Select("SELECT * FROM MEMBER_ADMIN WHERE Member_Admin_id = #{Member_Admin_id}")
	public DTO_Admin selectByAdminId(String Member_Admin_id);
}
