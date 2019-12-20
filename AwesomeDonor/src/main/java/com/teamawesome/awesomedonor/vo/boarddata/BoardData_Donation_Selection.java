package com.teamawesome.awesomedonor.vo.boarddata;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

public class BoardData_Donation_Selection {
	
	//-----------필드: 2--------------
	private DTO_Donation_Request dto_Donation_Request;
	private DTO_Receiver dto_Receiver;
	
	//-----------생성자------------
	public BoardData_Donation_Selection() {
		super();
	}

	public BoardData_Donation_Selection(DTO_Donation_Request dto_Donation_Request, DTO_Receiver dto_Receiver) {
		super();
		this.dto_Donation_Request = dto_Donation_Request;
		this.dto_Receiver = dto_Receiver;
	}

	//-----------Getter&Setter-----------
	public DTO_Donation_Request getDto_Donation_Request() {
		return dto_Donation_Request;
	}

	public void setDto_Donation_Request(DTO_Donation_Request dto_Donation_Request) {
		this.dto_Donation_Request = dto_Donation_Request;
	}

	public DTO_Receiver getDto_Receiver() {
		return dto_Receiver;
	}

	public void setDto_Receiver(DTO_Receiver dto_Receiver) {
		this.dto_Receiver = dto_Receiver;
	}

}
