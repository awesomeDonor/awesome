package com.teamawesome.awesomedonor.mapper.adminspace;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.adminspace.UploadFileVo;

public interface UploadFileSQLMapper {

	
	
	@Select("SELECT F_IDX FROM ADMIN_FILE WHERE F_LINK_NAME = #{f_link_name}")
	public String selectByLinkName(String f_link_name);
	
	@Update("UPDATE ADMIN_FILE SET F_LINK_NAME=#{f_link_name} WHERE F_IDX=#{f_idx}")
	public void updateBanner(UploadFileVo vo);

	@Select("SELECT F_LINK_NAME FROM ADMIN_FILE WHERE F_IDX=#{f_idx}")
	public UploadFileVo selectLinkNameFromIdx(int f_idx);


	@Select("SELECT F_LINK_NAME FROM ADMIN_FILE WHERE F_IDX=#{f_idx}")
	public String test(int f_idx);

}
