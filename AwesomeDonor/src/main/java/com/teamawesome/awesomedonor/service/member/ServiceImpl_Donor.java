package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Request;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Donor;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Donor_File_Upload;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver_Like;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Receiver_Like;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.session.SessionData;
import com.teamawesome.awesomedonor.vo.session.Session_Donor;

@Service
public class ServiceImpl_Donor implements Service_Donor{

	@Autowired
	Mapper_Donor mapper_Donor;
	
	@Autowired
	Mapper_Donor_File_Upload mapper_File_Upload;
	
	@Autowired
	Mapper_Receiver_Like mapper_Receiver_Like;
	
	@Autowired
	Mapper_Receiver mapper_Receiver;
	
	@Autowired
	Mapper_Donation_Request mapper_Donation_Request;
	
	//-------------입력 service-------------
	//회원가입.
	@Override
	public void register(DTO_Donor dto_Donor, DTO_Donor_File_Upload dto_File_Upload, String Member_code) {
		String member_Donor_idx = mapper_Donor.getPrimaryKey();
		dto_Donor.setMember_Donor_idx(member_Donor_idx);
		//dto_File_Upload.setMember_Donor_idx(member_Donor_idx); //dto가 null인 경우를 위해 if문 달아놓기. 
		
		mapper_Donor.insert(dto_Donor);	
		
		//identificationCode 삽입. 
		DTO_Member_Identification dto = new DTO_Member_Identification();
		dto.setMember_Donor_idx(member_Donor_idx);
		dto.setMember_identificationCode(Member_code);
		mapper_Donor.insertIntoIdentification(dto);
		//mapper_File_Upload.insert(dto_File_Upload);
	}

	//관심기관 등록. 
	//이건 어차피 ajax에서 처리하므로 크게 중요하지 않은듯. 
	@Override
	public void registerReceiverLike(String sessionIdx, String Member_Receiver_idx) {
		ArrayList<String> ReceiverIdxList = mapper_Receiver_Like.selectLikedReceiver_Idx(sessionIdx);
		boolean token = true;
		
		for(String receiver_idx : ReceiverIdxList) { //중복방지로직. 
			if(receiver_idx.equals(Member_Receiver_idx)) {
				token = false;
				break;
			}
		}
		
		if(token) {
			//mapper_Receiver_Like.insert(sessionIdx, Member_Receiver_idx);
		}
		
	}
	
	//-------------출력 service-------------
	//로그인.	
	@Override
	public SessionData login(DTO_Donor dto) {
		SessionData sessionData = new SessionData();
		Session_Donor session_Donor;
		DTO_Donor dto_Donor = mapper_Donor.selectByIdEmail(dto.getMember_Donor_idEmail());
		if(dto_Donor!=null&&dto_Donor.getMember_Donor_removed()!="1"&&
				dto.getMember_Donor_pw().equals(dto_Donor.getMember_Donor_pw())) {
			session_Donor = new Session_Donor(dto_Donor.getMember_Donor_idx(), dto_Donor.getMember_Donor_nickName());
			sessionData.setSession_Donor(session_Donor);
			sessionData.setMember_identified(dto_Donor.getMember_Donor_identified());
			return sessionData;
		}else return null;
	}

	//기부자 별점 평균.
	@Override
	public String readDonor_StarNumber_AVG(String Member_Donor_idx) {
		String donor_StarNumber_AVG = mapper_Donor.selectDonor_StarNumber_AVG(Member_Donor_idx);
		return donor_StarNumber_AVG;
	}

	//기부자 평가 리스트(전체보기).
	@Override
	public ArrayList<DTO_Donor_Evaluation> readDonor_EvaluationList(String Member_Donor_idx) {
		ArrayList<DTO_Donor_Evaluation> donor_EvaluationList = mapper_Donor.selectAllFromDonor_Evaluation(Member_Donor_idx);  
		return donor_EvaluationList;
	}

	//개인정보 읽기.
	//Information_Donor를 조합하는 것은 Action에서 진행할 것.
	@Override
	public DTO_Donor readPrivateData(String Member_Donor_idx) {
		DTO_Donor dto_Donor = mapper_Donor.selectByIdx(Member_Donor_idx);
		return dto_Donor;
	}

	//관심기관 리스트 뽑기. 등록된 신청 건수와 함께. 
	@Override
	public ArrayList<BoardData_Receiver_Like> readReceiver_Like_List(String sessionIdx) {
		ArrayList<BoardData_Receiver_Like> receiver_Like_List = new ArrayList<BoardData_Receiver_Like>();
		ArrayList<String> ReceiverIdxList = mapper_Receiver_Like.selectLikedReceiver_Idx(sessionIdx);
		
		for(String receiver_idx : ReceiverIdxList) {
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(receiver_idx);
			int countRequest = mapper_Receiver_Like.selectCountFromDonation_RequestByReceiver_Idx(receiver_idx);
			BoardData_Receiver_Like receiver_Like = new BoardData_Receiver_Like(dto_Receiver, countRequest);
			receiver_Like_List.add(receiver_Like);	
		}
		return receiver_Like_List;
	}
	
	//11.8추가 필요해요 검색창으로 가기 위한
	@Override
	public ArrayList<BoardData_Donation_Request> goRequest(String member_Receiver_name){
		ArrayList<BoardData_Donation_Request> boardData = new ArrayList<BoardData_Donation_Request>();
		DTO_Receiver dto_Receiver = mapper_Receiver.selectByidentifiedReceiver_Name(member_Receiver_name);
		ArrayList<DTO_Donation_Request> dtoRequest = mapper_Donation_Request.selectByReceiverIdx(dto_Receiver.getMember_Receiver_idx());
		for(DTO_Donation_Request dto_Donation_Request:dtoRequest) {
			BoardData_Donation_Request board = new BoardData_Donation_Request(dto_Donation_Request, dto_Receiver);
			boardData.add(board);
		}
		return boardData;
	}
	
	//파일 읽기
	public DTO_Donor_File_Upload readFile(String Member_Donor_idx) {
		DTO_Donor_File_Upload file = mapper_File_Upload.selectByDonorIdx(Member_Donor_idx);
		return file;
	}
	
	//identificationCode를 이용해 그에 맞는 Member_idx를 뽑아내는 코드. 
	public DTO_Member_Identification readIdentificationCode(String Member_identificationCode) {
		DTO_Member_Identification dto = mapper_Donor.selectbyMember_identificationCode(Member_identificationCode);
		return dto;
	}
	
	//-----등록된 전체 후원자 뽑기----------
	public ArrayList<DTO_Donor> readDonorList() {
		ArrayList<DTO_Donor> donorList = mapper_Donor.selectAll();
		return donorList;
	}
	//-------------수정 service-------------
	//개인정보 수정.
	@Override
	public DTO_Donor updatePrivateData(DTO_Donor dto) {
		mapper_Donor.updateDonor(dto);
		DTO_Donor dto_Donor = mapper_Donor.selectByIdx(dto.getMember_Donor_idx());
		return dto_Donor;
	}

	//인증여부갱신.
	@Override
	public void updateDonor_identified(String Member_Donor_idx) {
		mapper_Donor.updateDonor_identified(Member_Donor_idx);
	}

	//아이디 삭제.
	@Override
	public void updateDonor_Removed(String Member_Donor_idx) {
		mapper_Donor.updateDonor_Removed(Member_Donor_idx);
		
	}
	
	//아이디 복원	@Override
	public void updateDonor_RemovedBack(String Member_Donor_idx) {
		// TODO Auto-generated method stub
		
		mapper_Donor.updateDonor_RemovedBack(Member_Donor_idx);
		
	}

	//업로드 파일 수정.
	@Override
	public void updateDonorFile(DTO_Donor_File_Upload dto) {
		mapper_File_Upload.updateFile(dto);
		
	}

	//-------------삭제 service-------------
	//관심기관 삭제
	@Override
	public void deleteReceiverLike(String sessionIdx, String Member_Receiver_idx) {
		mapper_Receiver_Like.delete(sessionIdx, Member_Receiver_idx);
		
	}



}
