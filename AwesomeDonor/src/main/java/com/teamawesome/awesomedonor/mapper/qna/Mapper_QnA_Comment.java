package com.teamawesome.awesomedonor.mapper.qna;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;

public interface Mapper_QnA_Comment {
	
	//QnA idx에 맞는 댓글(댓글읽기)	
	@Select("SELECT * FROM QNA_COMMENT WHERE QNA_IDX=#{QNA_IDX}")
	public ArrayList<DTO_QnA_Comment> selectByIdx(String qna_idx);
	
	//DB에 답변정보 넣기(댓글입력)
	@Insert("INSERT INTO QNA_COMMENT VALUES(QNA_COMMENT_SEQ.NEXTVAL,#{QnA_idx},#{QnA_Comment_content},SYSDATE)")
	public void insert(DTO_QnA_Comment dto);
	
	//답변 삭제(*readQnAPage.jsp에서 삭제 란은 관리자가 아니면 보이지 않으므로 따로 관리자임을 확인하지 않음)
	//QnA idx에 맞는 댓글 삭제.
	@Delete("DELETE FROM QNA_COMMENT WHERE QNA_IDX=#{QnA_idx}")
	public void deleteByIdx(DTO_QnA qna_idx);
	
	//답변 수정(내용, 날짜)
	@Update("UPDATE QNA_COMMENT SET QNA_COMMENT_CONTENT=#{QnA_Comment_content}, QNA_COMMENT_WRITEDATE=SYSDATE WHERE QNA_IDX=#{QnA_idx}")
	public void update(DTO_QnA_Comment dto);
}
