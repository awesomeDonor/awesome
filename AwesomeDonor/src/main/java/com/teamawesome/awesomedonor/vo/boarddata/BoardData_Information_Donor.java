package com.teamawesome.awesomedonor.vo.boarddata;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_File_Upload;

public class BoardData_Information_Donor {
	//유저 정보 게시용 BoardData.
	//-----------필드: 5--------------
	private DTO_Donor dto_Donor;
	private DTO_Donation_Action dto_Donation_Action;
	private DTO_Donor_File_Upload dto_Donor_File_Upload;
	private ArrayList<DTO_Donor_Evaluation> donor_Evaluation;
	private String donor_StarNumber_AVG;  
	private int awesomeIndex;
	private int countEvaluation;
	
	//-----------생성자------------	
	public BoardData_Information_Donor() {
		super();
	}

	public BoardData_Information_Donor(DTO_Donor dto_Donor, DTO_Donation_Action dto_Donation_Action,
			DTO_Donor_File_Upload dto_Donor_File_Upload, ArrayList<DTO_Donor_Evaluation> donor_Evaluation,
			String donor_StarNumber_AVG, int awesomeIndex, int countEvaluation) {
		super();
		this.dto_Donor = dto_Donor;
		this.dto_Donation_Action = dto_Donation_Action;
		this.dto_Donor_File_Upload = dto_Donor_File_Upload;
		this.donor_Evaluation = donor_Evaluation;
		this.donor_StarNumber_AVG = donor_StarNumber_AVG;
		this.awesomeIndex = awesomeIndex;
		this.countEvaluation = countEvaluation;
	}

	//-----------Getter&Setter-----------
	public DTO_Donor getDto_Donor() {
		return dto_Donor;
	}

	public void setDto_Donor(DTO_Donor dto_Donor) {
		this.dto_Donor = dto_Donor;
	}
	
	public DTO_Donation_Action getDto_Donation_Action() {
		return dto_Donation_Action;
	}

	public void setDto_Donation_Action(DTO_Donation_Action dto_Donation_Action) {
		this.dto_Donation_Action = dto_Donation_Action;
	}

	public DTO_Donor_File_Upload getDto_Donor_File_Upload() {
		return dto_Donor_File_Upload;
	}

	public void setDto_Donor_File_Upload(DTO_Donor_File_Upload dto_Donor_File_Upload) {
		this.dto_Donor_File_Upload = dto_Donor_File_Upload;
	}

	public ArrayList<DTO_Donor_Evaluation> getDonor_Evaluation() {
		return donor_Evaluation;
	}

	public void setDonor_Evaluation(ArrayList<DTO_Donor_Evaluation> donor_Evaluation) {
		this.donor_Evaluation = donor_Evaluation;
	}

	public String getDonor_StarNumber_AVG() {
		return donor_StarNumber_AVG;
	}

	public void setDonor_StarNumber_AVG(String donor_StarNumber_AVG) {
		this.donor_StarNumber_AVG = donor_StarNumber_AVG;
	}

	public int getAwesomeIndex() {
		return awesomeIndex;
	}

	public void setAwesomeIndex(int awesomeIndex) {
		this.awesomeIndex = awesomeIndex;
	}


	public int getCountEvaluation() {
		return countEvaluation;
	}


	public void setCountEvaluation(int countEvaluation) {
		this.countEvaluation = countEvaluation;
	}

}
