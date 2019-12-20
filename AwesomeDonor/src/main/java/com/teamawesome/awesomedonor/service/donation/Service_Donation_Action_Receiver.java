package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Information_Donor;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;

public interface Service_Donation_Action_Receiver {
	//처음 신청현황
	public ArrayList<BoardData_Donation_Action_Receiver> readBoardDataRequestInfo(String sessionIdx);
	
	//신청현황에서 건수 누르면 가는 페이지 
	public ArrayList<BoardData_Donation_Action_Receiver> readDonorList(String Donation_Request_idx );
	//자세히보기 
	public BoardData_Information_Donor readDetailDonorInfo(String Donation_Action_idx);
//	//신청현황에서 건수 누르면 가는 페이지 평가 이외 정보
//	public ArrayList<DTO_Donation_Action> readDonorList(String Donation_Request_idx );
//	
//	//신청현황에서 건수 누르면 가는 페이지 에서 평가정보
//	public ArrayList<DTO_Donor_Evaluation> evaluationCount(String Donation_Request_idx);
//	
//	//자세히보기 평가항목 제외 사항
//	public DTO_Donation_Action readDetailDonorInfo(DTO_Donation_Action dtoAction);
//	
//	//자세히보기 평가항목 
//	public ArrayList<DTO_Donor_Evaluation> evaluationList(String Member_Donor_idx);
	
	//수락신청 자세히 보기
	public void donationAceept(String Donation_Action_idx);
	
	//후원진행 현황
	public ArrayList<BoardData_Donation_Action_Receiver> readDonationInProgress(String sessionIdx);
	
	//후원완료
	public void donationComplete(String Donation_Action_idx);
	
	//후원중지
	public void donationStop(String Donation_Action_idx);
	
	//평가 작성에 넘겨줄 정보 구하기 위한 메소드
	public String getMemberDonorIdx(String Donation_Action_idx);
	
	//평가 db에 추가하기
	public void writeEvaluation(DTO_Donor_Evaluation dtoEvaluation);
	
	//후원 완료 내역
	public ArrayList<BoardData_Donation_Action_Receiver> readBoardDataCompleteInfo(String sessionIdx);
	
}
