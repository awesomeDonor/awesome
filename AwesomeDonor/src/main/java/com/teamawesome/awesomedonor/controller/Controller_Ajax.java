package com.teamawesome.awesomedonor.controller;

import java.security.MessageDigest;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Selection;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Donor;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver_Like;
import com.teamawesome.awesomedonor.service.member.Service_Donor;
import com.teamawesome.awesomedonor.service.member.Service_Receiver;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Selection;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_Like;
import com.teamawesome.awesomedonor.vo.session.SessionData;

@Controller
@ResponseBody
public class Controller_Ajax {
	
	@Autowired
	Service_Donor service_Donor;
	
	@Autowired
	Mapper_Donor mapper_Donor;
	
	@Autowired
	Service_Receiver service_Receiver;
	
	@Autowired
	Mapper_Receiver mapper_Receiver;
	
	@Autowired
	Mapper_Donation_Selection mapper_Selection;
	
	@Autowired
	Mapper_Receiver_Like mapper_Receiver_Like;
	
	@RequestMapping("/confirm_idEmail_Donor")
	public boolean confirm_idEmail_Donor(String Member_Donor_idEmail) {
		if(mapper_Donor.selectByIdEmail(Member_Donor_idEmail)==null) {
			return true;//사용 가능.
		}else {
			return false;//사용 불가능.
		}
		
	}
	
	@RequestMapping("/confirm_idEmail_Receiver")
	public boolean confirm_idEmail_Receiver(String Member_Receiver_idEmail) {
		if(mapper_Receiver.selectByIdEmail(Member_Receiver_idEmail)==null) {
			return true;//사용 가능.
		}else {
			return false;//사용 불가능.
		}
		
	}
	
	@RequestMapping("/selectRequest")
	public boolean selectRequest(String Donation_Request_idx, HttpSession session) {
		SessionData sessionData = (SessionData)session.getAttribute("sessionData");
		String Member_Donor_idx = sessionData.getSession_Donor().getSessionIdx();
		System.out.println(Member_Donor_idx);
		ArrayList<DTO_Donation_Selection> dto_SelectoinList = mapper_Selection.selectAll(Member_Donor_idx);
		System.out.println(Member_Donor_idx);
		System.out.println(Donation_Request_idx);
		boolean token = true;
		if(dto_SelectoinList!=null) {
			for(DTO_Donation_Selection dto : dto_SelectoinList) {
				if(dto.getDonation_Request_idx().equals(Donation_Request_idx)) {
					token = false;
					break;
				}
			}
		}
		
		if(token) {
			DTO_Donation_Selection dto_Selection = new DTO_Donation_Selection();
			dto_Selection.setMember_Donor_idx(Member_Donor_idx);
			dto_Selection.setDonation_Request_idx(Donation_Request_idx);
			mapper_Selection.insert(dto_Selection);
			return true;//존재하지 않는 request, insert 완료!!
		}else {
			return false;//존재하는 request. insert 불가!!.
		}
		
	}
	
	@RequestMapping("/registerReceiverLike")
	public boolean registerReceiverLike(String Member_Receiver_idx, String Member_Donor_idx) {
		System.out.println(Member_Receiver_idx);
		ArrayList<String> receiver_idx_List = mapper_Receiver_Like.selectLikedReceiver_Idx(Member_Donor_idx);
		System.out.println(Member_Donor_idx);
		boolean token = true;
		if(receiver_idx_List!=null) {
			for(String receiver_idx: receiver_idx_List) {
				if(Member_Receiver_idx.equals(receiver_idx)) {
					token = false;
					break;
				}
			}
		}
		
		if(token) {
			DTO_Receiver_Like dto = new DTO_Receiver_Like();
			dto.setMember_Donor_idx(Member_Donor_idx);
			dto.setMember_Receiver_idx(Member_Receiver_idx);
			mapper_Receiver_Like.insert(dto);
			return true;//존재하지 않는 request, insert 완료!!
		}else {
			return false;//존재하는 request. insert 불가!!.
		}
		
	}
	
	@RequestMapping("/pwcheck_Receiver")
	public boolean pwcheck_Receiver(String Member_Receiver_pw, String Member_Receiver_idx) {
		DTO_Receiver dto = mapper_Receiver.selectByIdx(Member_Receiver_idx);
		String hashedPw = hashing(Member_Receiver_pw);
		if(dto.getMember_Receiver_pw().equals(hashedPw)) {
			return true;//패스워드 일치!
		}else {
			return false;//패스워드 불일치!
		}
		
	}
	
	//11.2추가 Donor/pesonalInfo.jsp
	@RequestMapping("/formCompletion") //선생님한테 물어봐야 함
	public boolean formCompletion(boolean Member_Donor_advertiseAgreed) {
		System.out.println(Member_Donor_advertiseAgreed);
		if(Member_Donor_advertiseAgreed == true) {
			return true; //체크 값이 들어오면
		}else {
			return false; //들어오지 않으면
		}
		
	}
	
	
	//11.2추가 찜하기 취소 Donor/likeReceiverPage
	@RequestMapping("/cancealLike")
	public boolean cancealLike(HttpSession session, String Member_Receiver_idx) {
			System.out.println("=========================="+Member_Receiver_idx+"===============");
			if(Integer.parseInt(Member_Receiver_idx) >0) { //Member_Receiver_idx 가 존재 할때
				SessionData sessionData = (SessionData)session.getAttribute("sessionData");
				String Member_Donor_idx = sessionData.getSession_Donor().getSessionIdx();
				mapper_Receiver_Like.delete(Member_Donor_idx, Member_Receiver_idx); //그 기관 삭제
				System.out.println("true");
				return true;	
			}else {
				//Member_Receiver_idx가 0보다 작을때 = 지워졌을때
				System.out.println("false");
				return false;
			}
	}
	
	@RequestMapping("/pwcheck_Donor")
	public boolean pwcheck_Donor(String Member_Donor_pw, String Member_Donor_idx) {
		DTO_Donor dto = mapper_Donor.selectByIdx(Member_Donor_idx);
		
		System.out.println(Member_Donor_pw);
		System.out.println(Member_Donor_idx);
		System.out.println(dto.getMember_Donor_pw());
		String hashedPw = hashing(Member_Donor_pw);
		if(dto.getMember_Donor_pw().equals(hashedPw)) {
			return true;//패스워드 일치!
		}else {
			return false;//패스워드 불일치!
		}
		
	}

	public static String hashing(String idOrPw) {
		String hashCode = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");

			messageDigest.reset();
			messageDigest.update(idOrPw.getBytes("UTF-8"));

			byte[] chars = messageDigest.digest();

			for (int i = 0; i < chars.length; i++) {
				String tmp = Integer.toHexString(0xff & chars[i]);
				if (tmp.length() == 1)
					sb.append("0");
				sb.append(tmp);
			}

			hashCode = sb.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hashCode;
	}
	


}
