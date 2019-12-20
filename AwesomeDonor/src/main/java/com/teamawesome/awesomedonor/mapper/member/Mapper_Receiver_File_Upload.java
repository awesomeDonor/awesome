package com.teamawesome.awesomedonor.mapper.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_File_Upload;

public interface Mapper_Receiver_File_Upload {
	//-----------------------INSERT문-------------------------
	@Insert("INSERT INTO RECEIVER_FILE_UPLOAD VALUES(RECEIVER_FILE_UPLOAD_SEQ.NEXTVAL, #{Member_Receiver_idx}, "
			+ "#{Receiver_File_Upload_linkName} )")
	public void insert(DTO_Receiver_File_Upload dto); //회원가입.
	
	//-----------------------SELECT문-------------------------
	@Select("SELECT * FROM RECEIVER_FILE_UPLOAD WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public DTO_Receiver_File_Upload selectByReceiverIdx(String Member_Receiver_idx); 
	
	//-----------------------UPDATE문-------------------------
	@Update("UPDATE JINOH_CONTENT SET RECEIVER_FILE_UPLOAD_LINKNAME = #{Receiver_File_Upload_linkName} WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx} ")
	public void updateFile(DTO_Donor_File_Upload dto);
	
}
