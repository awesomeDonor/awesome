package com.teamawesome.awesomedonor.mapper.donation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;


public interface Mapper_Donation_Action {
	
	//-----------------------INSERT문-------------------------
		//예약 신청. 0은 false, 1은 true, 2는 null
		@Insert("INSERT INTO DONATION_ACTION VALUES(DONATION_ACTION_SEQ.NEXTVAL,#{Member_Donor_idx},"
				+ "#{Donation_Request_idx},#{Member_Receiver_idx},#{Donation_Action_contactNumber},"
				+ "#{Donation_Action_meetingDate}, null,'2','2')")
		public void insert(DTO_Donation_Action dto); 

		//멤버 평가 등록.
		@Insert("INSERT INTO DONOR_EVALUATION VALUES(DONOR_EVALUATION_SEQ.NEXTVAL,#{Donation_Action_idx},"
				+ "#{Member_Donor_idx},#{Donor_Evaluation_starNumber},#{Donor_Evaluation_note})")
		public void insertIntoDonor_Evaluation(DTO_Donor_Evaluation dto);
		
		//-----------------------SELECT문-------------------------
		//신청한 예약 "하나를" 선택
		@Select("SELECT * FROM DONATION_ACTION WHERE DONATION_ACTION_IDX = #{Donation_Action_idx}")
		public DTO_Donation_Action selectByIdx(String Donation_Action_idx);
		
		//----------------------
		//Receiver 마이페이지
		
		//예약신청현황  10.16 추가
		@Select("SELECT * FROM DONATION_ACTION WHERE MEMBER_RECEIVER_IDX = #{Member_Receiver_Idx} AND DONATION_ACTION_APPROVAL='2'")
		public ArrayList<DTO_Donation_Action> selectByMemberReceiverIdx(String Member_Receiver_Idx);
				
		//신청 건수를 확인하기 위한 10.16
		@Select("SELECT COUNT(*) FROM DONATION_ACTION WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx}")
		public int selectDonationCount(String Donation_Request_idx);
		
		//예약 대기 상태.
		@Select("SELECT * FROM DONATION_ACTION WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx} AND DONATION_ACTION_APPROVAL='2'"
				+ "ORDER BY DONATION_ACTION_IDX DESC")
		public ArrayList<DTO_Donation_Action> selectByApproval_yet_ForReceiver(String Donation_Request_idx);
		
		//예약 요청 승인됨  = 예약 완료 대기 상태
		@Select("SELECT * FROM DONATION_ACTION WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx} AND "
				+ "DONATION_ACTION_APPROVAL='1' AND DONATION_ACTION_COMPLETED='2' ")
		public DTO_Donation_Action selectApproval_ForReceiver(String Donation_Request_idx); //승인된 것은 하나만 있을 수 있음.
		
		//기부 완료
		@Select("SELECT * FROM DONATION_ACTION WHERE DONATION_REQUEST_IDX = #{Donation_Request_idx} AND "
				+ "(DONATION_ACTION_COMPLETED='완료' OR DONATION_ACTION_COMPLETED='중지') ")
		public DTO_Donation_Action selectDonation_completed_ForReceiver(String Donation_Request_idx); //승인된 것은 하나만 있을 수 있음.
		
//		//기부 중단 됨-필요한지 모르겠음. 
//		@Select("SELECT * FROM DONATION_ACTION WHERE Donation_Request_idx = #{Donation_Request_idx} AND "
//				+ "DONATION_ACTION_COMPLETED=0 ")
//		public ArrayList<DTO_Donation_Action> selectByIdx_donation_not_completed(String Donation_Request_idx);
//		
		//멤버 마이페이지.
		//찜하기에서 후원 예약신청만 된 상황(Donation_standBy) 
		@Select("SELECT *FROM DONATION_ACTION WHERE MEMBER_DONOR_IDX=#{Member_Donor_idx} AND DONATION_ACTION_APPROVAL='2'"
				+ "ORDER BY DONATION_ACTION_IDX DESC")
		public ArrayList<DTO_Donation_Action> selectApproval_yet_ForDonor(String Member_Donor_idx);
		
		//예약 요청 승인됨  = 예약 완료 대기 상태
		@Select("SELECT * FROM DONATION_ACTION WHERE Member_Donor_idx = #{Member_Donor_idx} AND "
				+ "DONATION_ACTION_APPROVAL='1' AND DONATION_ACTION_COMPLETED='2' ")
		public ArrayList<DTO_Donation_Action> selectApproval_ForDonor(String Member_Donor_idx);

		//기부 완료, 이 쿼리는 어썸지수 파악에도 쓸 수가 있음. 
		@Select("SELECT * FROM DONATION_ACTION WHERE Member_Donor_idx = #{Member_Donor_idx} AND "
				+ "(DONATION_ACTION_COMPLETED='완료' OR DONATION_ACTION_COMPLETED='중지') ")
		public ArrayList<DTO_Donation_Action> selectDonation_completed_ForDonor(String Member_Donor_idx);
		
		//멤버 마이페이지 <예약 진행중>에서 필터
		//기관 이름 정렬//Donor 마이페이지 진행 중인 예약 확인. 
		@Select("SELECT * FROM DONATION_ACTION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} and DONATION_ACTION_APPROVAL=1 AND DONATION_ACTION_COMPLETED='2' "
				+ "ORDER BY MEMBER_RECEIVER_IDX")
		public ArrayList<DTO_Donation_Action> sortDonation_ProcessByName(String Member_Donor_idx);  
		
		//후원 날짜순 정렬//Donor 마이페이지 진행 중인 예약 확인.
		@Select("SELECT * FROM DONATION_ACTION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx} and DONATION_ACTION_APPROVAL=1 AND DONATION_ACTION_COMPLETED='2' "
				+ "ORDER BY DONATION_ACTION_MEETINGDATE")
		public ArrayList<DTO_Donation_Action> sortDonation_ProcessByDate(String Member_Donor_idx); 
		
		//10.21 추가
		//어떤 기부자의 총 기부 횟수
		@Select("SELECT COUNT(*) FROM DONOR_EVALUATION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
		public int evaluationCount(String Member_Donor_idx);
		//-------------------------
		//자세히 보기에서 Donor정보 확인
		@Select("SELECT * FROM DONATION_ACTION WHERE MEMBER_DONOR_IDX =#{Member_Donor_idx} AND DONATION_REQUEST_IDX=#{Donation_Request_idx}")
		public DTO_Donation_Action selectByDonorIdx(DTO_Donation_Action dtoAction);
				
		//모든 Member_Donor_idx에 대한 평가정보
		@Select("SELECT * FROM DONOR_EVALUATION WHERE MEMBER_DONOR_IDX = #{Member_Donor_idx}")
		public ArrayList<DTO_Donor_Evaluation> selectAllEvaluationByDonorIdx(String Member_Donor_idx); 

		//-----------------------UPDATE문-------------------------
		//예약 요청을 기관이 수락 
		@Update("UPDATE DONATION_ACTION SET DONATION_ACTION_APPROVAL='1' "
				+ "WHERE DONATION_ACTION_IDX=#{Donation_Action_idx}")
		public void updateApproval(String Donation_Action_idx);
		
		//선택받지 못한 나머지 예약 요청을 기관이 거절. 
		@Update("UPDATE DONATION_ACTION SET DONATION_ACTION_APPROVAL='0' "
				+ "WHERE DONATION_Request_IDX=#{Donation_Request_idx}")
		public void updateDisapproval(String Donation_Request_idx);
			
		//기부 완료를 기관이 확인  
		//대체 뭐가 문제인지 모르겠음...
		@Update("UPDATE DONATION_ACTION SET DONATION_ACTION_COMPLETED='완료', DONATION_ACTION_COMPLETEDATE=SYSDATE "
				+ "WHERE DONATION_ACTION_IDX=#{Donation_Action_idx}")
		public void updateCompleted(String Donation_Action_idx);
		
		//기부되지 않았음을 기관이 표시. 
		@Update("UPDATE DONATION_ACTION SET DONATION_ACTION_COMPLETED='중지', DONATION_ACTION_COMPLETEDATE=SYSDATE "
				+ "WHERE DONATION_ACTION_IDX=#{Donation_Action_idx}")
		public void updateNotCompleted(String Donation_Action_idx);
}
