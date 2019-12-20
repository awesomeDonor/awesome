package com.teamawesome.awesomedonor.vo.session;

public class Session_Receiver {
	
	//-----------필드: 2--------------
	private String sessionIdx;
	private String sessionName;
	
	//-----------생성자------------
	public Session_Receiver() {
		super();
	}

	public Session_Receiver(String sessionIdx, String sessionName) {
		super();
		this.sessionIdx = sessionIdx;
		this.sessionName = sessionName;
	}

	//-----------Getter&Setter-----------
	public String getSessionIdx() {
		return sessionIdx;
	}

	public void setSessionIdx(String sessionIdx) {
		this.sessionIdx = sessionIdx;
	}

	public String getSessionName() {
		return sessionName;
	}

	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}

}
