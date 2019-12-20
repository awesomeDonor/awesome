package com.teamawesome.awesomedonor.vo.boarddata;

import com.teamawesome.awesomedonor.vo.dto.member.DTO_Receiver;

public class BoardData_Receiver_Like {
	private DTO_Receiver dto_receiver; //관심기관.
	private int countRequest; //관심기관이 올린 물품 수. 
	
	public BoardData_Receiver_Like() {
		super();
	}

	public BoardData_Receiver_Like(DTO_Receiver dto_receiver, int countRequest) {
		super();
		this.dto_receiver = dto_receiver;
		this.countRequest = countRequest;
	}

	public DTO_Receiver getDto_receiver() {
		return dto_receiver;
	}

	public void setDto_receiver(DTO_Receiver dto_receiver) {
		this.dto_receiver = dto_receiver;
	}

	public int getCountRequest() {
		return countRequest;
	}

	public void setCountRequest(int countRequest) {
		this.countRequest = countRequest;
	}
	
}
