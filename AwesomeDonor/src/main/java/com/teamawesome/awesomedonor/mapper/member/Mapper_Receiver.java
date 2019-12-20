package com.teamawesome.awesomedonor.mapper.member;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request_Search;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import java.util.*;
import org.apache.ibatis.annotations.*;

public interface Mapper_Receiver{
	//-----------------------INSERT문-------------------------
	//회원가입
	@Insert("INSERT INTO MEMBER_RECEIVER VALUES(#{Member_Receiver_idx}, #{Member_Receiver_identifyNumber},"
			+ "#{Member_Receiver_idEmail}, #{Member_Receiver_pw}, #{Member_Receiver_Category}, #{Member_Receiver_name}, "
			+ "#{Member_Receiver_phoneNumber}, #{Member_Receiver_AdCategory},#{Member_Receiver_adDetail},  "
			+ "#{Member_Receiver_websiteUrl},'0', SYSDATE, #{Member_Receiver_introduction}, '0')")
	public void insert(DTO_Receiver dto); 
	
	//identificationCode 넣기. 
	@Insert("INSERT INTO MEMBER_IDENTIFICATION VALUES(#{Member_Receiver_idx}, '0', #{Member_identificationCode})")
	public void insertIntoIdentification(DTO_Member_Identification dto);
	
	//-----------------------SELECT문-------------------------
	
	//Member_Receiver_idx 뽑기.
	@Select("SELECT MEMBER_RECEIVER_SEQ.NEXTVAL FROM DUAL")
	public String getPrimaryKey();
	
	//회원번호로 SELECT
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public DTO_Receiver selectByIdx(String Member_Receiver_idx);
	
	//로그인 시에 쓰이는 쿼리
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_IDEMAIL = #{Member_Receiver_idEmail}")
	public DTO_Receiver selectByIdEmail(String Member_Receiver_idEmail); 
	
	//등록된 기관 전체 리스트 뽑기. Admin용. 
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_IDENTIFIED = '1' OR MEMBER_RECEIVER_IDENTIFIED = '2' ORDER BY MEMBER_RECEIVER_IDX DESC")
	public ArrayList<DTO_Receiver> selectAllforAdmin();
	
	//이하 <등록된 기관> 게시판에 사용되는 mapper.
	//전체 리스트 뽑기.
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_IDENTIFIED = '2' ORDER BY MEMBER_RECEIVER_IDX DESC")
	public ArrayList<DTO_Receiver> selectAll();
	
	//필터링.
	//기관분류.  
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_CATEGORY = #{Member_Receiver_Category} "
			+ "ORDER BY MEMBER_RECEIVER_IDX ASC")
	public ArrayList<DTO_Receiver> selectByReceiver_Category_Entry(String Member_Receiver_Category); 
	
	//기관이름.
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_NAME LIKE '%${Member_Receiver_name}%' "
			+ "ORDER BY MEMBER_RECEIVER_IDX ASC")
	public ArrayList<DTO_Receiver> selectByReceiver_Name(@Param("Member_Receiver_name") String Member_Receiver_name);
	
	//상세주소.
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_ADDETAIL LIKE '%${Member_Receiver_adDetail}%' "
			+ "ORDER BY MEMBER_RECEIVER_IDX ASC")
	public ArrayList<DTO_Receiver> selectByReceiver_AddressDetail(String Member_Receiver_addressDetail);
	
	//주소 대분류.
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_ADCATEGORY = #{Member_Receiver_AdCategory} "
			+ "ORDER BY MEMBER_RECEIVER_IDX ASC")
	public ArrayList<DTO_Receiver> selectByAddressCategory_Entry(String Member_Receiver_AdCategory);
	
	//filterByAll
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE ${query} ORDER BY MEMBER_RECEIVER_IDX DESC")
	public ArrayList<DTO_Receiver> selectByAllForReceiverList(@Param("query") String query);
		
	//-----------------------UPDATE문-------------------------
	
	//회원정보 수정.
	//서비스에서 회원정보 가운데 바뀌는 부분과 바뀌지 않는 부분을 확인해서 DTO_Receiver에 세팅하면 mapper에서 순수 update만.
	@Update("UPDATE MEMBER_RECEIVER SET MEMBER_RECEIVER_PW = #{Member_Receiver_pw},"
			+ "MEMBER_RECEIVER_PHONENUMBER=#{Member_Receiver_phoneNumber}, "
			+ "MEMBER_RECEIVER_ADCATEGORY=#{Member_Receiver_AdCategory},"
			+ "MEMBER_RECEIVER_ADDETAIL=#{Member_Receiver_adDetail},"
			+ "MEMBER_RECEIVER_WEBSITEURL=#{Member_Receiver_websiteUrl},"
			+ "MEMBER_RECEIVER_INTRODUCTION=#{Member_Receiver_introduction}"
			+ "WHERE MEMBER_RECEIVER_IDX=#{Member_Receiver_idx}  ")
	public void updateReceiver(DTO_Receiver dto);
	
	//인증여부갱신 Member_Donor_Identified 0->1
	@Update("UPDATE MEMBER_RECEIVER SET MEMBER_RECEIVER_IDENTIFIED = '1' WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public void updateReceiver_identified(String Member_Receiver_idx);
	
	//인증여부갱신 Member_Donor_Identified 0->1
	@Update("UPDATE MEMBER_RECEIVER SET MEMBER_RECEIVER_IDENTIFIED = '2' WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public void updateReceiver_identifiedforAdmin(String Member_Receiver_idx);
	
	//아이디 삭제 Member_Donor_Removed 0->1
	@Update("UPDATE MEMBER_RECEIVER SET MEMBER_RECEIVER_REMOVED = '1' WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public void updateReceiver_Removed(String Member_Receiver_idx);
	
	//Request_Search 테이블 업데이트. 
	@Update("UPDATE DONATION_REQUEST_SEARCH SET MEMBER_RECEIVER_ADCATEGORY = #{Member_Receiver_AdCategory}, "
			+ "MEMBER_RECEIVER_ADDETAIL = #{Member_Receiver_adDetail} "
			+ "WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx} ")
	public void updateRequest_SearchWhenReceiverUpdated(DTO_Receiver dto);
	
	//아이디 복원 1->0
	@Update("UPDATE MEMBER_RECEIVER SET MEMBER_RECEIVER_REMOVED = '0' WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
	public void updateReceiver_RemovedBack(String Member_Receiver_idx);
	
	//11.9 승인된 기관이름
	@Select("SELECT * FROM MEMBER_RECEIVER WHERE MEMBER_RECEIVER_NAME=#{Member_Receiver_name} AND Member_Receiver_identified='2'"
			+ "ORDER BY MEMBER_RECEIVER_IDX ASC")
	public DTO_Receiver selectByidentifiedReceiver_Name(String Member_Receiver_name);
		
	}
	
	
