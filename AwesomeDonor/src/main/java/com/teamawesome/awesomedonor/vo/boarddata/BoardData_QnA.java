package com.teamawesome.awesomedonor.vo.boarddata;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;

public class BoardData_QnA {
	
	private DTO_Donor dto_Donor;
	private DTO_QnA dto_QnA;
	private DTO_QnA_Comment dto_QnA_Comment;
	
	public BoardData_QnA() {
		super();
	}

	public BoardData_QnA(DTO_Donor dto_Donor, DTO_QnA dto_QnA, DTO_QnA_Comment dto_QnA_Comment) {
		super();
		this.dto_Donor = dto_Donor;
		this.dto_QnA = dto_QnA;
		this.dto_QnA_Comment = dto_QnA_Comment;
	}

	public DTO_Donor getDto_Donor() {
		return dto_Donor;
	}

	public void setDto_Donor(DTO_Donor dto_Donor) {
		this.dto_Donor = dto_Donor;
	}

	public DTO_QnA getDto_QnA() {
		return dto_QnA;
	}

	public void setDto_QnA(DTO_QnA dto_QnA) {
		this.dto_QnA = dto_QnA;
	}

	public DTO_QnA_Comment getDto_QnA_Comment() {
		return dto_QnA_Comment;
	}

	public void setDto_QnA_Comment(DTO_QnA_Comment dto_QnA_Comment) {
		this.dto_QnA_Comment = dto_QnA_Comment;
	}
	

}
