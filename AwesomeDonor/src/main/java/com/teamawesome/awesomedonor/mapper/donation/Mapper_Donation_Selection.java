package com.teamawesome.awesomedonor.mapper.donation;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import java.util.*;
import org.apache.ibatis.annotations.*;

//11.2수정 selection_decided '' 다 붙임
public interface Mapper_Donation_Selection {

	//-----------------------INSERT문-------------------------
	//예약 투플 생성
	@Insert("INSERT INTO DONATION_SELECTION VALUES(DONATION_SELECTION_SEQ.NEXTVAL, #{Member_Donor_idx}, #{Donation_Request_idx},'0')")
	public void insert(DTO_Donation_Selection dto);  
	
	//-----------------------SELECT문-------------------------
	// 예약 대기중인 게시글 선택
	@Select("SELECT * FROM DONATION_SELECTION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} AND DONATION_SELECTION_DECIDED='0'"
			+ "ORDER BY DONATION_SELECTION_IDX ASC")
	public ArrayList<DTO_Donation_Selection> select_NotDecided(String Member_Donor_idx); 
	
	//예약된 게시물의 Request_idx번호를 넘겨주기 위해.
	@Select("SELECT Donation_Request_idx FROM DONATION_SELECTION WHERE DONATION_SELECTION_IDX = #{Donation_Selection_idx}")
	public String selectRequest_Idx(String Donation_Selection_idx); 
	
	//예약 완료한 게시글 선택--이건 필요한가. 
	@Select("SELECT * FROM DONATION_SELECTION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} ORDER BY DONATION_SELECTION_IDX ASC")
	public ArrayList<DTO_Donation_Selection> selectAll(String Member_Donor_idx);  
	
	//-----------------------UPDATE문-------------------------
	//예약 완료 처리
	@Update("UPDATE DONATION_SELECTION SET DONATION_SELECTION_DECIDED = '1' WHERE DONATION_REQUEST_IDX=#{Donation_Request_idx} AND MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public void updateDecided(DTO_Donation_Action dto);
	
	//-----------------------DELETE문-------------------------
	//게시물 삭제.
	@Delete("DELETE FROM DONATION_SELECTION WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx} AND MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public void delete(DTO_Donation_Selection dto);
	
}