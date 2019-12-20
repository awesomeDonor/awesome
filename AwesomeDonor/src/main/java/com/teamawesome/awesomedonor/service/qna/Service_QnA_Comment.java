package com.teamawesome.awesomedonor.service.qna;

import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;

public interface Service_QnA_Comment {
//QnA 댓글 어떤 기능이 필요할까?
//1. 쓰인댓글 읽기(readQnA 내에서 떠야함) : getQnACommentList
//2. 댓글쓰기 : writeQnAComment
//3. 댓글 수정 : updateQnAComment
//4. 댓글 삭제 : deleteQnAComment

//*댓글 달렸는지 확인은, ServiceImpl_QnA에서 readQnA메소드 안에 포함돼 있음. 그러니 따로 추가 x. 	
	//ServiceImpl_QnA에서 여기를 거치지 않고 바로 Mapper_QnA_Comment의 기능을 썼으므로
	//사실 여기서는 getQnAComment가 필요하지 않을듯.
	//public DTO_QnA_Comment getQnAComment(DTO_QnA dto_qna);
	public void writeQnAComment(DTO_QnA_Comment dto_qna_comment);
	public void updateQnAComment(DTO_QnA_Comment dto_qna_comment);
	public void deleteQnAComment(DTO_QnA qna_idx);

}
