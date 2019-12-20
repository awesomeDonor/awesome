package com.teamawesome.awesomedonor.service.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.qna.Mapper_QnA_Comment;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;

@Service
public class ServiceImpl_QnA_Comment implements Service_QnA_Comment {
	
	@Autowired
	private Mapper_QnA_Comment mapper_QnA_Comment;
	
	//ServiceImpl_QnA에서 여기를 거치지 않고 바로 Mapper_QnA_Comment의 기능을 썼으므로
	//사실 여기서는 getQnAComment가 필요하지 않을듯.
	//@Override
	//public DTO_QnA_Comment getQnAComment(DTO_QnA dto_qna) {
		// TODO Auto-generated method stub
	//	return null;
	//}
	
	@Override
	public void writeQnAComment(DTO_QnA_Comment dto_qna_comment) {
		// TODO Auto-generated method stub
		mapper_QnA_Comment.insert(dto_qna_comment);
	}

	@Override
	public void updateQnAComment(DTO_QnA_Comment dto_qna_comment) {
		// TODO Auto-generated method stub
		mapper_QnA_Comment.update(dto_qna_comment);
	}

	@Override
	public void deleteQnAComment(DTO_QnA qna_idx) {
		// TODO Auto-generated method stub
		mapper_QnA_Comment.deleteByIdx(qna_idx);
	}

}
