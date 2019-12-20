package com.teamawesome.awesomedonor.vo.dto.qna;

public class DTO_QnA {
	
	//-----------필드: 6--------------
	private String QnA_idx;
	private String Member_Donor_idx;
	private String QnA_title;
	private String QnA_content;
	private String QnA_count;
	private String QnA_writeDate;
	
	//-----------생성자------------
	public DTO_QnA() {
		super();
	}

	public DTO_QnA(String qnA_idx, String member_Donor_idx, String qnA_title, String qnA_content, String qnA_count,
			String qnA_writeDate) {
		super();
		QnA_idx = qnA_idx;
		Member_Donor_idx = member_Donor_idx;
		QnA_title = qnA_title;
		QnA_content = qnA_content;
		QnA_count = qnA_count;
		QnA_writeDate = qnA_writeDate;
	}

	//-----------Getter&Setter-----------
	public String getQnA_idx() {
		return QnA_idx;
	}

	public void setQnA_idx(String qnA_idx) {
		QnA_idx = qnA_idx;
	}

	public String getMember_Donor_idx() {
		return Member_Donor_idx;
	}

	public void setMember_Donor_idx(String member_Donor_idx) {
		Member_Donor_idx = member_Donor_idx;
	}

	public String getQnA_title() {
		return QnA_title;
	}

	public void setQnA_title(String qnA_title) {
		QnA_title = qnA_title;
	}

	public String getQnA_content() {
		return QnA_content;
	}

	public void setQnA_content(String qnA_content) {
		QnA_content = qnA_content;
	}

	public String getQnA_count() {
		return QnA_count;
	}

	public void setQnA_count(String qnA_count) {
		QnA_count = qnA_count;
	}

	public String getQnA_writeDate() {
		return QnA_writeDate;
	}

	public void setQnA_writeDate(String qnA_writeDate) {
		QnA_writeDate = qnA_writeDate;
	}
	
	
	

}
