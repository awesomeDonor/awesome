package com.teamawesome.awesomedonor.vo.session;

public class SessionData { 
	//이 SessionData가 비어있으면 로그인이 되어있지 않은 상태, 또는 비회원
	
	//-----------필드: 3--------------
	private Session_Donor session_Donor;
	private Session_Receiver session_Receiver;
	private Session_Admin session_Admin;
	private String member_identified;
	
	//-----------생성자------------
	public SessionData() {
		super();
	}

	public SessionData(Session_Donor session_Donor, Session_Receiver session_Receiver, Session_Admin session_Admin,
			String member_identified) {
		super();
		this.session_Donor = session_Donor;
		this.session_Receiver = session_Receiver;
		this.session_Admin = session_Admin;
		this.member_identified = member_identified;
	}

	public String getMember_identified() {
		return member_identified;
	}

	public void setMember_identified(String member_identified) {
		this.member_identified = member_identified;
	}

	//-----------Getter&Setter-----------
	public Session_Donor getSession_Donor() {
		return session_Donor;
	}

	public void setSession_Donor(Session_Donor session_Donor) {
		this.session_Donor = session_Donor;
	}

	public Session_Receiver getSession_Receiver() {
		return session_Receiver;
	}

	public void setSession_Receiver(Session_Receiver session_Receiver) {
		this.session_Receiver = session_Receiver;
	}

	public Session_Admin getSession_Admin() {
		return session_Admin;
	}

	public void setSession_Admin(Session_Admin session_Admin) {
		this.session_Admin = session_Admin;
	}
	
}
