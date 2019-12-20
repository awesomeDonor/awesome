package com.teamawesome.awesomedonor.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller_Introduce {

	
	@RequestMapping("/introduce_introduce")//사이트 소개_사이트 소개 페이지로 이동...
	public String Introduce_Introduce() {
		
		return "Main/introduce_introduce";
	}
	
	@RequestMapping("/introduce_FAQ")//사이트 소개_FAQ 페이지로 이동...
	public String Introduce_FAQ() {
		
		return "Main/introduce_FAQ";
	}
	
}
