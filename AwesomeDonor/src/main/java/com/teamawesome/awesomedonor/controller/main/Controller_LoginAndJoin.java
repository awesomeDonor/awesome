package com.teamawesome.awesomedonor.controller.main;

import java.io.File;
import java.security.MessageDigest;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.teamawesome.awesomedonor.service.member.Service_Donor;
import com.teamawesome.awesomedonor.service.member.Service_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Member_Identification;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver_File_Upload;
import com.teamawesome.awesomedonor.vo.session.SessionData;

//로그인과 회원가입을 위한 프로세
@Controller
public class Controller_LoginAndJoin {

	@Autowired
	Service_Donor service_Donor;
	
	@Autowired
	Service_Receiver service_Receiver;
	
	@Autowired
	JavaMailSender mailSender;

	
	//------------Donor------------
	//로그인 페이지로 이동.
	@RequestMapping("/loginPage_Donor")
	public String loginPage_Donor() {
		
		return "Main/loginPage_Donor";
	}
	
	//로그인 프로세스.
	@RequestMapping("/loginProcess_Donor")
	public String loginProcess_Donor(DTO_Donor dto, HttpSession session, Model model) {
		String hashedPw = hashing(dto.getMember_Donor_pw());
		dto.setMember_Donor_pw(hashedPw);
		SessionData sessionData = service_Donor.login(dto);
		if(sessionData==null) {
			String fail = "fail";
			model.addAttribute("fail", fail);
			return "Main/loginPage_Donor";
		}
		else {
			if(sessionData.getMember_identified().equals("0")) {
				String needIdentification = "이메일 인증이 완료되지 않았습니다. 인증 후 다시 시도해주세요!";
				model.addAttribute("needIdentification", needIdentification);
				return "Main/loginPage_Donor";
			}else {
				session.setAttribute("sessionData", sessionData);
				return "redirect:myPage";
			}

		}
	}
	
	//로그아웃.
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 페이지.
	@RequestMapping("/joinPage_Donor")
	public String joinPage_Donor(){
		return "Main/joinPage_Donor";
	}
	
	//회원가입 프로세스.
	@RequestMapping("/joinProcess_Donor")
	public String joinProcess_Donor(DTO_Donor dto_Donor, String birthDate_Year, String birthDate_Month, String birthDate_Day, 
			MultipartFile file, HttpSession session) {
		//생년월일 세팅.
		String Member_Donor_birthDate = birthDate_Year+"-"+birthDate_Month+"-"+birthDate_Day;
		dto_Donor.setMember_Donor_birthDate(Member_Donor_birthDate);
		
		//비밀번호 해싱.
		String hashedPW = hashing(dto_Donor.getMember_Donor_pw());
		dto_Donor.setMember_Donor_pw(hashedPW);
				
		//아이디 해싱-인증코드를 위하여.
		String hashedIdEmail = hashing(dto_Donor.getMember_Donor_idEmail())+"D";
		
		//파일업로드.
		String uploadFilePath = "C:\\Users\\user\\Desktop\\apache-tomcat-8.5.43\\wtpwebapps\\SpringMVC\\uploadImg\\";
		DTO_Donor_File_Upload dto_Donor_File_Upload = new DTO_Donor_File_Upload();
		if(file!=null) {
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String fileName = randomName+ext; 
			File f = new File(uploadFilePath+fileName);
			try{
				file.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			String Donor_File_Upload_linkName = "./uploadImg/" + fileName;
			dto_Donor_File_Upload.setDonor_File_Upload_linkName(Donor_File_Upload_linkName);
		}
		
		//서비스를 이용해 테이블에 입력!
		service_Donor.register(dto_Donor, dto_Donor_File_Upload, hashedIdEmail);//이부분 고쳐야함. 
		ThreadEx ex = new ThreadEx(mailSender, dto_Donor.getMember_Donor_idEmail(), hashedIdEmail, dto_Donor.getMember_Donor_name());
		ex.start();
		return "Main/loginPage_Donor"; // login complete에서 고쳤음. 
	}		
	
	//------------Receiver------------
	//로그인 페이지로 이동.
	@RequestMapping("/loginPage_Receiver")
	public String loginPage_Receiver() {
		
		return "Main/loginPage_Receiver";
	}
	
	//로그인 프로세스.
	@RequestMapping("/loginProcess_Receiver")
	public String loginProcess_Receiver(DTO_Receiver dto, HttpSession session, Model model) {
		String hashedPw = hashing(dto.getMember_Receiver_pw());
		dto.setMember_Receiver_pw(hashedPw);
		SessionData sessionData = service_Receiver.login(dto);
		
		if(sessionData==null) {
			String fail = "fail";
			model.addAttribute("fail", fail);
			return "Main/loginPage_Receiver";
		}
		else {
			if(sessionData.getMember_identified().contentEquals("0")) {
				String needIdentification = "이메일 인증이 완료되지 않았습니다. 인증 후 다시 시도해주세요!";
				model.addAttribute("needIdentification", needIdentification);
				return "Main/loginPage_Receiver";
			}else {
				session.setAttribute("sessionData", sessionData);
				return "redirect:myPage";
			}
			
		}
	}

	//회원가입 페이지.
	@RequestMapping("/joinPage_Receiver")
	public String joinPage_Receiver() {
		
		return "Main/joinPage_Receiver";
	}
	
	//회원가입 프로세스.
	@RequestMapping("/joinProcess_Receiver")
	public String joinProcess_Receiver(DTO_Receiver dto_Receiver, MultipartFile file, HttpSession session) {
		String uploadFilePath = "C:\\Users\\user\\Desktop\\apache-tomcat-8.5.43\\wtpwebapps\\SpringMVC\\uploadImg\\";
		DTO_Receiver_File_Upload dto_Receiver_File_Upload = new DTO_Receiver_File_Upload();
		
		//비밀번호 해싱.
		String hashedPW = hashing(dto_Receiver.getMember_Receiver_pw());
		dto_Receiver.setMember_Receiver_pw(hashedPW);
		
		//아이디 해싱-인증코드를 위하여.
		String hashedIdEmail = hashing(dto_Receiver.getMember_Receiver_idEmail())+"R";
		
		if(file!=null) {
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String fileName = randomName+ext; 
			File f = new File(uploadFilePath+fileName);
			try{
				file.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			String Receiver_File_Upload_linkName = "./uploadImg/" + fileName;
			dto_Receiver_File_Upload.setReceiver_File_Upload_linkName(Receiver_File_Upload_linkName);
		}
		
		if(dto_Receiver.getMember_Receiver_introduction().equals("")) {
			dto_Receiver.setMember_Receiver_introduction(" ");
		}
		service_Receiver.register(dto_Receiver, dto_Receiver_File_Upload, hashedIdEmail);
		ThreadEx ex = new ThreadEx(mailSender, dto_Receiver.getMember_Receiver_idEmail(), hashedIdEmail, dto_Receiver.getMember_Receiver_name());
		ex.start();
		return "Main/loginPage_Receiver";
	}
	
	//------------Admin------------
	@RequestMapping("/identification")
	public String identification(String Member_identificationCode, Model model) {
		DTO_Member_Identification dto = service_Donor.readIdentificationCode(Member_identificationCode);
		if(dto==null) {
			String identificationFail = "인증에 실패했습니다. 인증번호를 확인해주세요";
			model.addAttribute("identificationFail", identificationFail); // 이부분 loginPage에서 추가해야함. 
			return "Main/loginPage_Donor";
		}else if(dto.getMember_Donor_idx().equals("0")) {
			service_Receiver.updateReceiver_identified(dto.getMember_Receiver_idx());
			String identificationSuccess = "이제 (관리자 승인만 끝나면) 서비스를 이용하실 수 있습니다!";
			model.addAttribute("identificationSuccess", identificationSuccess);
			return "Main/loginPage_Receiver";
		}else {
			service_Donor.updateDonor_identified(dto.getMember_Donor_idx());
			String identificationSuccess = "이제 서비스를 이용하실 수 있습니다!";
			model.addAttribute("identificationSuccess", identificationSuccess);
			return "Main/loginPage_Donor";
		}
		
	}	
	
	
	public void mailSending(String idEmail, String Member_identificationCode, String name){

	    MimeMessage message = null;
	    MimeMessageHelper messageHelper = null;
        message = mailSender.createMimeMessage();
        try {
        	 System.out.println(idEmail);
        	 messageHelper = new MimeMessageHelper(message, true, "UTF-8");
             messageHelper.setSubject("어썸도너 인증메일");
             messageHelper.setText(name+"회원님<br> 어썸 도너를 이용해주셔서 감사합니다. 회원가입을 완료하기 위해 <a href = http://localhost:8080/awesomedonor/identification?Member_identificationCode="+ Member_identificationCode+">링크</a>를 클릭해주세요!!", true);
             messageHelper.setFrom("aWEsomeDonor", "aWEsomeDonor");
             messageHelper.setTo("juju08217@daum.net"); 
             messageHelper.setTo("awesomeDonor@gmail.com");
        }catch(Exception e) {
        	e.printStackTrace();
        }
        mailSender.send(message);
	}

//	//이거 테스트해보기. 
//	@RequestMapping("/mailSending")
//	public String mailSending(String idEmail, String Member_identificationCode, String name){
//
//	    MimeMessage message = null;
//	    MimeMessageHelper messageHelper = null;
//        message = mailSender.createMimeMessage();
//        try {
//        	 messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//             messageHelper.setSubject("어썸도너 인증메일");
//             messageHelper.setText(name+"회원님<br> 어썸 도너를 이용해주셔서 감사합니다. 회원가입을 완료하기 위해 <a href = http://localhost:8080/awesomedonor/identification?Member_identificationCode="+ Member_identificationCode+">링크</a>를 클릭해주세요!!", true);
//             messageHelper.setFrom("aWEsomeDonor", "aWEsomeDonor");
//             messageHelper.setTo("juju08217@daum.net");
//        }catch(Exception e) {
//        	e.printStackTrace();
//        }
//        mailSender.send(message);
//        return "Main/loginPage_Donor";
//	}
	
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
