package com.teamawesome.awesomedonor.controller.main;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamawesome.awesomedonor.service.qna.Service_QnA;
import com.teamawesome.awesomedonor.service.qna.Service_QnA_Comment;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA;
import com.teamawesome.awesomedonor.vo.dto.qna.DTO_QnA_Comment;
import com.teamawesome.awesomedonor.vo.session.SessionData;

@Controller
public class Controller_QnA {
	
	@Autowired
	private Service_QnA service_QnA;
	@Autowired
	private Service_QnA_Comment service_QnA_Comment;
	
	@RequestMapping("/QnAPage")
	public String QnAPage(Model model) {

		ArrayList<BoardData_QnA> boardData_QnA = service_QnA.getQnAList();

		model.addAttribute("boardData", boardData_QnA);

		return "QnA/QnAPage";
	}

	@RequestMapping("/MyQnAPage")
	public String MyQnA(Model model,HttpSession session) {
		SessionData sessionData = (SessionData) session.getAttribute("sessionData");
		String sessionidx=sessionData.getSession_Donor().getSessionIdx();
		ArrayList<BoardData_QnA> boardData_QnA = service_QnA.getMyQnAList(sessionidx);

		model.addAttribute("boardData", boardData_QnA);
		

		return "QnA/QnAPage";
	}

	@RequestMapping("/writeQnAPage")
	public String writeQnAPage() {

		return "QnA/writeQnAPage";
	}

	@RequestMapping("/writeQnAProcess")
	public String writeQnAProcess(DTO_QnA param, HttpSession session) {

		SessionData sessionData = (SessionData) session.getAttribute("sessionData");
		String member_Donor_idx = sessionData.getSession_Donor().getSessionIdx();

		param.setMember_Donor_idx(member_Donor_idx);

		service_QnA.writeQnA(param);

		return "redirect:QnAPage";

	}

	@RequestMapping("/readQnAPage")
	public String readQnAPage(DTO_QnA param, Model model) {

		BoardData_QnA boardData = service_QnA.readQnA(param);

		model.addAttribute("boardData", boardData);

		return "QnA/readQnAPage";
	}

	@RequestMapping("/deleteQnAProcess")
	public String deleteQnAProcess(DTO_QnA param) {

		service_QnA.deleteQnA(param);
		
		service_QnA_Comment.deleteQnAComment(param);
		
		return "redirect:QnAPage";
	}

	@RequestMapping("/updateQnAPage")
	public String updateQnAPage(DTO_QnA param, Model model) {

		BoardData_QnA boardData = service_QnA.getBoardData(param);
		// BoardData의 'List'를 통째로 get하는게 아니라
		// param에 '해당하는 BoardData'만을 가져와야 함.
		// 그러기 위해서는 Service에서 getBoardData를 만들어야함
		// 따라서 ServiceImpl도 마찬가지로 만들어야 함.

		model.addAttribute("boardData", boardData);

		return "QnA/updateQnAPage";
	}

	@RequestMapping("/updateQnAProcess")
	public String updateQnAProcess(DTO_QnA param) {

		service_QnA.updateQnA(param);

		return "redirect:QnAPage";
	}
	
	
	//----------------------------------------------------
	//----------이 아래부터 QnA_Comment 관련----------
	//댓글쓰기
	@RequestMapping("/writeQnACommentProcess")
	public String writeQnACommentProcess(DTO_QnA_Comment param) {
		service_QnA_Comment.writeQnAComment(param);

		return "redirect:readQnAPage?QnA_idx="+param.getQnA_idx();
	}
	
	@RequestMapping("/deleteQnACommentProcess")
	public String deleteQnACommentProcess(DTO_QnA param) {
		
		service_QnA_Comment.deleteQnAComment(param);
		
		return "redirect:readQnAPage?QnA_idx="+param.getQnA_idx();
	}
	
	//updateQnAComment라는 페이지를 따로 만들었지만, 사실 readQnAPage와 거의 동일.
	//따라서 service_QnA에서 readQnA를 하여 정보를 가져온다.(질문자의 질문정보를 위해.)
	//이때 QnA_Comment_Content는 boardData에서 가져올 것이다.
	@RequestMapping("/updateQnACommentPage")
	public String updateQnACommentPage(DTO_QnA param, Model model) {
		
		BoardData_QnA boardData = service_QnA.readQnA(param);

		model.addAttribute("boardData", boardData);
		
		return "QnA/updateQnACommentPage";
	}
	
	@RequestMapping("/updateQnACommentProcess")
	public String updateQnACommentProcess(DTO_QnA_Comment param) {
		
		service_QnA_Comment.updateQnAComment(param);

		return "redirect:readQnAPage?QnA_idx="+param.getQnA_idx();
	}
	//이거는 포워딩도 아니고.. 리다이렉트도 아니고.
	//위의 readQnAPage는 변하지 않은 상태로 수정버튼을 눌렀을때
	//그곳만 form태그로 바꾸게하려면 어떻게해야하지?
	// -> ajax가 필요하다고 함.
	
//
//	@Autowired
//	private Service_QnA service_QnA;
//
//	@RequestMapping("/QnAPage")
//	public String QnAPage(Model model) {
//
//		ArrayList<BoardData_QnA> boardData_QnA = service_QnA.getQnAList();
//
//		model.addAttribute("boardData", boardData_QnA);
//
//		return "QnA/QnAPage";
//	}
//
//	@RequestMapping("/MyQnAPage")
//	public String MyQnA(Model model,HttpSession session) {
//		SessionData sessionData = (SessionData) session.getAttribute("sessionData");
//		String sessionidx=sessionData.getSession_Donor().getSessionIdx();
//		ArrayList<BoardData_QnA> boardData_QnA = service_QnA.getMyQnAList(sessionidx);
//
//		model.addAttribute("boardData", boardData_QnA);
//		
//
//		return "QnA/QnAPage";
//	}
//
//	@RequestMapping("/writeQnAPage")
//	public String writeQnAPage() {
//
//		return "QnA/writeQnAPage";
//	}
//
//	@RequestMapping("/writeQnAProcess")
//	public String writeQnAProcess(DTO_QnA param, HttpSession session) {
//
//		SessionData sessionData = (SessionData) session.getAttribute("sessionData");
//		String member_Donor_idx = sessionData.getSession_Donor().getSessionIdx();
//
//		param.setMember_Donor_idx(member_Donor_idx);
//
//		service_QnA.writeQnA(param);
//
//		return "redirect:QnAPage";
//		// "게시물이 성공적으로 작성되었습니다" 를 보여주는 페이지.
//		// 그 페이지에는 "QnA 페이지로" a태그 링크 걸어두기.
//	}
//
//	@RequestMapping("/readQnAPage")
//	public String readQnAPage(DTO_QnA param, Model model) {
//
//		BoardData_QnA boardData = service_QnA.readQnA(param);
//
//		model.addAttribute("boardData", boardData);
//
//		return "QnA/readQnAPage";
//	}
//
//	@RequestMapping("/deleteQnAProcess")
//	public String deleteQnAProcess(DTO_QnA param) {
//
//		service_QnA.deleteQnA(param);
//
//		return "redirect:QnAPage";
//	}
//
//	@RequestMapping("/updateQnAPage")
//	public String updateQnAPage(DTO_QnA param, Model model) {
//
//		BoardData_QnA boardData = service_QnA.getBoardData(param);
//		// BoardData의 'List'를 통째로 get하는게 아니라
//		// param에 '해당하는 BoardData'만을 가져와야 함.
//		// 그러기 위해서는 Service에서 getBoardData를 만들어야함
//		// 따라서 ServiceImpl도 마찬가지로 만들어야 함.
//
//		model.addAttribute("boardData", boardData);
//
//		return "QnA/updateQnAPage";
//	}
//
//	@RequestMapping("updateQnAProcess")
//	public String updateQnAProcess(DTO_QnA param) {
//
//		service_QnA.updateQnA(param);
//
//		return "redirect:QnAPage";
//	}

}
