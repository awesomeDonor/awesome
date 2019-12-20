package com.teamawesome.awesomedonor.vo.boarddata;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;

public class BoardData_Donation_Action_Receiver {

	// -----------필드: 3--------------
	private DTO_Donation_Action dto_Donation_Action;
	private DTO_Donation_Request dto_Donation_Request;
	private DTO_Donor dto_Donor;
	private int countDonation;
	private int countEvaluation;

	// -----------생성자------------
	public BoardData_Donation_Action_Receiver() {
		super();
	}

	public BoardData_Donation_Action_Receiver(DTO_Donation_Action dto_Donation_Action,
			DTO_Donation_Request dto_Donation_Request, DTO_Donor dto_Donor, int countDonation, int countEvaluation) {
		super();
		this.dto_Donation_Action = dto_Donation_Action;
		this.dto_Donation_Request = dto_Donation_Request;
		this.dto_Donor = dto_Donor;
		this.countDonation = countDonation;
		this.countEvaluation = countEvaluation;
	}


	// -----------Getter&Setter-----------
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

	public DTO_Donor getDto_Donor() {
		return dto_Donor;
	}

	public void setDto_Donor(DTO_Donor dto_Donor) {
		this.dto_Donor = dto_Donor;
	}

	public int getCountDonation() {
		return countDonation;
	}

	public void setCountDonation(int countDonation) {
		this.countDonation = countDonation;
	}

	public int getCountEvaluation() {
		return countEvaluation;
	}

	public void setCountEvaluation(int countEvaluation) {
		this.countEvaluation = countEvaluation;
	}
	

}
