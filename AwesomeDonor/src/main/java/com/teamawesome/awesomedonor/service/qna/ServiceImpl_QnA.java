package com.teamawesome.awesomedonor.service.qna;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.member.Mapper_Donor;
import com.teamawesome.awesomedonor.mapper.qna.Mapper_QnA;
import com.teamawesome.awesomedonor.mapper.qna.Mapper_QnA_Comment;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_QnA;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;

@Service
public class ServiceImpl_QnA implements Service_QnA{
	

	@Autowired
	private Mapper_Donor mapper_Donor;
	@Autowired
	private Mapper_QnA mapper_QnA;
	@Autowired
	private Mapper_QnA_Comment mapper_QnA_Comment;
	
	@Override
	public ArrayList<BoardData_QnA> getQnAList(){
		ArrayList<BoardData_QnA> boardDataList=new ArrayList<BoardData_QnA>();
		ArrayList<DTO_QnA> qnaList=mapper_QnA.selectAll();
		for(DTO_QnA qna:qnaList) {
			DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
			ArrayList<DTO_QnA_Comment> comment1 = mapper_QnA_Comment.selectByIdx(qna.getQnA_idx());
			DTO_QnA_Comment comment = new DTO_QnA_Comment();
			if(comment1.size()>=1) {
				comment = comment1.get(0);
			}
			BoardData_QnA boardData=new BoardData_QnA(donor,qna,comment);
			boardDataList.add(boardData);
		}
		return boardDataList;
	}
	
	@Override
	public ArrayList<BoardData_QnA> getMyQnAList(String sessionidx){
		ArrayList<BoardData_QnA> boardDataList=new ArrayList<BoardData_QnA>();
		ArrayList<DTO_QnA> contentList=mapper_QnA.selectByMyIdx(sessionidx);
		for(DTO_QnA qna:contentList) {
			DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
			BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
			boardDataList.add(boardData);
		}
		return boardDataList;
	}
	
	
	@Override
	public void writeQnA(DTO_QnA dto) {
		mapper_QnA.insert(dto);
	}
	
	@Override
	public BoardData_QnA readQnA(DTO_QnA dto) {
		mapper_QnA.updateCount(dto);
		DTO_QnA qna=mapper_QnA.selectByIdx(dto);
		DTO_Donor donor =mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
		ArrayList<DTO_QnA_Comment> comment1 = mapper_QnA_Comment.selectByIdx(qna.getQnA_idx());
		DTO_QnA_Comment comment = new DTO_QnA_Comment();
		if(comment1.size()>=1) {
			comment = comment1.get(0);
		}
		BoardData_QnA boardData=new BoardData_QnA(donor,qna,comment);
		return boardData;
	}
	
	@Override
	public void updateQnA(DTO_QnA dto) {
		mapper_QnA.update(dto);
	}
	
	@Override
	public void deleteQnA(DTO_QnA dto) {
		mapper_QnA.deleteByIdx(dto);
	}
	
	@Override
	public BoardData_QnA getBoardData(DTO_QnA dto) {
		DTO_QnA qna=mapper_QnA.selectByIdx(dto);
		DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
		BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
		return boardData;
	}
	
//
//	@Autowired
//	private Mapper_Donor mapper_Donor;
//	@Autowired
//	private Mapper_QnA mapper_QnA;
//	
//	@Override
//	public ArrayList<BoardData_QnA> getQnAList(){
//		ArrayList<BoardData_QnA> boardDataList=new ArrayList<BoardData_QnA>();
//		ArrayList<DTO_QnA> contentList=mapper_QnA.selectAll();
//		for(DTO_QnA qna:contentList) {
//			DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
//			BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
//			boardDataList.add(boardData);
//		}
//		return boardDataList;
//	}
//	
//	@Override
//	public ArrayList<BoardData_QnA> getMyQnAList(String sessionidx){
//		ArrayList<BoardData_QnA> boardDataList=new ArrayList<BoardData_QnA>();
//		ArrayList<DTO_QnA> contentList=mapper_QnA.selectByMyIdx(sessionidx);
//		for(DTO_QnA qna:contentList) {
//			DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
//			BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
//			boardDataList.add(boardData);
//		}
//		return boardDataList;
//	}
//	
//	
//	@Override
//	public void writeQnA(DTO_QnA dto) {
//		mapper_QnA.insert(dto);
//	}
//	
//	@Override
//	public BoardData_QnA readQnA(DTO_QnA dto) {
//		mapper_QnA.updateCount(dto);
//		DTO_QnA qna=mapper_QnA.selectByIdx(dto);
//		DTO_Donor donor =mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
//		BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
//		return boardData;
//	}
//	
//	@Override
//	public void updateQnA(DTO_QnA dto) {
//		mapper_QnA.update(dto);
//	}
//	
//	@Override
//	public void deleteQnA(DTO_QnA dto) {
//		mapper_QnA.deleteByIdx(dto);
//	}
//	
//	@Override
//	public BoardData_QnA getBoardData(DTO_QnA dto) {
//		DTO_QnA qna=mapper_QnA.selectByIdx(dto);
//		DTO_Donor donor=mapper_Donor.selectByIdx(qna.getMember_Donor_idx());
//		BoardData_QnA boardData=new BoardData_QnA(donor,qna,null);
//		return boardData;
//	}
}
