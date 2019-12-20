package com.teamawesome.awesomedonor.service.qna;

import java.util.ArrayList;

import com.teamawesome.awesomedonor.vo.boarddata.BoardData_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;

public interface Service_QnA {
	public ArrayList<BoardData_QnA> getQnAList();
	public ArrayList<BoardData_QnA> getMyQnAList(String sessionidx);
	public void writeQnA(DTO_QnA dto);
	public BoardData_QnA readQnA(DTO_QnA dto);
	public void updateQnA(DTO_QnA dto);
	public void deleteQnA(DTO_QnA dto);
	public BoardData_QnA getBoardData(DTO_QnA dto);
}
