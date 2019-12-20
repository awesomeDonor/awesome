package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Request;
import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Selection;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

@Service
public class ServiceImpl_Donation_Selection implements Service_Donation_Selection{

	@Autowired
	Mapper_Donation_Selection mapper_Donation_Selection;
	
	@Autowired
	Mapper_Receiver mapper_Receiver;
	
	@Autowired
	Mapper_Donation_Request mapper_Donation_Request;
	
	//-------------입력 service-------------.
	@Override
	public void registerSelection(DTO_Donation_Selection dto) {
		mapper_Donation_Selection.insert(dto);
	}

	//-------------출력 service------------- 
	//찜하기에 담아놓은 것 보기. 
	@Override
	public ArrayList<BoardData_Donation_Selection> readSelection_List(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Selection> boardData_Selection_List = new ArrayList<BoardData_Donation_Selection>();
		ArrayList<DTO_Donation_Selection> dto_Selection_List = mapper_Donation_Selection.select_NotDecided(Member_Donor_idx);
		for(DTO_Donation_Selection dto : dto_Selection_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request.getMember_Receiver_idx());
			BoardData_Donation_Selection boardData_Selection = new BoardData_Donation_Selection(dto_Request, dto_Receiver);
			boardData_Selection_List.add(boardData_Selection);
		}
		return boardData_Selection_List;
	}

	//예약 신청한 항목의 request_idx 뽑아오기
	//controller에서는 1)updateDecided(decided 0->1) 2)getRequest_Idx 
	//3)이것과 다른 receiver_idx정보 등을 조합해서 DTO_Donation_Action을 만들어서 mapper를 통해 insert!!
	@Override
	public ArrayList<String> getRequest_Idx(String[] Donation_Selection_idx) {
		ArrayList<String> Request_Idx_List_For_Donation_Action = new ArrayList<String>();
		for(String selection_idx : Donation_Selection_idx) {
			String request_idx = mapper_Donation_Selection.selectRequest_Idx(selection_idx);
			Request_Idx_List_For_Donation_Action.add(request_idx);
		}
		return Request_Idx_List_For_Donation_Action;
	}

	//-------------수정 service-------------
	//예약 신청하기--decided 0->1
	@Override
	public void updateDecided(DTO_Donation_Action dto) {
		mapper_Donation_Selection.updateDecided(dto);
		
	}
	
	//-------------삭제 service-------------
	//찜하기 취소
	@Override
	public void delete(DTO_Donation_Selection dto) {
		mapper_Donation_Selection.delete(dto);
	}

}
