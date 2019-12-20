package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver_File_Upload;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_File_Upload;
import com.teamawesome.awesomedonor.vo.session.SessionData;
import com.teamawesome.awesomedonor.vo.session.Session_Receiver;

@Service
public class ServiceImpl_Receiver implements Service_Receiver{

	@Autowired
	Mapper_Receiver mapper_receiver;
	
	@Autowired
	Mapper_Receiver_File_Upload mapper_File_Upload;
	
	//회원가입
	public void register(DTO_Receiver dto_Receiver, DTO_Receiver_File_Upload dto_File_Upload, String Member_identificationCode) {
		String member_Receiver_idx = mapper_receiver.getPrimaryKey();
		dto_Receiver.setMember_Receiver_idx(member_Receiver_idx);
		mapper_receiver.insert(dto_Receiver);
//		if(dto_File_Upload!=null) {
//			dto_File_Upload.setMember_Receiver_idx(member_Receiver_idx);
//			mapper_File_Upload.insert(dto_File_Upload);
//		}
		
		//identificationCode 삽입. 
		DTO_Member_Identification dto = new DTO_Member_Identification();
		dto.setMember_Receiver_idx(member_Receiver_idx);
		dto.setMember_identificationCode(Member_identificationCode);
		mapper_receiver.insertIntoIdentification(dto);
	}

	//로그인
	public SessionData login(DTO_Receiver dto) {
		//id로 db의 DTO_RECEIVER에 해당 투플이 있는지 검색
		SessionData sessionData = new SessionData();
		Session_Receiver session_Receiver;
		DTO_Receiver dto_Receiver = mapper_receiver.selectByIdEmail(dto.getMember_Receiver_idEmail());
		
		//뽑아낸 투플이 있을때, 그리고 removed가 1이 아닐때(삭제된 회원이 아닐 때) 그 투플의 비밀번호와 dto의 비밀번호가 같을 때
		if(dto_Receiver!=null&&dto_Receiver.getMember_Receiver_removed()!="1"&&
				dto.getMember_Receiver_pw().equals(dto_Receiver.getMember_Receiver_pw())) {
			session_Receiver = new Session_Receiver(dto_Receiver.getMember_Receiver_idx(), dto_Receiver.getMember_Receiver_name());
			sessionData.setSession_Receiver(session_Receiver);
			sessionData.setMember_identified(dto_Receiver.getMember_Receiver_identified());
			return sessionData;
		}else return null;
	}

	//개인정보 읽기
	public DTO_Receiver readPrivateDataByIdx(String Member_Receiver_idx) {
		DTO_Receiver dto_Receiver = mapper_receiver.selectByIdx(Member_Receiver_idx);
		return dto_Receiver;
	}

	//개인정보 수정
	public DTO_Receiver updatePrivateData(DTO_Receiver dto) {
		mapper_receiver.updateReceiver(dto);
		DTO_Receiver dto_Receiver = mapper_receiver.selectByIdx(dto.getMember_Receiver_idx());
		return dto_Receiver;
	}
	
	//Request_Search 테이블 수정.
	public void updateRequest_Search(DTO_Receiver dto) {
		mapper_receiver.updateRequest_SearchWhenReceiverUpdated(dto);
	}

	//인증여부갱신.
	public void updateReceiver_identified(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_identified(Member_Receiver_idx);
	}
	
	@Override
	public void updateReceiver_identifiedforAdmin(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_identifiedforAdmin(Member_Receiver_idx);
		
	}

	//아이디 삭제.
	public void updateReceiver_Removed(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_Removed(Member_Receiver_idx);
	}

	@Override
	public ArrayList<DTO_Receiver> readReceiverListforAmdin() {
		ArrayList<DTO_Receiver> receiverList = mapper_receiver.selectAllforAdmin();
		return receiverList;
	}
	
	//등록된 기관 게시판에서 사용되는 서비스
	//전체 리스트 뽑기.
	public ArrayList<DTO_Receiver> readReceiverList() {
		ArrayList<DTO_Receiver> receiverList = mapper_receiver.selectAll();
		return receiverList;
	}

	//필터링
	//기관 분류.
	public ArrayList<DTO_Receiver> filterByReceiver_Category_entry(String Member_Receiver_Category) {
		ArrayList<DTO_Receiver> sortCategoryReceiverList =mapper_receiver.selectByReceiver_Category_Entry(Member_Receiver_Category);
		return sortCategoryReceiverList;
	}

	//기관 이름.
	public ArrayList<DTO_Receiver> searchByReceiver_Name(String Member_Receiver_name) {
		ArrayList<DTO_Receiver> sortNameReceiverList = mapper_receiver.selectByReceiver_Name(Member_Receiver_name);
		return sortNameReceiverList;
	}

	//상세 주소.
	public ArrayList<DTO_Receiver> filterByReceiver_AddressDetail(String Member_Receiver_adDetail) {
		ArrayList<DTO_Receiver> sortAdressDetailList = mapper_receiver.selectByReceiver_AddressDetail(Member_Receiver_adDetail);
		return sortAdressDetailList;
	}

	//주소 대분류.
	//member_Receiver_AddressCategory_entry 를 고정적으로 정해놓는다면, mapper의 쿼리문에 그냥  
	//member_Receiver_AddressCategory_entry= #{member_Receiver_AddressCategory_entry}으로 처리해도 되지 않을까
	public ArrayList<DTO_Receiver> filterByAddressCategory_entry(String Member_Receiver_AdCategory) {
		ArrayList<DTO_Receiver> sortAdressReceiveraList = mapper_receiver.selectByAddressCategory_Entry(Member_Receiver_AdCategory);
		return sortAdressReceiveraList;
	}

	@Override
	public ArrayList<DTO_Receiver> filterByAll(String Query) {
		ArrayList<DTO_Receiver> dto = mapper_receiver.selectByAllForReceiverList(Query);
		return dto;
	}

	@Override
	public DTO_Receiver_File_Upload readFile_Upload_idx(String Member_Receiver_idx) {
		DTO_Receiver_File_Upload dto_Receiver_File_Upload = mapper_File_Upload.selectByReceiverIdx(Member_Receiver_idx);
		return dto_Receiver_File_Upload;
	}

	@Override
	public void updateReceiver_RemovedBack(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_RemovedBack(Member_Receiver_idx);
	}





}
