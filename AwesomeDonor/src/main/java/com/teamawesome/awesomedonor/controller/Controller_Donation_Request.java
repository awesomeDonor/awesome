package com.teamawesome.awesomedonor.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamawesome.awesomedonor.service.donation.Service_Donation_Request;
import com.teamawesome.awesomedonor.service.member.Service_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.session.SessionData;

@Controller
public class Controller_Donation_Request {
	//--------------객체----------------
	@Autowired
	Service_Donation_Request service_Donation_Request;
	
	@Autowired
	Service_Receiver service_Receiver;
	
	//--------------컨트롤러-----------------
	//메뉴에서 "필요해요 게시판" 누르면 나오는 페이지.
	//필터링이나 검색 없이 한번에 쭉 뽑기. 
	@RequestMapping("/donation_Requst_MainPage")
	public String donation_Requst_MainPage(Model model, String Page) {
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.readRequest_List(Page);
		String url = "./donation_Requst_MainPage?";
		
		model.addAttribute("boardData", boardData);
		model.addAttribute("url", url);
		
		return "Donation_Request/request_MainPage";
	}
	
	//게시물 자세히 보기.
	@RequestMapping("/readRequestDetail_Page")
	public String readRequestDetail_Page(String Donation_Request_idx, Model model){
		BoardData_Donation_Request boardData = service_Donation_Request.readARequest(Donation_Request_idx);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/readRequestDetail_Page";
	}
	
	//"필요해요 게시판"에 글쓰는 페이지.
	@RequestMapping("/registerRequest_Page")
	public String registerRequest_Page(Model model, HttpSession session) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String member_Receiver_idx = sessionData.getSession_Receiver().getSessionIdx();	
		//기관에 대한 정보가 고정값으로 뜨는데 이걸 위해 DTO_Receiver를 받아서 model로 넘겨주기.(변수명 dto)
		DTO_Receiver dto_Receiver = service_Receiver.readPrivateDataByIdx(member_Receiver_idx); 
		BoardData_Donation_Request boardData = new BoardData_Donation_Request();
		boardData.setDto_Receiver(dto_Receiver);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/registerRequest_Page";
	}
	
	//글쓰는 페이지에서 받은 정보를 Donation_Request 테이블에 insert하는 process.
	@RequestMapping("/registerRequest_Process")
	public String registerRequest_Process(DTO_Donation_Request dto_Donation_Request, HttpSession session) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String member_Receiver_idx = sessionData.getSession_Receiver().getSessionIdx();	
		DTO_Receiver dto_Receiver = service_Receiver.readPrivateDataByIdx(member_Receiver_idx);
		
		dto_Donation_Request.setMember_Receiver_idx(member_Receiver_idx);
		service_Donation_Request.registerRequest(dto_Donation_Request, dto_Receiver);
		return "redirect:donation_Requst_MainPage?Page=1";//readRequestDetail_Page에서 잠깐 바꿈.
	}
	
	//필요해요 게시판 update페이지. 
	//수정할 내용이 미리 채워져있어야 할 필요가 있으므로 boardData를 넘겨준다. 
	@RequestMapping("/updateRequest_Page")
	public String updateRequest_Page(Model model, String Donation_Request_idx) { //Donation_Request_idx는 ./updateContentPage?c_idx=${boardData.contentvo.c_idx }처럼 a태그를 통해 받기.
		BoardData_Donation_Request boardData = service_Donation_Request.readARequest(Donation_Request_idx);
		
		model.addAttribute("boardData", boardData);
		return "Donation_Request/updateRequest_Page";
	}
	
	//게시판 내용 update process
	@RequestMapping("/updateRequest_Process")
	public String updateRequest_Process(DTO_Donation_Request dto_Donation_Request) { //Donation_Request_idx는 hidden으로 받기.
		System.out.println(dto_Donation_Request.getDonation_Request_idx());
		BoardData_Donation_Request boardData = service_Donation_Request.readARequest(dto_Donation_Request.getDonation_Request_idx());
		if(dto_Donation_Request.getStuff_MajorCategory_entry().equals("")) {
			dto_Donation_Request.setStuff_MajorCategory_entry(boardData.getDto_Donation_Request().getStuff_MajorCategory_entry());
		}
		
		if(dto_Donation_Request.getStuff_MinorCategory_entry().equals("")) {
			dto_Donation_Request.setStuff_MinorCategory_entry(boardData.getDto_Donation_Request().getStuff_MinorCategory_entry());
		}
		
		if(dto_Donation_Request.getDonation_Request_amount().equals("")) {
			dto_Donation_Request.setDonation_Request_amount(boardData.getDto_Donation_Request().getDonation_Request_amount());
		}
		
		if(dto_Donation_Request.getDonation_Request_note().equals("")) {
			dto_Donation_Request.setDonation_Request_note(boardData.getDto_Donation_Request().getDonation_Request_note());
		}
		service_Donation_Request.update(dto_Donation_Request);
		return "redirect:donation_Requst_MainPage?Page=1";
	}

	//자세히보기.
	@RequestMapping("/readRequestDetail")
	public String readRequestDetail(String Donation_Request_idx, Model model){
		BoardData_Donation_Request boardData = service_Donation_Request.readARequest(Donation_Request_idx);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/readRequestDetail";
	}
	
	//삭제.
	@RequestMapping("/deleteARequest")
	public String deleteARequest(String Donation_Request_idx){
		service_Donation_Request.delete(Donation_Request_idx);
		return "redirect:donation_Requst_MainPage?Page=1";
	}
	
	//-----------------필터링 및 검색---------------------
	//필터
	//물품 대분류 필터
	@RequestMapping("/filterByMajorCategory_entry")
	public String filterByMajorCategory_entry(String Stuff_MajorCategory_entry, Model model) {
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.filterByMajorCategory_Entry(Stuff_MajorCategory_entry);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
	//쓰는 것.
	//물품 소분류 필터
	@RequestMapping("/filterByMinorCategory_entry")
	public String filterByMinorCategory_entry(String Stuff_MinorCategory_entry, Model model, String page) {
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.filterByMinorCategory_Entry(Stuff_MinorCategory_entry, page);
		String url = "./filterByMinorCategory_entry?Stuff_MinorCategory_entry="+Stuff_MinorCategory_entry+"&";
		
		model.addAttribute("boardData", boardData);
		model.addAttribute("url", url);
		return "Donation_Request/request_MainPage";
	}
	
	//지역 필터
	@RequestMapping("/filterByAddressCategory_entry")
	public String filterByAddressCategory_entry(String Member_Receiver_AddressCategory_entry, Model model) {
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.filterByAddressCategory_Entry(Member_Receiver_AddressCategory_entry);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
	//검색
	//쓰는 것. 
	@RequestMapping("/searchByThreeType")
	public String searchByThreeType(String search, String target, Model model, HttpServletRequest request, String page) {
		if(search.equals("both")) {
			ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByBoth(target, page);
			model.addAttribute("boardData", boardData);
		}else if(search.equals("기관명")) {
			ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByReceiver_Name(target, page);
			model.addAttribute("boardData", boardData);
		}else if(search.equals("관심기관")){
			ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByReceiverLike(target, page);
			model.addAttribute("boardData", boardData);
		}else {
			ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByReceiver_AddressDetail(target, page);
			model.addAttribute("boardData", boardData);
		}
		
		String url = "./searchByThreeType?search="+search+"&target="+target+"&";
		model.addAttribute("url", url);
		return "Donation_Request/request_MainPage";
	}
	
	//진행도 필터.
	@RequestMapping("/filterByProgress")
	public String filterByProgress(String Donation_Request_progress, Model model) {
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.filterByProgress(Donation_Request_progress);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
//	
//	//검색
//	//기관 상세주소로 검색. 
//	@RequestMapping("/searchByReceiver_AddressDetail")
//	public String searchByReceiver_AddressDetail(String Member_Receiver_addressDetail, Model model) {
//		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByReceiver_AddressDetail(Member_Receiver_addressDetail);
//		model.addAttribute("boardData", boardData);
//		return "Donation_Request/request_MainPage";
//	}
//	
//	//기관 이름으로 검색.
//	@RequestMapping("/searchByReceiver_Name")
//	public String searchByReceiver_Name(String Member_Receiver_name, Model model) {
//		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.searchByReceiver_Name(Member_Receiver_name);
//		model.addAttribute("boardData", boardData);
//		return "Donation_Request/request_MainPage";
//	}
//	
	//쓰는 것.
	//다중 필터링. 
	@RequestMapping("/filterByAll")
	public String filterByAll(String[] Member_Receiver_AdCategory, String[] Donation_Request_progress, String[] Member_Receiver_Category, Model model, String page) {
		String Query = "";
		String url = "./filterByAll?";
		if(Member_Receiver_AdCategory!=null) {
			Query+="(";
			for(int i = 0; i<Member_Receiver_AdCategory.length; i++) {
				Query+= "Member_Receiver_AdCategory = '" + Member_Receiver_AdCategory[i] + "'";
				url +="Member_Receiver_AdCategory="+Member_Receiver_AdCategory[i];
				if(i!=Member_Receiver_AdCategory.length-1) {
					Query+=" or ";
					url+="&";
				}
			}
			Query+=")";
			
			if(Donation_Request_progress!=null||Member_Receiver_Category!=null) {
				Query+=" and ";
				url+="&";
			}
		}
		
		if(Donation_Request_progress!=null) {
			Query+="(";
			for(int i = 0; i<Donation_Request_progress.length; i++) {
				Query+= "Donation_Request_progress = '" + Donation_Request_progress[i] + "'";
				url+="Donation_Request_progress="+Donation_Request_progress[i];
				if(i!=Donation_Request_progress.length-1) {
					Query+=" or ";
					url+="&";
				}
			}
			Query+=")";
			
			if(Member_Receiver_Category!=null) {
				Query+=" and ";
				url+="&";
			}
		}
		
		if(Member_Receiver_Category!=null) {
			Query+="(";
			for(int i = 0; i<Member_Receiver_Category.length; i++) {
				Query+= "Member_Receiver_Category = '" + Member_Receiver_Category[i] + "'";
				url+="Member_Receiver_Category="+Member_Receiver_Category[i];
				if(i!=Member_Receiver_Category.length-1) {
					Query+=" or ";
					url+="&";
				}
			}
			Query+=")";
			url+="&";
			
		}
		System.out.println(Query);
		
		
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.filterByAll(Query, page);
		model.addAttribute("url", url);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
	
	@RequestMapping("/readMyRequest")
	public String readMyRequest(HttpSession session, Model model) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String Member_Receiver_idx = sessionData.getSession_Receiver().getSessionIdx();
		ArrayList<BoardData_Donation_Request> boardData = service_Donation_Request.selectByReceiverIdx(Member_Receiver_idx);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
	
//	@RequestMapping
	
//	@RequestMapping

}
