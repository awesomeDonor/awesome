package com.teamawesome.awesomedonor.mapper.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;

public interface Mapper_Donor {
	//-----------------------INSERT문-------------------------
	//회원가입
	@Insert("INSERT INTO MEMBER_DONOR VALUES(#{Member_Donor_idx}, #{Member_Donor_idEmail}, "
			+ "#{Member_Donor_pw}, #{Member_Donor_name}, #{Member_Donor_nickName}, "
			+ "#{Member_Donor_birthDate}, #{Member_Donor_phoneNumber}, #{Member_Donor_address}, "
			+ "'0', SYSDATE, #{Member_Donor_advertiseAgreed}, '0')")
	public void insert(DTO_Donor dto_Donor); 
	
	//11.11추가. 
	//identificationCode 넣기. 
	@Insert("INSERT INTO MEMBER_IDENTIFICATION VALUES('0', #{Member_Donor_idx}, #{Member_identificationCode})")
	public void insertIntoIdentification(DTO_Member_Identification dto);
	
	//-----------------------SELECT문-------------------------
	//Member_Donor_idx 뽑기.
	@Select("SELECT MEMBER_DONOR_SEQ.NEXTVAL FROM DUAL")
	public String getPrimaryKey();
	
	//회원번호로 SELECT
	@Select("SELECT * FROM MEMBER_DONOR WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public DTO_Donor selectByIdx(String Member_Donor_idx);
	
	//로그인 시에 쓰이는 쿼리
	@Select("SELECT * FROM MEMBER_DONOR WHERE MEMBER_DONOR_IDEMAIL = #{Member_Donor_idEmail}")
	public DTO_Donor selectByIdEmail(String Member_Donor_idEmail); 
		
	//기부자 별점 평점 평균.
	@Select("SELECT AVG(DONOR_EVALUATION_STARNUMBER) FROM DONOR_EVALUATION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public String selectDonor_StarNumber_AVG(String Member_Donor_idx); 
	
	//기부자 평가 리스트(전체보기).
	@Select("SELECT * FROM DONOR_EVALUATION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} ORDER BY DONOR_EVALUATION_IDX DESC")
	public ArrayList<DTO_Donor_Evaluation> selectAllFromDonor_Evaluation(String Member_Donor_idx); 
	
	//identificationCode 뽑기. 
	//11.11 추가. 
	@Select("SELECT * FROM MEMBER_IDENTIFICATION WHERE MEMBER_IDENTIFICATIONCODE = #{Member_identificationCode}")
	public DTO_Member_Identification selectbyMember_identificationCode(@Param("Member_identificationCode") String Member_identificationCode); 
	
	//어썸지수 파악.
	//기부 완료된 항목 뽑기.
	@Select("SELECT * FROM DONATION_ACTION WHERE Member_Donor_idx = #{Member_Donor_idx} AND "
			+ "DONATION_ACTION_COMPLETED='완료' ")
	public ArrayList<DTO_Donation_Action> selectDonation_completed_ForAwesomeIndex(String Member_Donor_idx);
	
	//어썸지수(AwesomeIndex)를 위한 request_amount 합산하기.
	@Select("SELECT DONATION_REQUEST_AMOUNT FROM DONATION_REQUEST WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public int selectAmountByRequest_Idx_ForAwesomeIndex(String Donation_Request_idx); 
	
	//donor 리스트 뽑기
	@Select("SELECT * FROM MEMBER_DONOR ORDER BY MEMBER_DONOR_IDX ASC")
	public ArrayList<DTO_Donor> selectAll();
	
	
//	//닉네임을 유니크로 두기로 했다면 닉네임 셀렉트가 있을 경우 편리할 수 있지 않을까..
//	//닉네임 유니크에 에러가 생길 가능성...
//	@Select("SELECT * FROM MEMBER_DONOR WHERE MEMBER_DONOR_NICKNAME = #{Member_Donor_nickName}")
//	public DTO_Donor selectByNickName(String Member_Donor_nickName); 
	
	//-----------------------UPDATE문-------------------------
	
	//회원정보 수정.
	//서비스에서 회원정보 가운데 바뀌는 부분과 바뀌지 않는 부분을 확인해서 DTO_Donor에 세팅하면 mapper에서 순수 update만.
	@Update("UPDATE MEMBER_DONOR SET MEMBER_DONOR_PW = #{Member_Donor_pw}, "
			+ "MEMBER_DONOR_PHONENUMBER = #{Member_Donor_phoneNumber}, MEMBER_DONOR_ADDRESS = #{Member_Donor_address}, "
			+ "MEMBER_DONOR_ADVERTISEAGREED = #{Member_Donor_advertisedAgreed}"
			+ "WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} ")
	public void updateDonor(DTO_Donor dto);
	
	//인증여부갱신 Member_Donor_Identified 0->1
	@Update("UPDATE MEMBER_DONOR SET MEMBER_DONOR_IDENTIFIED = '1' WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public void updateDonor_identified(String Member_Donor_idx);
	
	//아이디 삭제 Member_Donor_Removed 0->1
	@Update("UPDATE MEMBER_DONOR SET MEMBER_DONOR_REMOVED = '1' WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public void updateDonor_Removed(String Member_Donor_idx);
	
	//아이디 복원 1->0
	@Update("UPDATE MEMBER_DONOR SET MEMBER_DONOR_REMOVED = 0 WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
	public void updateDonor_RemovedBack(String member_Donor_idx);
}
