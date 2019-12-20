package com.teamawesome.awesomedonor.mapper.qna;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;



public interface Mapper_QnA {

	@Select("SELECT * FROM QNA ORDER BY QNA_IDX DESC")
	public ArrayList<DTO_QnA> selectAll();
	
	@Select("SELECT * FROM QNA WHERE QNA_IDX=#{QnA_idx}")	
	public DTO_QnA selectByIdx(DTO_QnA dto);
	
	@Select("SELECT * FROM QNA WHERE MEMBER_DONOR_IDX=#{Member_Donor_idx}")	
	public ArrayList<DTO_QnA> selectByMyIdx(String Member_Donor_idx);
	
	@Insert("INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,#{Member_Donor_idx},#{QnA_title},#{QnA_content},0,SYSDATE)")                           
	public void insert(DTO_QnA dto);
	
	@Delete("DELETE FROM QNA WHERE QNA_IDX=#{QnA_idx}")
	public void deleteByIdx(DTO_QnA dto);
	
	@Update("UPDATE QNA SET QNA_TITLE=#{QnA_title} , QNA_CONTENT=#{QnA_content} WHERE QNA_IDX=#{QnA_idx}")                      
	public void update(DTO_QnA dto);
	
	@Update("UPDATE QNA SET QNA_COUNT=QNA_COUNT+1 WHERE QNA_IDX=#{QnA_idx}")          
 	public void updateCount(DTO_QnA dto);
}
