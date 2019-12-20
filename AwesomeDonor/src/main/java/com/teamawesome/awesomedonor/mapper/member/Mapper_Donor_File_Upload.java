package com.teamawesome.awesomedonor.mapper.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;

public interface Mapper_Donor_File_Upload {
	//-----------------------INSERT문-------------------------
	@Insert("INSERT INTO DONOR_FILE_UPLOAD VALUES(DONOR_FILE_UPLOAD_SEQ.NEXTVAL, #{Member_Donor_idx}, "
			+ "#{Donor_File_Upload_linkName} )")
	public void insert(DTO_Donor_File_Upload dto); //회원가입.
	
	//-----------------------SELECT문-------------------------
	@Select("SELECT * FROM DONOR_FILE_UPLOAD WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public DTO_Donor_File_Upload selectByDonorIdx(String Member_Donor_idx); 
	
	//-----------------------UPDATE문-------------------------
	@Update("UPDATE JINOH_CONTENT SET DONOR_FILE_UPLOAD_LINKNAME = #{Donor_File_Upload_linkName} WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} ")
	public void updateFile(DTO_Donor_File_Upload dto);
	

}
