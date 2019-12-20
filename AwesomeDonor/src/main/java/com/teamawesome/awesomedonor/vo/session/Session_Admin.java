package com.teamawesome.awesomedonor.vo.session;

public class Session_Admin {

	private String sessionIdx;
	private String sessionName;
	
	public Session_Admin() {
		super();
	}
	
	public Session_Admin(String sessionIdx, String sessionName) {
		super();
		this.sessionIdx = sessionIdx;
		this.sessionName = sessionName;
	}

	
	//-----
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
