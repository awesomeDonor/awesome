package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Receiver_Like;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;
import com.teamawesome.awesomedonor.vo.session.SessionData;

public interface Service_Donor {
	
	//-------------입력 service-------------
	//회원가입.
	public void register(DTO_Donor dto_Donor, DTO_Donor_File_Upload dto_File_Upload, String Member_identificationCode);
	
	//관심기관 등록.
	public void registerReceiverLike(String sessionIdx, String Member_Receiver_idx);
	
	//-------------출력 service-------------
	//로그인.
	public SessionData login(DTO_Donor dto);
	
	//기부자 별점 평균.
	public String readDonor_StarNumber_AVG(String Member_Donor_idx);
	
	//기부자 평가 리스트(전체보기).
	public ArrayList<DTO_Donor_Evaluation> readDonor_EvaluationList(String Member_Donor_idx); 
	
	//개인정보 읽기.
	//Information_Donor를 조합하는 것은 Action에서 진행할 것.  
	public DTO_Donor readPrivateData(String Member_Donor_idx);
	
	//관심기관 리스트 뽑기. 등록된 신청 건수와 함께. 
	public ArrayList<BoardData_Receiver_Like> readReceiver_Like_List(String sessionIdx);
	
	//11.8 
	public ArrayList<BoardData_Donation_Request> goRequest(String member_Receiver_name);
	
	//파일 읽기 11.2추가
	public DTO_Donor_File_Upload readFile(String Member_Donor_idx);
	
	//11.11 추가.
	//identificationCode로 DTO 뽑아오기. 
	public DTO_Member_Identification readIdentificationCode(String Member_identificationCode);
	
	//등록된 후원자 전체 리스트 뽑기..
	public ArrayList<DTO_Donor> readDonorList();

	//-------------수정 service-------------
	//개인정보 수정.
	public DTO_Donor updatePrivateData(DTO_Donor dto);
	
	//인증여부갱신.
	public void updateDonor_identified(String Member_Donor_idx);
	
	//아이디 삭제.
	public void updateDonor_Removed(String Member_Donor_idx);
	
	//아이디 복원
	public void updateDonor_RemovedBack(String Member_Donor_idx);
	
	//업로드 파일 수정. 
	public void updateDonorFile(DTO_Donor_File_Upload dto);
	
	//-------------삭제 service-------------
	//관심기관 삭제
	public void deleteReceiverLike(String sessionIdx, String Member_Receiver_idx);
}
