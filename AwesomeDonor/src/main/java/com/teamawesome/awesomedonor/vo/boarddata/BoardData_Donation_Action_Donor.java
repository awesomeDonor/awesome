package com.teamawesome.awesomedonor.vo.boarddata;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

public class BoardData_Donation_Action_Donor {
	
	//-----------필드: 3--------------
	private DTO_Donation_Action dto_Donation_Action;
	private DTO_Donation_Request dto_Donation_Request;
	private DTO_Receiver dto_Receiver;
	
	//-----------생성자------------
	public BoardData_Donation_Action_Donor() {
		super();
	}

	public BoardData_Donation_Action_Donor(DTO_Donation_Action dto_Donation_Action,
			DTO_Donation_Request dto_Donation_Request, DTO_Receiver dto_Receiver) {
		super();
		this.dto_Donation_Action = dto_Donation_Action;
		this.dto_Donation_Request = dto_Donation_Request;
		this.dto_Receiver = dto_Receiver;
	}

	//-----------Getter&Setter-----------
	public DTO_Donation_Action getDto_Donation_Action() {
		return dto_Donation_Action;
	}

	public void setDto_Donation_Action(DTO_Donation_Action dto_Donation_Action) {
		this.dto_Donation_Action = dto_Donation_Action;
	}

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
