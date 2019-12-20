package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_File_Upload;
import com.teamawesome.awesomedonor.vo.session.SessionData;

public interface Service_Receiver {
	
	//회원가입.
	public void register(DTO_Receiver dto_Receiver, DTO_Receiver_File_Upload dto_File_Upload, String Member_identificationCode);
		
	//로그인.
	public SessionData login(DTO_Receiver dto);
	
	//개인정보 읽기.
	public DTO_Receiver readPrivateDataByIdx(String Member_Receiver_idx);
		
	//개인정보 수정.
	public DTO_Receiver updatePrivateData(DTO_Receiver dto);
	
	//Request_Search 테이블 수정.
	public void updateRequest_Search(DTO_Receiver dto);
		
	//인증여부갱신.
	public void updateReceiver_identified(String Member_Receiver_idx);
	
	//인증여부갱신-관리
	public void updateReceiver_identifiedforAdmin(String Member_Receiver_idx);
		
	//아이디 삭제.
	public void updateReceiver_Removed(String Member_Receiver_idx);
	
	//기관 전체 리스트 뽑기.
	public ArrayList<DTO_Receiver> readReceiverListforAmdin();
	
	//등록된 기관 게시판에서 사용되는 서비스
	//전체 리스트 뽑기.
	public ArrayList<DTO_Receiver> readReceiverList();
	
	//필터링
	//기관 분류.
	public ArrayList<DTO_Receiver> filterByReceiver_Category_entry(String Member_Receiver_Category); 
	
	//기관 이름.
	public ArrayList<DTO_Receiver> searchByReceiver_Name(String Member_Receiver_name);
	
	//상세 주소.
	public ArrayList<DTO_Receiver> filterByReceiver_AddressDetail(String Member_Receiver_adDetail);
	
	//주소 대분류.
	public ArrayList<DTO_Receiver> filterByAddressCategory_entry(String Member_Receiver_AdCategory);
	
	//주소 대분류.
	public ArrayList<DTO_Receiver> filterByAll(String Query);
	
    ///////인증 파일 읽기	////관리자 추가
	public DTO_Receiver_File_Upload readFile_Upload_idx(String Member_Receiver_idx);
	
	//아이디 복원////관리자 추가
	public void updateReceiver_RemovedBack(String member_Receiver_Idx);
		
	
}
