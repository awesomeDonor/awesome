package com.teamawesome.awesomedonor.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.teamawesome.awesomedonor.service.donation.Service_Donation_Action_Donor;
import com.teamawesome.awesomedonor.service.donation.Service_Donation_Request;
import com.teamawesome.awesomedonor.service.donation.Service_Donation_Selection;
import com.teamawesome.awesomedonor.service.member.Service_Donor;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Donor;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Request;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Selection;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Receiver_Like;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;
import com.teamawesome.awesomedonor.vo.session.SessionData;
import com.teamawesome.awesomedonor.vo.session.Session_Donor;

@Controller
public class Controller_MyPage_Donor {

	@Autowired
	Service_Donation_Action_Donor serviceDonationActionDonor;
	
	@Autowired
	Service_Donor serviceDonor;
	
	@Autowired
	Service_Donation_Request serviceDonationRequest;
	
	@Autowired
	Service_Donation_Selection serviceDonationSelection;
	
	//마이페이지
	@RequestMapping("/donorMypage")
	public String donor_myPage_page(Model model, HttpSession session) {
		//model에는 like와 관련된 것을 보내 줄것
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		ArrayList<BoardData_Receiver_Like> boardData = 
				serviceDonationActionDonor.selectReceiverLike(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData",boardData);
		return "donorMypage";
	}
	
	//개인정보 관리
	@RequestMapping("/personalInfo")
	public String donor_myPage_personalInfo_page() {	
		return "MyPage_Donor/personalInfo";
	}
	
	//개인정보 관리의 비밀번호 확인, 개인정보 관리 창에서 입력을 누르면 pw가 오도록
	//아직 비밀번호 확인 실패시 구현 안함
	@RequestMapping("/checkPassword") // 이거 원상복구 해놓기...
	public String donor_myPage_personalInfo_confirm_process(String pw, HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		DTO_Donor dto_Donor = serviceDonor.readPrivateData(session_Donor.getSession_Donor().getSessionIdx());
		if(dto_Donor.getMember_Donor_pw().equals(pw)) {
			return donor_myPage_personalInfo_detail_page(session, model);
		}else {
			return "MyPage_Donor/personalInfo"; // 비밀번호 확인 실패시 일단 현재 페이지 
		}
	}

	//개인정보 관리의 개인정보 확인 페이지
	@RequestMapping("/personalInfoDetail")
	public String donor_myPage_personalInfo_detail_page(HttpSession session, Model model) {
		//String Member_Donor_idx = session_Donor.getSession_Donor().getSessionIdx()
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		DTO_Donor boardData = serviceDonor.readPrivateData(session_Donor.getSession_Donor().getSessionIdx()); 
		DTO_Donor_File_Upload file = serviceDonor.readFile(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("file", file);  
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/personalInfoDetail";
	}
	
	//개인정보 수정 페이지
	//개인정보 확인 페이지에서 회원정보 수정을 누르면 나오는 페이지 
	@RequestMapping("/personalInfoUpdate")
	public String donor_myPage_personalInfo_update_page(HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		DTO_Donor boardData = serviceDonor.readPrivateData(session_Donor.getSession_Donor().getSessionIdx()); 
		model.addAttribute("boardData", boardData);
		return"MyPage_Donor/personalInfoUpdate";
	}
	
	//사진 업데이트 11.2 수정
	@RequestMapping("/personalFileUpdate")
	public void personalFileUpdate(MultipartFile file, HttpSession session) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		String Member_Donor_idx = session_Donor.getSession_Donor().getSessionIdx();
		
		String uploadFilePath = "C:\\Users\\user\\Desktop\\apache-tomcat-8.5.43\\wtpwebapps\\SpringMVC\\uploadImg\\";
		DTO_Donor_File_Upload dto_Donor_File_Upload = new DTO_Donor_File_Upload();
		
		if(file != null) {
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String fileName = randomName+ext; 
			
			File f = new File(uploadFilePath+fileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String Donor_File_Upload_linkName = "./uploadImg/" + fileName;
			dto_Donor_File_Upload.setDonor_File_Upload_linkName(Donor_File_Upload_linkName);
			dto_Donor_File_Upload = new DTO_Donor_File_Upload(null, Member_Donor_idx, Donor_File_Upload_linkName);
		}
		serviceDonor.updateDonorFile(dto_Donor_File_Upload);
	}
	
//	//수정을 누르면 나오는 프로세스
//	//수정 완료 누르면 개인정보 확인 페이지로 이동
	@RequestMapping("/personalInfoUpdateProcess")
	public String donor_myPage_personalInfo_update_process(DTO_Donor dtoDonor,HttpSession session, Model model) {
		DTO_Donor boardData = serviceDonor.updatePrivateData(dtoDonor);
		model.addAttribute("boardData", boardData);
		return donor_myPage_personalInfo_detail_page(session, model);
	}
	
	//수정 취소 누르면 나오는 프로세스
	//취소 누르면 개인정보 확인 페이지로 이동
	@RequestMapping("/personalInfoUpdateCancelProcess")
	public String donor_myPage_personalInfo_update_cancel_process(HttpSession session, Model model) {
		return donor_myPage_personalInfo_detail_page(session, model);
	}
	
	//관심기관
	@RequestMapping("/likeReceiverPage")
	public String donor_myPage_like_Receiver_Page(HttpSession session, Model model) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");  
		ArrayList<BoardData_Receiver_Like> boardData = 
				serviceDonationActionDonor.selectReceiverLike(sessionData.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);	
		return "MyPage_Donor/likeReceiverPage";
	}
	
	//11.9 관심기관 이름 클릭하면 나오는 필요해요 게시판
	@RequestMapping("/goRequest")
	public String goRequest(String member_Receiver_name, Model model ) {
		System.out.println(member_Receiver_name);
		ArrayList<BoardData_Donation_Request> boardData = serviceDonor.goRequest(member_Receiver_name);
		model.addAttribute("boardData", boardData);
		return "Donation_Request/request_MainPage";
	}
	
	//장바구니 
	@RequestMapping("/selectionPage")
	public String selection_Page(HttpSession session, Model model) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		//필요해요에서 선택한 후원 항목	= selectionBoardData
		ArrayList<BoardData_Donation_Selection> selectionBoardData = 
				serviceDonationSelection.readSelection_List(sessionData.getSession_Donor().getSessionIdx());
		model.addAttribute("selectionBoardData", selectionBoardData);
		//후원 예약 신청 항목 = boardData		
		ArrayList<BoardData_Donation_Action_Donor> boardData = 
				serviceDonationActionDonor.selectApproval_yet(sessionData.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/selectionPage";
	}
	

	//장바구니에서 후원예약 신청을 누를시 
	@RequestMapping("/selectionProcess")
	public String selection_Process(HttpSession session, String[] Donation_Request_idx, String[] Donation_Action_contactNumber, 
			String[] Donation_Action_meetingDate) {
		
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		if(Donation_Request_idx!=null) {
			for(int i = 0; i<Donation_Request_idx.length; i++) {
				BoardData_Donation_Request boardData = serviceDonationRequest.readARequest(Donation_Request_idx[i]);
				DTO_Donation_Action dto = new DTO_Donation_Action();
				dto.setDonation_Request_idx(Donation_Request_idx[i]);
				dto.setMember_Donor_idx(sessionData.getSession_Donor().getSessionIdx());
				dto.setMember_Receiver_idx(boardData.getDto_Receiver().getMember_Receiver_idx());
				dto.setDonation_Action_contactNumber(Donation_Action_contactNumber[i]);
				dto.setDonation_Action_meetingDate(Donation_Action_meetingDate[i]);
				serviceDonationActionDonor.registerAction(dto);
				serviceDonationSelection.updateDecided(dto);
			}
		}
		
		return "redirect:selectionPage";
	}
	
	
	//10.27 추가. 
	@RequestMapping("/selectionDelete")
	public String selectionDelete(HttpSession session, String Donation_Request_idx) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		System.out.println(Donation_Request_idx);
		DTO_Donation_Selection dto = new DTO_Donation_Selection();
		dto.setDonation_Request_idx(Donation_Request_idx);
		dto.setMember_Donor_idx(sessionData.getSession_Donor().getSessionIdx());
		serviceDonationSelection.delete(dto);
		return "redirect:selectionPage";
	}
	
	
	
	//후원 내역
	@RequestMapping("/donationLog")
	public String donationLog_page(HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		ArrayList<BoardData_Donation_Action_Donor> boardData =
				serviceDonationActionDonor.selectApproval(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/donationLog";
	}
	
	//후원내역에서 기관명 누를시
	@RequestMapping("/donationLogsortName")
	public String donationLog_sortName_page(HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		ArrayList<BoardData_Donation_Action_Donor> boardData =
				serviceDonationActionDonor.sortDonation_ProcessByName(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/donationLog";
	}
	
	//후원내역에서 후원예정일 누를시
	@RequestMapping("/donationLogsortDate")
	public String donationLog_sortDate(HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		ArrayList<BoardData_Donation_Action_Donor> boardData =
				serviceDonationActionDonor.sortDonation_ProcessByDate(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/donationLog";
	}
	
	//완료된 후원
	@RequestMapping("/donationlogComplete")
	public String donationLog_complete(HttpSession session, Model model) {
		SessionData session_Donor = (SessionData)session.getAttribute("sessionData");
		ArrayList<BoardData_Donation_Action_Donor> boardData =
				serviceDonationActionDonor.selectDonation_completed(session_Donor.getSession_Donor().getSessionIdx());
		model.addAttribute("boardData", boardData);
		return "MyPage_Donor/donationlogComplete";
	}
	
}