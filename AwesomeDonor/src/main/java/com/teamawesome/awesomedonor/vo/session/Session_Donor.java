package com.teamawesome.awesomedonor.vo.session;

public class Session_Donor {
	
	//-----------필드: 2--------------
	private String sessionIdx;
	private String sessionNick;
	
	//-----------생성자------------
	public Session_Donor() {
		super();
	}
	
	public Session_Donor(String sessionIdx, String sessionNick) {
		super();
		this.sessionIdx = sessionIdx;
		this.sessionNick = sessionNick;
	}

	//-----------Getter&Setter-----------
	public String getSessionIdx() {
		return sessionIdx;
	}

	public void setSessionIdx(String sessionIdx) {
		this.sessionIdx = sessionIdx;
	}

	public String getSessionNick() {
		return sessionNick;
	}

	public void setSessionNick(String sessionNick) {
		this.sessionNick = sessionNick;
	}

}
