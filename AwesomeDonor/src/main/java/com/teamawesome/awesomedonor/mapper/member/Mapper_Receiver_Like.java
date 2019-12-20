package com.teamawesome.awesomedonor.mapper.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_Like;


public interface Mapper_Receiver_Like {

	//-----------------------INSERT문-------------------------
	//관심기관 등록
	@Insert("INSERT INTO RECEIVER_LIKE VALUES(RECEIVER_LIKE_SEQ.NEXTVAL, #{Member_Receiver_idx}, #{Member_Donor_idx})")
	public void insert(DTO_Receiver_Like dto);
	
	
	//-----------------------SELECT문-------------------------
	//멤버가 관심표시한 기관 idx 가져오기. 
	@Select("SELECT MEMBER_RECEIVER_IDX FROM RECEIVER_LIKE WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} "
			+ "ORDER BY RECEIVER_LIKE_IDX ASC")
	public ArrayList<String> selectLikedReceiver_Idx(String sessionIdx);
	
	//관심기관이 신청한 요청. sql 작성해보기. //group by를 써야할 것 같다.
	//사실상 DTO_Member_Receiver_like는 필요가 없음. 
	@Select("SELECT COUNT(*) FROM DONATION_REQUEST WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx} AND DONATION_REQUEST_PROGRESS='후원가능'")
	public int selectCountFromDonation_RequestByReceiver_Idx(String Member_Receiver_idx);
	
	//-----------------------DELETE문-------------------------
	@Delete("DELETE FROM RECEIVER_LIKE WHERE MEMBER_DONOR_IDX = #{sessionIdx} AND MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public void delete(@Param("sessionIdx") String sessionIdx, @Param("Member_Receiver_idx") String Member_Receiver_idx);
	
	
}
