package com.teamawesome.awesomedonor.mapper.donation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request_Search;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

public interface Mapper_Donation_Request {
	//-----------------------INSERT문-------------------------
	@Insert("INSERT INTO DONATION_REQUEST VALUES(#{Donation_Request_idx}, #{Member_Receiver_idx}, "
			+ "#{Stuff_MajorCategory_entry}, #{Stuff_MinorCategory_entry}, #{Donation_Request_amount}, SYSDATE, "
			+ "#{Donation_Request_note}, #{Member_Receiver_parkingSpace}, '후원가능')")
	public void insert(DTO_Donation_Request dto); //아 미친 괄호!!
	
	//이 코드 문제가 많을 수 있음!! 주의할 것!!! 매개변수 부분!!
	@Insert("INSERT INTO DONATION_REQUEST_SEARCH VALUES(DONATION_REQUEST_SEARCH_SEQ.NEXTVAL, #{dto_Receiver.Member_Receiver_idx}, "
			+ "#{dto_Receiver.Member_Receiver_Category}, #{dto_Receiver.Member_Receiver_name}, "
			+ "#{dto_Receiver.Member_Receiver_AdCategory}, #{dto_Receiver.Member_Receiver_adDetail}, #{Donation_Request_idx}, '후원가능')")
	public void insertIntoDonation_Search(
			@Param("dto_Receiver") DTO_Receiver dto_Receiver, @Param("Donation_Request_idx") String Donation_Request_idx);
	//게터 세터의 문제가 여기서는 안 생기나???
	
	//-----------------------SELECT문-------------------------
	
	//Donation_Request_idx 뽑기
	@Select("SELECT Donation_Request_SEQ.NEXTVAL FROM DUAL")
	public String getPrimaryKey();
	
	//Donation_Request_idx로 select
	@Select("SELECT * FROM DONATION_REQUEST WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public DTO_Donation_Request selectByIdx(String Donation_Request_idx); 
	
	//기관 마이페이지를 위한 receiver_idx 로  뽑는
	//10.16추가. 
	@Select("SELECT * FROM DONATION_REQUEST WHERE MEMBER_RECEIVER_IDX =#{Member_Receiver_idx}")
	public ArrayList<DTO_Donation_Request> selectByReceiverIdx(String Member_Receiver_idx);
	
	//Donation_Request를 필터링 없이 전부 뽑는. 
	@Select("SELECT * FROM DONATION_REQUEST ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request> selectAll(); 
	
	//필터링!!!
	//대분류.
	@Select("SELECT * FROM DONATION_REQUEST WHERE STUFF_MAJORCATEGORY_ENTRY LIKE '%${Stuff_MajorCategory_entry}%' ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request> selectByMajorCategory_Entry(@Param("Stuff_MajorCategory_entry") String Stuff_MajorCategory_entry); 
	
	//소분류.
	@Select("SELECT * FROM DONATION_REQUEST WHERE STUFF_MINORCATEGORY_ENTRY LIKE '%${Stuff_MinorCategory_entry}%' ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request> selectByMinorCategory_Entry(@Param("Stuff_MinorCategory_entry") String Stuff_MinorCategory_entry); 
	
	//후원진행상태. 후원신청가능-0, 진행중-1, 후원완료-2
	@Select("SELECT * FROM DONATION_REQUEST WHERE DONATION_REQUEST_PROGRESS = #{Donation_Request_progress} ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request> selectByProgress(String Donation_Request_progress); 
	
	//기관분류. 이하 Donation_Request_Search에서 질의. 
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE MEMBER_RECEIVER_CATEGORY = #{Member_Receiver_Category} "
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByReceiver_Category_Entry(String Member_Receiver_Category); 
	
	//기관이름.
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE MEMBER_RECEIVER_NAME LIKE '%${Member_Receiver_name}%' "
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByReceiver_Name(@Param("Member_Receiver_name") String Member_Receiver_name);
	
	//관심기관.
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE MEMBER_RECEIVER_NAME = #{Member_Receiver_name} AND DONATION_REQUEST_PROGRESS = '후원가능'"
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByReceiverLike(@Param("Member_Receiver_name") String Member_Receiver_name);
	
	//상세주소.
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE MEMBER_RECEIVER_ADDETAIL LIKE '%${Member_Receiver_adDetail}%' "
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByReceiver_AddressDetail(@Param("Member_Receiver_adDetail") String Member_Receiver_adDetail);
	
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE (MEMBER_RECEIVER_ADDETAIL LIKE '%${adDetailorName}%' OR MEMBER_RECEIVER_NAME LIKE '%${adDetailorName}%') "
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByBoth(@Param("adDetailorName") String adDetailorName);

	
	//주소 대분류.
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE MEMBER_RECEIVER_ADCATEGORY = #{Member_Receiver_AdCategory} "
			+ "ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByAddressCategory_Entry(String Member_Receiver_AdCategory);
	
	//filterByAll
	@Select("SELECT * FROM DONATION_REQUEST_SEARCH WHERE ${query} ORDER BY DONATION_REQUEST_IDX DESC")
	public ArrayList<DTO_Donation_Request_Search> selectFromRequestSearchByAll(@Param("query") String query);
	
//	//주소 대분류와 기관분류. Receiver 테이블에서 주소에 맞는 Receiver_idx를 뽑은 다음 그 Receiver_idx로 select하여 리스트 뽑기.
//	//검색에서 상세주소 및 기관이름도 마찬가지... 여기서 좀 꼬인다...
//	@Select("SELECT * FROM DONATION_REQUEST WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_idx}")
//	public ArrayList<DTO_Donation_Request> selectByReceiver_Idx(String Member_Receiver_idx); 
	
	//글을 쓸 때 소분류를 선택하면 대분류가 알아서 설정되도록.
	//소분류를 통해 대분류 idx 뽑아오기.
	@Select("SELECT STUFF_MAJORCATEGORY_IDX FROM STUFF_MINORCATEGORY WHERE STUFF_MINORCATEGORY_ENTRY = #{Stuff_MinorCategory_entry}")
	public int selectMajorCategory_IdxByMinorCategory_Entry(String Stuff_MinorCategory_entry); 
	
	//대분류 idx로 대분류 entry 뽑아오기. so 소분류 entry만 받아도 바로 입력할 수 있도록.
	@Select("SELECT STUFF_MAJORCATEGORY_ENTRY FROM STUFF_MAJORCATEGORY WHERE STUFF_MAJORCATEGORY_IDX = #{Stuff_MajorCategory_idx}")
	public String selectMajorCategory_EntryByMajorCategory_Idx(int Stuff_MajorCategory_idx); 
	
	//어썸지수(AwesomeIndex)를 위한 request_amount 합산하기.--이미 Donor_Mapper에 옮겨놓았음. 
	@Select("SELECT DONATION_REQUEST_AMOUNT FROM DONATION_REQUEST WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public int selectAmountByIdx(String Donation_Request_idx); 
	
//	@Select("SELECT * FROM DONATION_REQUEST WHERE DONATION_REQUEST_PROGRESS = #{Donation_Request_progress}")
//	public ArrayList<DTO_Donation_Request> selectMajorCategory_IdxFromMinorCategoryByMinorCategory_Idx(String Donation_Request_progress); 
	
	//-----------------------UPDATE문-------------------------
	//게시물 수정.
	@Update("UPDATE DONATION_REQUEST SET DONATION_REQUEST_AMOUNT = #{Donation_Request_amount}, Stuff_MajorCategory_entry = #{Stuff_MajorCategory_entry}, Stuff_MinorCategory_entry = #{Stuff_MinorCategory_entry}, "
			+ "DONATION_REQUEST_NOTE = #{Donation_Request_note}, MEMBER_RECEIVER_PARKINGSPACE = #{Member_Receiver_parkingSpace} "
			+ "WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void update(DTO_Donation_Request dto);
	
	//예약 가능->진행 중.
	@Update("UPDATE DONATION_REQUEST SET DONATION_REQUEST_PROGRESS = '후원진행중' WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void updateProgressFrom0To1(String Donation_Request_idx);
	
	//진행중-> 기부 완료.
	@Update("UPDATE DONATION_REQUEST SET DONATION_REQUEST_PROGRESS = '후원완료' WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void updateProgressFrom1To2(String Donation_Request_idx);
	
	@Update("UPDATE DONATION_REQUEST_SEARCH SET DONATION_REQUEST_PROGRESS = '후원진행중' WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void updateProgressinRequestSearchFrom0To1(String Donation_Request_idx);
	
	//진행중-> 기부 완료.
	@Update("UPDATE DONATION_REQUEST_SEARCH SET DONATION_REQUEST_PROGRESS = '후원완료' WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void updateProgressinRequestSearchFrom1To2(String Donation_Request_idx);
	
	//-----------------------DELETE문-------------------------
	@Delete("DELETE FROM DONATION_REQUEST WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void delete(String Donation_Request_idx);
	
	@Delete("DELETE FROM DONATION_REQUEST_SEARCH WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
	public void deleteFromSearch(String Donation_Request_idx);

}
