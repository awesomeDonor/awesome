package com.teamawesome.awesomedonor.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamawesome.awesomedonor.service.donation.Service_Donation_Action_Receiver;
import com.teamawesome.awesomedonor.service.member.Service_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Information_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.session.SessionData;

@Controller
public class Controller_MyPage_Receiver {
	//--------------객체----------------
	@Autowired
	Service_Receiver service_Receiver;
	
	@Autowired
	Service_Donation_Action_Receiver service_Donation_Action_Receiver;
	
	//--------------컨트롤러-----------------
	//마이페이지 메인.
	@RequestMapping("/myPage_Main")
	public String myPage_Main() {
		
		return "MyPage_Receiver/myPage_Main";
	}
	
	//개인정보 확인 시에 비밀번호 확인 페이지.
	@RequestMapping("/checkPassword_Receiver")
	public String checkPassword() {
		return "MyPage_Receiver/checkPassword";
	}
	
	//비밀번호 확인 프로세스.
	@RequestMapping("/readPrivateData_Receiver")
	public String readPrivateData_Receiver(String Member_Receiver_idx, Model model) { //이건 폼에 hidden으로 받기(from sessionData)
		DTO_Receiver dto = service_Receiver.readPrivateDataByIdx(Member_Receiver_idx);
		model.addAttribute("dto", dto);
		return "MyPage_Receiver/readPrivateData";
	}
	
	//개인정보 수정 페이지.
	@RequestMapping("/updateReceiverPrivateData_Page")
	public String updatePrivateData_Page(Model model, String Member_Receiver_idx){//이건 폼에 hidden으로 받기(from sessionData)
		DTO_Receiver dto_Receiver = service_Receiver.readPrivateDataByIdx(Member_Receiver_idx);
		model.addAttribute("dto", dto_Receiver);
	
		return "MyPage_Receiver/updatePrivateData_Page";
	}
	
	//개인정보 수정 프로세스.
	@RequestMapping("/updatePrivateData_Process")
	public String updatePrivateData_Process(Model model, DTO_Receiver dto_Receiver) { // 여기도 hidden 쓰기. 
		
		DTO_Receiver dto = service_Receiver.readPrivateDataByIdx(dto_Receiver.getMember_Receiver_idx());
		if(dto_Receiver.getMember_Receiver_AdCategory()==null) {
			dto_Receiver.setMember_Receiver_AdCategory(dto.getMember_Receiver_AdCategory());
			System.out.println(dto_Receiver.getMember_Receiver_AdCategory());
			dto_Receiver.setMember_Receiver_adDetail(dto.getMember_Receiver_adDetail());
		}else {
			if(!dto.getMember_Receiver_adDetail().equals(dto_Receiver.getMember_Receiver_adDetail())) {
				service_Receiver.updateRequest_Search(dto_Receiver);
			}
		}
		
		if(dto_Receiver.getMember_Receiver_pw()=="") {
			dto_Receiver.setMember_Receiver_pw(dto.getMember_Receiver_pw());
			System.out.println(dto_Receiver.getMember_Receiver_pw());
		}
		
		if(dto_Receiver.getMember_Receiver_phoneNumber()=="") {
			dto_Receiver.setMember_Receiver_phoneNumber(dto.getMember_Receiver_phoneNumber());
		}
		
		if(dto_Receiver.getMember_Receiver_websiteUrl()=="") {
			dto_Receiver.setMember_Receiver_websiteUrl(dto.getMember_Receiver_websiteUrl());
		}
		
		if(dto_Receiver.getMember_Receiver_introduction()=="") {
			dto_Receiver.setMember_Receiver_introduction(dto.getMember_Receiver_introduction());
		}
		
		
		dto = service_Receiver.updatePrivateData(dto);
		model.addAttribute("dto", dto);
		
		return "redirect:readPrivateData_Receiver?Member_Receiver_idx="+dto_Receiver.getMember_Receiver_idx();
	}
	
	//예약관리 누르면 나오는 페이지. 예약 신청 현황 or Donation_Action 첫 페이지. 
	@RequestMapping("/readBoardDataRequestInfo")
	public String Donation_ActionPage_Main(Model model, HttpSession session) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String sessionIdx = sessionData.getSession_Receiver().getSessionIdx();
		
		ArrayList<BoardData_Donation_Action_Receiver> boardData = service_Donation_Action_Receiver.readBoardDataRequestInfo(sessionIdx);
		model.addAttribute("boardData", boardData);
		return "MyPage_Receiver/1readBoardDataRequestInfo";
	}
	
	//N건을 누르면 나오는 페이지. 
	@RequestMapping("/readDonorList")
	public String readDonorList_Page(Model model, String Donation_Request_idx) { //Donation_Request_idx 이건 링크를 통해 보내기 
		ArrayList<BoardData_Donation_Action_Receiver> boardData = service_Donation_Action_Receiver.readDonorList(Donation_Request_idx);
		model.addAttribute("boardData", boardData);
		return "MyPage_Receiver/2readDonorList";		
	}

	//기부신청을 한 회원정보 자세히 보기. 
	@RequestMapping("/readDetailDonorInfo")
	public String readDetailDonorInfo(Model model, String Donation_Action_idx) { //Donation_Action_idx 이건 링크를 통해 보내기
		BoardData_Information_Donor boardData = service_Donation_Action_Receiver.readDetailDonorInfo(Donation_Action_idx);
		model.addAttribute("donation_Action_idx", Donation_Action_idx);
		model.addAttribute("boardData", boardData);
		return "MyPage_Receiver/3readDetailDonorInfo";
	}

	//기부신청수락 프로세스 이후 후원 진행 현황으로 페이지 이동. 
	@RequestMapping("/donationAceept_Process")
	public String donationAceept_Process(Model model, String Donation_Action_idx, HttpSession session) {//Donation_Action_idx 이건 링크를 통해 보내기
		if(Donation_Action_idx!=null) {
			service_Donation_Action_Receiver.donationAceept(Donation_Action_idx);//기부신청수락 프로세스.
		}
		
		
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String sessionIdx = sessionData.getSession_Receiver().getSessionIdx();
		ArrayList<BoardData_Donation_Action_Receiver> boardData = service_Donation_Action_Receiver.readDonationInProgress(sessionIdx);
		model.addAttribute("boardData", boardData);
		return "MyPage_Receiver/4readDonationInProgress";
	}

	//후원 완료 또는 후원 중지를 눌렀을 때. 
	//평가 페이지로 포워딩하는 것. 
	@RequestMapping("/writeEvaluation_Page")
	public String writeEvaluation_Page(String Donation_Action_idx, Model model, String complete) {
		model.addAttribute("donation_Action_idx", Donation_Action_idx);
		model.addAttribute("complete", complete);
		return "MyPage_Receiver/5writeEvaluation_Page";
	}
	
	//평가 페이지에서 창닫기를 한 경우. 
	@RequestMapping("/closeWindow")
	public String closeWindow(String Donation_Action_idx, String complete, Model model, HttpSession session) {//
		if(Donation_Action_idx!=null) {
			if(complete.equals("1")) service_Donation_Action_Receiver.donationComplete(Donation_Action_idx);
			else service_Donation_Action_Receiver.donationStop(Donation_Action_idx);
		}
		
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String sessionIdx = sessionData.getSession_Receiver().getSessionIdx();
		ArrayList<BoardData_Donation_Action_Receiver> boardData = service_Donation_Action_Receiver.readBoardDataCompleteInfo(sessionIdx);
		
		model.addAttribute("boardData", boardData);
		
		return "MyPage_Receiver/6readBoardDataCompleteInfo";
	}
	
	//평가 페이지에서 작성 완료를 누른 경우. 
	@RequestMapping("/writeEvaluation_Process")
	public String writeEvaluation_Process(DTO_Donor_Evaluation dtoEvaluation, String Donation_Action_idx, String complete, Model model, HttpSession session) {
		//Donation_Action_idx가 hidden으로 넘어오면 이게 DTO_Donor_Evaluation에 담겨서 들어오게 됨.
		//1)평가 작성 절차.
		System.out.println(dtoEvaluation.getDonor_Evaluation_note());
		System.out.println(dtoEvaluation.getDonation_Action_idx());
		String donation_Action_idx = dtoEvaluation.getDonation_Action_idx();
		String member_Donor_idx = service_Donation_Action_Receiver.getMemberDonorIdx(donation_Action_idx);
		dtoEvaluation.setDonation_Action_idx(donation_Action_idx);
		dtoEvaluation.setMember_Donor_idx(member_Donor_idx);
		service_Donation_Action_Receiver.writeEvaluation(dtoEvaluation);
		
		if(complete.equals("1")) service_Donation_Action_Receiver.donationComplete(dtoEvaluation.getDonation_Action_idx());
		else service_Donation_Action_Receiver.donationStop(dtoEvaluation.getDonation_Action_idx());
		
		
		//2)후원 완료 내역을 model에 담아서 보내주는 역할. 
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String sessionIdx = sessionData.getSession_Receiver().getSessionIdx();
		ArrayList<BoardData_Donation_Action_Receiver> boardData = service_Donation_Action_Receiver.readBoardDataCompleteInfo(sessionIdx);
		
		model.addAttribute("boardData", boardData);
		return "MyPage_Receiver/6readBoardDataCompleteInfo";
	}

//	@RequestMapping("/")
	
//	@RequestMapping("/")
	
//	@RequestMapping("/")

	

}
