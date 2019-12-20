package com.teamawesome.awesomedonor.controller.main;

import java.security.MessageDigest;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


public class ThreadEx extends Thread{
	
	
	JavaMailSender mailSender;
	
	
	
	private String idEmail = "";
	private String Member_identificationCode = "";
	private String name = "";
	
	public ThreadEx(JavaMailSender mailSender, String idEmail, String member_identificationCode, String name) {
		super();
		this.mailSender = mailSender;
		this.idEmail = idEmail;
		Member_identificationCode = member_identificationCode;
		this.name = name;
	}

	public void run() {
		
		 	MimeMessage message = null;
		    MimeMessageHelper messageHelper = null;
	        message = mailSender.createMimeMessage();
	        try {
	        	 messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	             messageHelper.setSubject("어썸도너 인증메일");
	             messageHelper.setText(name+"회원님<br> 어썸 도너를 이용해주셔서 감사합니다. 회원가입을 완료하기 위해 <a href = 54.180.83.209/awesomedonor/identification?Member_identificationCode="+ Member_identificationCode+">링크</a>를 클릭해주세요!!", true);
	             messageHelper.setFrom("aWEsomeDonor", "aWEsomeDonor");
	             System.out.println(idEmail);
	             messageHelper.setTo("awesomeDonor@gmail.com");
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        mailSender.send(message);
	        
	        message = mailSender.createMimeMessage();
	        try {
	        	 messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	             messageHelper.setSubject("어썸도너 인증메일");
	             messageHelper.setText(name+"회원님<br> 어썸 도너를 이용해주셔서 감사합니다. 회원가입을 완료하기 위해 <a href = 54.180.83.209/identification?Member_identificationCode="+ Member_identificationCode+">링크</a>를 클릭해주세요!!", true);
	             messageHelper.setFrom("aWEsomeDonor", "aWEsomeDonor");
	             System.out.println(idEmail);
	             messageHelper.setTo("juju08217@daum.net");
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        mailSender.send(message);
	        
	        message = mailSender.createMimeMessage();
	        try {
	        	 messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	             messageHelper.setSubject("어썸도너 인증메일");
	             messageHelper.setText(name+"회원님<br> 어썸 도너를 이용해주셔서 감사합니다. 회원가입을 완료하기 위해 <a href = 54.180.83.209/identification?Member_identificationCode="+ Member_identificationCode+">링크</a>를 클릭해주세요!!", true);
	             messageHelper.setFrom("aWEsomeDonor", "aWEsomeDonor");
	             System.out.println(idEmail);
	             messageHelper.setTo(idEmail);
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        mailSender.send(message);
	}

	public void mailSending(String idEmail, String Member_identificationCode, String name){

	   
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
