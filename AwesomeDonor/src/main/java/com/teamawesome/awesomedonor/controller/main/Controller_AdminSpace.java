package com.teamawesome.awesomedonor.controller.main;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.teamawesome.awesomedonor.service.member.Service_Admin;
import com.teamawesome.awesomedonor.service.member.Service_Donor;
import com.teamawesome.awesomedonor.service.member.Service_Receiver;
import com.teamawesome.awesomedonor.vo.dto.adminspace.UploadFileVo;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Admin;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_File_Upload;
import com.teamawesome.awesomedonor.vo.session.SessionData;

@Controller
public class Controller_AdminSpace {
	
	@Autowired
	Service_Admin service_Admin;
	
	@Autowired
	Service_Receiver service_Receiver;
	
	@Autowired
	Service_Donor service_Donor;
	
	@RequestMapping("/")
	public String homePage() {
		
		return "Main/homePage";
	}
	
	@RequestMapping("/myPage")
	public String myPage(HttpSession session) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		if(sessionData==null) return "Main/basic";
		if(sessionData.getSession_Donor()!=null) {
			return "MyPage_Donor/myPage_Main";
		}else if(sessionData.getSession_Receiver()!=null) {
			return "MyPage_Receiver/myPage_Main";
		}else
		return "Main/basic";
	}
	
	//홈페이지에 ajax 넣어놓기 여기서 비회원을 거르는 용도로...
	@RequestMapping("/receiverList")
	public String receiverList(Model model) {
		ArrayList<DTO_Receiver> dto = service_Receiver.readReceiverList();
		model.addAttribute("dto", dto);
		return "Main/receiverList";
	}
	
	//리시버 리스트 이름 검색 기능. 
	@RequestMapping("/searchByReceiverName")
	public String searchByReceiverName(String Member_Receiver_name, Model model) {
		ArrayList<DTO_Receiver> dto = service_Receiver.searchByReceiver_Name(Member_Receiver_name);
		model.addAttribute("dto", dto);
		return "Main/receiverList";
	}
	
	//리시버 리스트 필터
	@RequestMapping("/filterReceiverListByAll")
	public String filterReceiverListByAll(String[] Member_Receiver_AdCategory, String[] Member_Receiver_Category, Model model) {
		String Query = "";
		if(Member_Receiver_AdCategory!=null) {
			Query+="(";
			for(int i = 0; i<Member_Receiver_AdCategory.length; i++) {
				Query+= "Member_Receiver_AdCategory = '" + Member_Receiver_AdCategory[i] + "'";
				
				if(i!=Member_Receiver_AdCategory.length-1) {
					Query+=" or ";
					
				}
			}
			Query+=")";
			
			if(Member_Receiver_Category!=null) {
				Query+=" and ";
			}
		}
		
		
		if(Member_Receiver_Category!=null) {
			Query+="(";
			for(int i = 0; i<Member_Receiver_Category.length; i++) {
				Query+= "Member_Receiver_Category = '" + Member_Receiver_Category[i] + "'";
				if(i!=Member_Receiver_Category.length-1) {
					Query+=" or ";
				}
			}
			Query+=")";
			
		}
		System.out.println(Query);
		
		
		ArrayList<DTO_Receiver> dto = service_Receiver.filterByAll(Query);
		model.addAttribute("dto", dto);
		return "Main/receiverList";
	}
	
	//---------------------------
	@RequestMapping("/Admin_LoginPage")//관리자 로그인 페이지로 이동
	public String Admin_LoginPage() {
		
		return "MyPage_Admin/Admin_LoginPage";
	}
	//관리자 회원가입 페이지로 이동.
	@RequestMapping("/joinPage_Admin")
	public String joinPage_Admin() {
		
		return "MyPage_Admin/joinPage_Admin";
	}
	//관리자 회원가입 프로세스.
	@RequestMapping("/joinProcess_Admin")
	public String joinProcess_Admin(DTO_Admin dto_Admin) {

		service_Admin.joinMember(dto_Admin);

		return "MyPage_Admin/Admin_LoginPage"; // login complete에서 고쳤음. 
	}
	//관리자 로그인 프로세스
	@RequestMapping("/loginProcess_Admin")
	public String loginProcess_Admin(DTO_Admin dto, HttpSession session, Model model) {
		SessionData sessionData = service_Admin.login(dto);
		if(sessionData==null) {
			model.addAttribute("fail", "로그인에 실패했습니다!!");
			return "MyPage_Admin/Admin_LoginPage";
		}
		else {
			session.setAttribute("sessionData", sessionData);
			return "redirect:Admin_MyPage";
		}
	}
	@RequestMapping("/Admin_LoginFailPage")
	public String Admin_LoginFailPage() {
		
		return "MyPage_Admin/Admin_LoginFailPage";
	}
	//관리자 로그아웃 프로세스
	@RequestMapping("/logout_Admin")
	public String logout_Admin(HttpSession session) {
		session.invalidate();
		return "redirect:Admin_MyPage";
	}
	//관리자 마이페이지로 이동
	@RequestMapping("/Admin_MyPage")
	public String Admin_MyPage() {
		
		return "MyPage_Admin/Admin_MyPage";
	}

	//-----------------------------관리자 마이페이지에서 페이지 이동 하는거.

	//기관 관리 페이지 이동
	@RequestMapping("/Admin_ReceiverList")
	public String Admin_ReceiverList(Model model) {
		//기관 리스트 뽑기
		ArrayList<DTO_Receiver> dto = service_Receiver.readReceiverListforAmdin();
		model.addAttribute("dto", dto);
		
		return "MyPage_Admin/Admin_ReceiverList";
	}
	
	//기관 자세히보기 창 들어가면서.
	@RequestMapping("/Admin_Receiver_CloserLook")
	public String Admin_Receiver_CloserLook(String Member_Receiver_idx, Model model) {
		System.out.println("SDFSF" + Member_Receiver_idx);
		DTO_Receiver boardData = 
		service_Receiver.readPrivateDataByIdx(Member_Receiver_idx);	//리시버_맾퍼에 DTO_Receiver selectByIdx로 뽑고 표시만 다른것들로??
		model.addAttribute("boardData",boardData);
		
		DTO_Receiver_File_Upload boardData2 = 
				service_Receiver.readFile_Upload_idx(Member_Receiver_idx);
		
		model.addAttribute("boardData2",boardData2);
		
		return "MyPage_Admin/Admin_Receiver_CloserLook";	
	}
	
	//승인
	@RequestMapping("/ReceiverIdentifiedAction")
	public String updateReceiver_identified(String Member_Receiver_idx) {
		System.out.println(Member_Receiver_idx);
		
		service_Receiver.updateReceiver_identifiedforAdmin(Member_Receiver_idx);
		
		return "redirect:Admin_ReceiverList";	
	}
	
	//기관 아이디 삭제
	@RequestMapping("/ReceiverRemovedAction")
	public String ReceiverRemovedAction(String Member_Receiver_idx) {
		System.out.println(Member_Receiver_idx);
	
		service_Receiver.updateReceiver_Removed(Member_Receiver_idx);
		
		return "redirect:Admin_ReceiverList";	
	}
	//기관 아이디 복원
	@RequestMapping("ReceiverRemovedBackAction")
	public String ReceiverRemovedBackAction(String Member_Receiver_idx) {
		System.out.println(Member_Receiver_idx);
		
		service_Receiver.updateReceiver_RemovedBack(Member_Receiver_idx);
		
		return "redirect:Admin_ReceiverList";
	}
	
	//----------------현지님이 하신 것--------------------
	@RequestMapping("/updateBannerAction")
	public String updateBannerAction(MultipartFile file, String f_idx, Model model) {	
		
	//파일 저장 로직 시작..
	ArrayList<UploadFileVo> fileList = new ArrayList<UploadFileVo>();
	
	
	//주소를 서버쪽으로 바꿔야함...
	String uploadFilePath = "/Users/hyeonji/Desktop/Tomcat/apache-tomcat-8.5.45/wtpwebapps/AwesomeDonor/resources/";
	

		if(file != null) {
		
		System.out.println("이미지 저장완료..");
		String originalFilename = file.getOriginalFilename();
		
		//파일명 바꾸기....(시간,랜덤 값)
		String randomName = UUID.randomUUID().toString();
		System.out.println(randomName);
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		
		randomName += ext;
		
		File f = new File(uploadFilePath+randomName);
		
		try{
			file.transferTo(f);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String link = "./resources/" + randomName;
		
		UploadFileVo fileVo = 
				new UploadFileVo(f_idx,link);
		
		//contentService.writeContent(param,fileList);
		
		fileList.add(fileVo);
		
		}
		
		service_Admin.updateBanner(fileList);

		return "redirect:homePage?f_idx="+f_idx;
	}
	
	@RequestMapping("/homePage")
	public String homePage(Model model, String f_idx) {
		if(f_idx != null) {
		
		int idx = Integer.parseInt(f_idx);
		if(idx==1) {
			UploadFileVo uploadFileVo = service_Admin.readFile(idx);	
			model.addAttribute("uploadFileVo"+idx,uploadFileVo);
			
			UploadFileVo uploadFileVo2= service_Admin.readFile(2);
			UploadFileVo uploadFileVo3 = service_Admin.readFile(3);
			
			model.addAttribute("uploadFileVo2", uploadFileVo2);
			model.addAttribute("uploadFileVo3", uploadFileVo3);
		}else if(idx==2) {
			UploadFileVo uploadFileVo = service_Admin.readFile(idx);
			model.addAttribute("uploadFileVo"+idx,uploadFileVo);
			
			UploadFileVo uploadFileVo1 = service_Admin.readFile(1);
			UploadFileVo uploadFileVo3 = service_Admin.readFile(3);
			
			model.addAttribute("uploadFileVo1", uploadFileVo1);
			model.addAttribute("uploadFileVo3", uploadFileVo3);
			
		}else {
			UploadFileVo uploadFileVo = service_Admin.readFile(idx);	
			model.addAttribute("uploadFileVo"+idx,uploadFileVo);
			
			UploadFileVo uploadFileVo1 = service_Admin.readFile(1);
			UploadFileVo uploadFileVo2= service_Admin.readFile(2);
			
			model.addAttribute("uploadFileVo1", uploadFileVo1);
			model.addAttribute("uploadFileVo2", uploadFileVo2);
	
		    }
		}else {
		
		UploadFileVo uploadFileVo1 = service_Admin.readFile(1);
		UploadFileVo uploadFileVo2= service_Admin.readFile(2);
		UploadFileVo uploadFileVo3 = service_Admin.readFile(3);
		
		model.addAttribute("uploadFileVo1", uploadFileVo1);
		model.addAttribute("uploadFileVo2", uploadFileVo2);
		model.addAttribute("uploadFileVo3", uploadFileVo3);
		
		System.out.println(f_idx); 
		}
		
		return "Main/homePage";
	}
	
	//배너 관리 페이지.
	@RequestMapping("/managingBanner_Page")
	public String managingBanner_Page() {			
	return "MyPage_Admin/managingBanner_Page";
	}
	
	//후원자 관리 페이지 이동
	@RequestMapping("/Admin_DonorList")
	public String Admin_DonorList(Model model) {
		
		//후원자 리스트 끌어오기
		ArrayList<DTO_Donor> dto = service_Donor.readDonorList();
		model.addAttribute("dto", dto);
		
		return "MyPage_Admin/Admin_DonorList";
	}
	
	//후원자  관리-----------------------
	//승인...
	@RequestMapping("/DonorIdentifiedAction")
	public String updateDonor_identified(String Member_Donor_idx) {
		System.out.println(Member_Donor_idx);
		
		service_Donor.updateDonor_identified(Member_Donor_idx);
		
		return "redirect:Admin_DonorList";	
	}
	//후원자  아이디 삭제..
	@RequestMapping("/DonorRemovedAction")
	public String DonorRemovedAction(String Member_Donor_idx) {
		System.out.println(Member_Donor_idx);
	
		service_Donor.updateDonor_Removed(Member_Donor_idx);
		
		return "redirect:Admin_DonorList";	
	}
	//후원자  아이디 복원..
	@RequestMapping("DonorRemovedBackAction")
	public String DonorRemovedBackAction(String Member_Donor_idx) {
		System.out.println(Member_Donor_idx);
		
		service_Donor.updateDonor_RemovedBack(Member_Donor_idx);
		
		return "redirect:Admin_DonorList";
	}

}
