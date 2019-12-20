package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Action;
import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Request;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver_Like;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Donor;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Receiver_Like;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

@Service
public class ServiceImpl_Donation_Action_Donor implements Service_Donation_Action_Donor{

	@Autowired
	Mapper_Donation_Action mapper_Donation_Action;
	
	@Autowired
	Mapper_Donation_Request mapper_Donation_Request;
	
	@Autowired
	Mapper_Receiver mapper_Receiver;
	
	@Autowired
	Mapper_Receiver_Like mapper_Receiver_Like;
	//-------------입력 service-------------.
	//찜하기에 등록
	@Override
	public void registerAction(DTO_Donation_Action dto) {
		mapper_Donation_Action.insert(dto);
		
	}

	//-------------출력 service-------------
	//10.22 추가 
	//관심기관 보드데이터 BoardData_Receiver_Like 뽑아오기
	@Override
	public ArrayList<BoardData_Receiver_Like> selectReceiverLike(String Member_Donor_idx) {
		ArrayList<BoardData_Receiver_Like> boardLikeList = new ArrayList<BoardData_Receiver_Like>();
		ArrayList<String> likeList = mapper_Receiver_Like.selectLikedReceiver_Idx(Member_Donor_idx);
		for(String like:likeList) {
			DTO_Receiver dto_receiver = mapper_Receiver.selectByIdx(like);
			int countRequest = mapper_Receiver_Like.selectCountFromDonation_RequestByReceiver_Idx(like);
			BoardData_Receiver_Like boardLike = new BoardData_Receiver_Like(dto_receiver, countRequest);
			boardLikeList.add(boardLike);
		}
		return boardLikeList;
	}
	
	//찜하기에서 후원 예약신청만 된 상황(Donation_standBy) 
	@Override
	public ArrayList<BoardData_Donation_Action_Donor> selectApproval_yet(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Action_Donor> boardData_Action_Donor_List = new ArrayList<BoardData_Donation_Action_Donor>();
		ArrayList<DTO_Donation_Action> dto_Action_List = mapper_Donation_Action.selectApproval_yet_ForDonor(Member_Donor_idx);
		for(DTO_Donation_Action dto : dto_Action_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Action_Donor boardData_Action_Donor = new BoardData_Donation_Action_Donor(dto, dto_Request, dto_Receiver);
			boardData_Action_Donor_List.add(boardData_Action_Donor);
		}
		return boardData_Action_Donor_List;
	}

	//예약 요청 승인됨  = 예약 완료 대기 상태(Donation_process1)
	@Override
	public ArrayList<BoardData_Donation_Action_Donor> selectApproval(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Action_Donor> boardData_Action_Donor_List = new ArrayList<BoardData_Donation_Action_Donor>();
		ArrayList<DTO_Donation_Action> dto_Action_List = mapper_Donation_Action.selectApproval_ForDonor(Member_Donor_idx);
		for(DTO_Donation_Action dto : dto_Action_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Action_Donor boardData_Action_Donor = new BoardData_Donation_Action_Donor(dto, dto_Request, dto_Receiver);
			boardData_Action_Donor_List.add(boardData_Action_Donor);
		}
		return boardData_Action_Donor_List;
	}

	//Donation_Process2 기관 이름 정렬.
	@Override
	public ArrayList<BoardData_Donation_Action_Donor> sortDonation_ProcessByName(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Action_Donor> boardData_Action_Donor_List = new ArrayList<BoardData_Donation_Action_Donor>();
		ArrayList<DTO_Donation_Action> dto_Action_List = mapper_Donation_Action.sortDonation_ProcessByName(Member_Donor_idx);
		for(DTO_Donation_Action dto : dto_Action_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Action_Donor boardData_Action_Donor = new BoardData_Donation_Action_Donor(dto, dto_Request, dto_Receiver);
			boardData_Action_Donor_List.add(boardData_Action_Donor);
		}
		return boardData_Action_Donor_List;
	}

	//Donation_Process3 후원 날짜순 정렬.
	@Override
	public ArrayList<BoardData_Donation_Action_Donor> sortDonation_ProcessByDate(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Action_Donor> boardData_Action_Donor_List = new ArrayList<BoardData_Donation_Action_Donor>();
		ArrayList<DTO_Donation_Action> dto_Action_List = mapper_Donation_Action.sortDonation_ProcessByDate(Member_Donor_idx);
		for(DTO_Donation_Action dto : dto_Action_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Action_Donor boardData_Action_Donor = new BoardData_Donation_Action_Donor(dto, dto_Request, dto_Receiver);
			boardData_Action_Donor_List.add(boardData_Action_Donor);
		}
		return boardData_Action_Donor_List;
	}

	//기부 완료(Donation_Complete)
	@Override
	public ArrayList<BoardData_Donation_Action_Donor> selectDonation_completed(String Member_Donor_idx) {
		ArrayList<BoardData_Donation_Action_Donor> boardData_Action_Donor_List = new ArrayList<BoardData_Donation_Action_Donor>();
		ArrayList<DTO_Donation_Action> dto_Action_List = mapper_Donation_Action.selectDonation_completed_ForDonor(Member_Donor_idx);
		for(DTO_Donation_Action dto : dto_Action_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Action_Donor boardData_Action_Donor = new BoardData_Donation_Action_Donor(dto, dto_Request, dto_Receiver);
			boardData_Action_Donor_List.add(boardData_Action_Donor);
		}
		return boardData_Action_Donor_List;
	}

}
