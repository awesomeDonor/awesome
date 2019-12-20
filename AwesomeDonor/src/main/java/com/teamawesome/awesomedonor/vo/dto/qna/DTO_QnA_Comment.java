package com.teamawesome.awesomedonor.vo.dto.qna;

public class DTO_QnA_Comment {
	
	//-----------필드: 4--------------
	private String QnA_Comment_idx;
	private String QnA_idx;
	private String QnA_Comment_content;
	private String QnA_Comment_writeDate;
	
	//-----------생성자------------
	public DTO_QnA_Comment() {
		super();
	}

	public DTO_QnA_Comment(String qnA_Comment_idx, String qnA_idx, String qnA_Comment_content,
			String qnA_Comment_writeDate) {
		super();
		QnA_Comment_idx = qnA_Comment_idx;
		QnA_idx = qnA_idx;
		QnA_Comment_content = qnA_Comment_content;
		QnA_Comment_writeDate = qnA_Comment_writeDate;
	}

	//-----------Getter&Setter-----------
	public String getQnA_Comment_idx() {
		return QnA_Comment_idx;
	}

	public void setQnA_Comment_idx(String qnA_Comment_idx) {
		QnA_Comment_idx = qnA_Comment_idx;
	}

	public String getQnA_idx() {
		return QnA_idx;
	}

	public void setQnA_idx(String qnA_idx) {
		QnA_idx = qnA_idx;
	}

	public String getQnA_Comment_content() {
		return QnA_Comment_content;
	}

	public void setQnA_Comment_content(String qnA_Comment_content) {
		QnA_Comment_content = qnA_Comment_content;
	}

	public String getQnA_Comment_writeDate() {
		return QnA_Comment_writeDate;
	}

	public void setQnA_Comment_writeDate(String qnA_Comment_writeDate) {
		QnA_Comment_writeDate = qnA_Comment_writeDate;
	}
	
	
	

}
