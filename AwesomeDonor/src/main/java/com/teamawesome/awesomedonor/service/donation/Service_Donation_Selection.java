package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Selection;

public interface Service_Donation_Selection {
	//-------------입력 service-------------.
	//찜하기에 등록
	public void registerSelection(DTO_Donation_Selection dto);
	
	//-------------출력 service------------- 
	//찜하기에 담아놓은 것 보기. 
	public ArrayList<BoardData_Donation_Selection> readSelection_List(String Member_Donor_idx);
	
	//예약 신청한 항목의 request_idx 뽑아오기	
	//controller에서는 1)updateDecided(decided 0->1) 2)getRequest_Idx 
	//3)이것과 다른 receiver_idx정보 등을 조합해서 DTO_Donation_Action을 만들어서 mapper를 통해 insert!!
	public ArrayList<String> getRequest_Idx(String[] Donation_Selection_idx); 
	
	//-------------수정 service-------------
	//예약 신청하기--decided 0->1
	public void updateDecided(DTO_Donation_Action dto);
	
	//-------------삭제 service-------------
	//찜하기 취소
	public void delete(DTO_Donation_Selection dto);
	
	
}
