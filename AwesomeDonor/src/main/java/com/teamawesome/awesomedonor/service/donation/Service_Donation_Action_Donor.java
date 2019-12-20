package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Donor;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Receiver_Like;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;

public interface Service_Donation_Action_Donor {
	//Update에 해당하는 mapper는 전부 Receiver가 하는 것. Donor는 사실상 select문만. 
	//그러므로 Insert를 여기에 넣겠음. 
	
	//-------------입력 service-------------
	public void registerAction(DTO_Donation_Action dto); 
	
	//-------------출력 service-------------
	//10.22추가
	//관심기관 보드데이터 뽑아오기
	public ArrayList<BoardData_Receiver_Like> selectReceiverLike(String Member_Donor_idx);
	
	//찜하기에서 후원 예약신청만 된 상황(Donation_standBy) 
	public ArrayList<BoardData_Donation_Action_Donor> selectApproval_yet(String Member_Donor_idx);
	
	//예약 요청 승인됨  = 예약 완료 대기 상태(Donation_process1)
	public ArrayList<BoardData_Donation_Action_Donor> selectApproval(String Member_Donor_idx);
	
	//Donation_Process2 기관 이름 정렬.
	public ArrayList<BoardData_Donation_Action_Donor> sortDonation_ProcessByName(String Member_Donor_idx);  
	
	//Donation_Process3 후원 날짜순 정렬.
	public ArrayList<BoardData_Donation_Action_Donor> sortDonation_ProcessByDate(String Member_Donor_idx); 
	
	//기부 완료(Donation_Complete)
	public ArrayList<BoardData_Donation_Action_Donor> selectDonation_completed(String Member_Donor_idx);
	
	
}
