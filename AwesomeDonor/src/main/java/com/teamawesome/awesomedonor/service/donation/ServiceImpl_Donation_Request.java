package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Request;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request_Search;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

@Service
public class ServiceImpl_Donation_Request implements Service_Donation_Request {

	@Autowired
	Mapper_Donation_Request mapper_Donation_Request;
	
	@Autowired
	Mapper_Receiver mapper_Receiver;
	
	//-------------입력 service-------------
	//Request테이블에 등록.+Search 테이블에도 함께 등록되게 만들기. (1.getPrimaryKey 2, 3.insert)
	@Override
	public void registerRequest(DTO_Donation_Request dto_Donation_Request, DTO_Receiver dto_Receiver) {
		String donation_Request_idx = mapper_Donation_Request.getPrimaryKey();
		
		dto_Donation_Request.setDonation_Request_idx(donation_Request_idx);
		mapper_Donation_Request.insert(dto_Donation_Request);
		mapper_Donation_Request.insertIntoDonation_Search(dto_Receiver, donation_Request_idx);
		return;
	}

	//register를 위해 대분류 뽑아오기
	@Override
	public String getMajorCaterogy_Entry(String Stuff_MinorCategory_entry) {
		int stuff_MajorCategory_idx = 
				mapper_Donation_Request.selectMajorCategory_IdxByMinorCategory_Entry(Stuff_MinorCategory_entry);
		String stuff_MajorCategory_entry = 
				mapper_Donation_Request.selectMajorCategory_EntryByMajorCategory_Idx(stuff_MajorCategory_idx);
		return stuff_MajorCategory_entry;
	}

	//-------------출력 service-------------
	//하나의 항목 선택, 자세히 보기 등에 쓸 수 있을 것!
	//--하나에서 다른 것으로 넘어가는 것은 우선 컨트롤러에서 처리한다고 생각하자.
	@Override
	public BoardData_Donation_Request readARequest(String Donation_Request_idx) {
		DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(Donation_Request_idx);
		DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request.getMember_Receiver_idx());
		BoardData_Donation_Request boarddata_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
		return boarddata_Request;
	}

	//전체 리스트 출력
	@Override
	public ArrayList<BoardData_Donation_Request> readRequest_List(String Page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request> dto_Request_List = mapper_Donation_Request.selectAll();
		for(int i = 0; i<dto_Request_List.size(); i++) {
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request_List.get(i), dto_Receiver);
				boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}

	//----------필터링!!--------------
	//대분류.
	@Override
	public ArrayList<BoardData_Donation_Request> filterByMajorCategory_Entry(String Stuff_MajorCategory_entry) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request> dto_Request_List = mapper_Donation_Request.selectByMajorCategory_Entry(Stuff_MajorCategory_entry);
		for(DTO_Donation_Request dto : dto_Request_List) {
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto, dto_Receiver);
			boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}

	//소분류.
	@Override
	public ArrayList<BoardData_Donation_Request> filterByMinorCategory_Entry(String Stuff_MinorCategory_entry, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request> dto_Request_List = mapper_Donation_Request.selectByMinorCategory_Entry(Stuff_MinorCategory_entry);
		
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_List.size(); i++) {
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request_List.get(i), dto_Receiver);
				boardData_Request_List.add(boardData_Request);
		}
		
		return boardData_Request_List;	
	}
	
	//후원진행상태. 후원신청가능-0, 진행중-1, 후원완료-2
	@Override
	public ArrayList<BoardData_Donation_Request> filterByProgress(String Donation_Request_progress) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request> dto_Request_List = mapper_Donation_Request.selectByProgress(Donation_Request_progress);
		for(DTO_Donation_Request dto : dto_Request_List) {
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto, dto_Receiver);
			boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}

	//기관분류. 이하 Donation_Request_Search에서 질의. 
	@Override
	public ArrayList<BoardData_Donation_Request> filterByReceiver_Category_Entry(String Member_Receiver_Category_entry) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByReceiver_Category_Entry(Member_Receiver_Category_entry);
		for(DTO_Donation_Request_Search dto_Request_Search : dto_Request_Search_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search.getMember_Receiver_idx());
			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
			boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}

	//기관이름.
	@Override
	public ArrayList<BoardData_Donation_Request> searchByReceiver_Name(String Member_Receiver_name, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByReceiver_Name(Member_Receiver_name);
		
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_Search_List.size(); i++) {
				DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search_List.get(i).getDonation_Request_idx());
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
				boardData_Request_List.add(boardData_Request);
		}
//		
//		for(DTO_Donation_Request_Search dto_Request_Search : dto_Request_Search_List) {
//			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search.getDonation_Request_idx());
//			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search.getMember_Receiver_idx());
//			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
//			boardData_Request_List.add(boardData_Request);
//		}
		return boardData_Request_List;
	}
	
	@Override
	public ArrayList<BoardData_Donation_Request> searchByReceiverLike(String ReceiverLike, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByReceiverLike(ReceiverLike);
		
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_Search_List.size(); i++) {
			if(i<dto_Request_Search_List.size()) {
				DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search_List.get(i).getDonation_Request_idx());
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
				boardData_Request_List.add(boardData_Request);
			}
		}

		return boardData_Request_List;
	}


	//상세주소.
	@Override
	public ArrayList<BoardData_Donation_Request> searchByReceiver_AddressDetail(String Member_Receiver_addressDetail, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByReceiver_AddressDetail(Member_Receiver_addressDetail);
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_Search_List.size(); i++) {
				DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search_List.get(i).getDonation_Request_idx());
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
				boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}

	@Override
	public ArrayList<BoardData_Donation_Request> searchByBoth(String adDetailorName, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		System.out.println(adDetailorName);
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByBoth(adDetailorName);
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_Search_List.size(); i++) {
				DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search_List.get(i).getDonation_Request_idx());
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
				boardData_Request_List.add(boardData_Request);
			
		}
		return boardData_Request_List;
	}
	
	//주소 대분류.
	@Override
	public ArrayList<BoardData_Donation_Request> filterByAddressCategory_Entry(String Member_Receiver_AddressCategory_entry) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = 
				mapper_Donation_Request.selectFromRequestSearchByAddressCategory_Entry(Member_Receiver_AddressCategory_entry);
		for(DTO_Donation_Request_Search dto_Request_Search : dto_Request_Search_List) {
			DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search.getDonation_Request_idx());
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search.getMember_Receiver_idx());
			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
			boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}
	
	@Override
	public ArrayList<BoardData_Donation_Request> filterByAll(String Query, String page) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request_Search> dto_Request_Search_List = mapper_Donation_Request.selectFromRequestSearchByAll(Query);
		
		int Page = (Integer.parseInt(page))-1;
		for(int i = 0; i<dto_Request_Search_List.size(); i++) {
				DTO_Donation_Request dto_Request = mapper_Donation_Request.selectByIdx(dto_Request_Search_List.get(i).getDonation_Request_idx());
				DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto_Request_Search_List.get(i).getMember_Receiver_idx());
				BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto_Request, dto_Receiver);
				boardData_Request_List.add(boardData_Request);
			}
		
		return boardData_Request_List;
	}
	
	@Override
	public ArrayList<BoardData_Donation_Request> selectByReceiverIdx(String Member_Receiver_idx) {
		ArrayList<BoardData_Donation_Request> boardData_Request_List = new ArrayList<BoardData_Donation_Request>();
		ArrayList<DTO_Donation_Request> dto_Request_List = mapper_Donation_Request.selectByReceiverIdx(Member_Receiver_idx);
		for(DTO_Donation_Request dto : dto_Request_List) {
			DTO_Receiver dto_Receiver = mapper_Receiver.selectByIdx(dto.getMember_Receiver_idx());
			BoardData_Donation_Request boardData_Request = new BoardData_Donation_Request(dto, dto_Receiver);
			boardData_Request_List.add(boardData_Request);
		}
		return boardData_Request_List;
	}


	//-------------수정 service-------------
	//수정한 다음에 바로 수정된 내용을 확인할 수 있도록
	//BoardData_Donation_Request에 담아서 return!!
	@Override
	public void update(DTO_Donation_Request dto) {
		mapper_Donation_Request.update(dto);
	}
	

	//-------------삭제 service-------------
	@Override
	public void delete(String Donation_Request_idx) {
		mapper_Donation_Request.delete(Donation_Request_idx);
		mapper_Donation_Request.deleteFromSearch(Donation_Request_idx);
	}





	
}
