package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

public interface Service_Donation_Request {
	//-------------입력 service-------------
	//Request테이블에 등록.+Search 테이블에도 함께 등록되게 만들기. (1.getPrimaryKey 2, 3.insert)
	public void registerRequest(DTO_Donation_Request dto_Donation_Request, DTO_Receiver dto_Receiver);
	
	//register를 위해 대분류 뽑아오기
	public String getMajorCaterogy_Entry(String Stuff_MinorCategory_entry);
	
	//-------------출력 service-------------
	//하나의 항목 선택, 자세히 보기 등에 쓸 수 있을 것!
	//--하나에서 다른 것으로 넘어가는 것은 우선 컨트롤러에서 처리한다고 생각하자.
	public BoardData_Donation_Request readARequest(String Donation_Request_idx);
	
	//전체 리스트 출력
	public ArrayList<BoardData_Donation_Request> readRequest_List(String Page);
	
	//필터링!!
	//대분류.
	public ArrayList<BoardData_Donation_Request> filterByMajorCategory_Entry(String Stuff_MajorCategory_entry); 
	
	//소분류.
	public ArrayList<BoardData_Donation_Request> filterByMinorCategory_Entry(String Stuff_MinorCategory_entry, String page); 
	
	//기관분류. 이하 Donation_Request_Search에서 질의. 
	public ArrayList<BoardData_Donation_Request> filterByReceiver_Category_Entry(String Member_Receiver_Category_entry); 
	
	//기관이름.
	public ArrayList<BoardData_Donation_Request> searchByReceiver_Name(String Member_Receiver_name, String page);
	
	//관심기관.
	public ArrayList<BoardData_Donation_Request> searchByReceiverLike(String ReceiverLike, String page);
	
	//상세주소.
	public ArrayList<BoardData_Donation_Request> searchByReceiver_AddressDetail(String Member_Receiver_addressDetail, String page);
	
	//위엣 것 둘 다로 검색. 
	public ArrayList<BoardData_Donation_Request> searchByBoth(String adDetailorName, String page);
	
	//주소 대분류.
	public ArrayList<BoardData_Donation_Request> filterByAddressCategory_Entry(String Member_Receiver_AddressCategory_entry);
	
	//filterByAll
	public ArrayList<BoardData_Donation_Request> filterByAll(String Query, String page);
	
	//내글보기.
	public ArrayList<BoardData_Donation_Request> selectByReceiverIdx(String Member_Receiver_idx);
	
	//후원진행상태. 후원신청가능-0, 진행중-1, 후원완료-2
	public ArrayList<BoardData_Donation_Request> filterByProgress(String Donation_Request_progress); 

	//-------------수정 service-------------	
	//수정한 다음에 바로 수정된 내용을 확인할 수 있도록
	//BoardData_Donation_Request에 담아서 return!! 
	public void update(DTO_Donation_Request dto);
	
	//-------------삭제 service-------------
	//필요해요 게시판에서 삭제.
	public void delete(String Donation_Request_idx);

}
