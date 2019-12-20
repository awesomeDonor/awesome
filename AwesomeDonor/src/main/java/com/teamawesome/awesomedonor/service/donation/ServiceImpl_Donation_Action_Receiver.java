package com.teamawesome.awesomedonor.service.donation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Action;
import com.teamawesome.awesomedonor.mapper.donation.Mapper_Donation_Request;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Donor;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Donation_Action_Receiver;
import com.teamawesome.awesomedonor.vo.boarddata.BoardData_Information_Donor;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Action;
import com.teamawesome.awesomedonor.vo.dto.donation.DTO_Donation_Request;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Donor_Evaluation;

@Service
public class ServiceImpl_Donation_Action_Receiver implements Service_Donation_Action_Receiver {

	@Autowired
	Mapper_Donation_Request mapperRequest;
	
	@Autowired
	Mapper_Donation_Action mapperAction;
	
	@Autowired
	Mapper_Donor mapperDonor;
	
	@Autowired
	Mapper_Receiver mapperReceiver;
	
	//check
	//필요해요 게시판에 올린 기부 요청에 대한 예약 신청 현황
	//이렇게 되면 예약현황이 0건인 것도 보여주겠다는 것임
	@Override
	public ArrayList<BoardData_Donation_Action_Receiver> readBoardDataRequestInfo(String sessionIdx){ //sessionIdx 는 Member_Receiver_Idx
		
		ArrayList<BoardData_Donation_Action_Receiver> mypageBoardData = new ArrayList<BoardData_Donation_Action_Receiver>(); 
		ArrayList<DTO_Donation_Request> dtoRequestList = mapperRequest.selectByProgress("후원가능");
		
		for(DTO_Donation_Request dtoRequest : dtoRequestList) {
			if(dtoRequest.getMember_Receiver_idx().equals(sessionIdx)) {
				int countDonation = mapperAction.selectDonationCount(dtoRequest.getDonation_Request_idx());
				BoardData_Donation_Action_Receiver boardData = new BoardData_Donation_Action_Receiver(null,dtoRequest,null,countDonation, 0);
				mypageBoardData.add(boardData);
			}
		}
		return mypageBoardData;
	}
	
	//신청현황에서 건수 누르면 가는 페이지1
	//평가를 제외한 항목들은 어피 DTO_Donation_Action에서 다 뿌려줄 수 있어서 ArrayListDTO_Donation_Action 를 반환하도록
	//missing Point-Donor의 이름, 이메일 주소와 같은 항목은 없음. BoardData를 반환할 수밖에 없음. 
	@Override
	public ArrayList<BoardData_Donation_Action_Receiver> readDonorList(String Donation_Request_idx){
		ArrayList<BoardData_Donation_Action_Receiver> dtoActionReceiverList = new ArrayList<BoardData_Donation_Action_Receiver>();
		ArrayList<DTO_Donation_Action> dtoActionList = mapperAction.selectByApproval_yet_ForReceiver(Donation_Request_idx); 
		
		for(DTO_Donation_Action dtoAction : dtoActionList) {
			DTO_Donor dtoDonor = mapperDonor.selectByIdx(dtoAction.getMember_Donor_idx()); //donor 정보
			int evlauationCount = mapperAction.evaluationCount(dtoAction.getMember_Donor_idx()); //평가 수
			DTO_Donation_Request dtoRequest = mapperRequest.selectByIdx(dtoAction.getDonation_Request_idx());
			BoardData_Donation_Action_Receiver dtoActionReceiver = 
					new BoardData_Donation_Action_Receiver(dtoAction, dtoRequest, dtoDonor, 0, evlauationCount);
			
			dtoActionReceiverList.add(dtoActionReceiver);
		}
		
		return dtoActionReceiverList;
	}
	
	//회원정보 자세히보기1-평가 제외 나머지. // 이건 BoardData_Information_Donor로 파악이 가능함. 
	//missing Point-평가항목 제외 사항에 DTO_Donor가 있어야함. 다 같이 합쳐서 BoardData로 만들어야 한다. 
	//자세히 보기를 누르면 request_idx 를 hidden으로 donor_idx를 name 으로 받아서 DTO_Donation_Action형으로 넣고 controller에서 이 함수를 호출
	//후원 진행현황의 자세히 보기도 이걸로 대체 할 수 있을듯
	//10.21 수정 dto_Donor_File_Upload 는 일단 null로 함
	@Override
	public BoardData_Information_Donor readDetailDonorInfo(String Donation_Action_idx) {
		DTO_Donation_Action dtoAction = mapperAction.selectByIdx(Donation_Action_idx);
		DTO_Donor dtoDonor = mapperDonor.selectByIdx(dtoAction.getMember_Donor_idx());
		ArrayList<DTO_Donor_Evaluation> donor_Evaluation = mapperDonor.selectAllFromDonor_Evaluation(dtoAction.getMember_Donor_idx());
		
		//별점평균 구하기!!
		String AVG = mapperDonor.selectDonor_StarNumber_AVG(dtoAction.getMember_Donor_idx());
		double StarNumber_AVG = (Math.round((Double.parseDouble(AVG))*100)/100.0);
		String donor_StarNumber_AVG = ""+StarNumber_AVG;
		
		//어썸지수 구하기!!
		ArrayList<DTO_Donation_Action> actionList = mapperDonor.selectDonation_completed_ForAwesomeIndex(dtoDonor.getMember_Donor_idx());
		int awesomeIndex = 0;
		for(DTO_Donation_Action dto : actionList) {
			awesomeIndex+=mapperDonor.selectAmountByRequest_Idx_ForAwesomeIndex(dto.getDonation_Request_idx());
		}
		int countEvaluation = mapperAction.evaluationCount(dtoAction.getMember_Donor_idx());
		
		BoardData_Information_Donor infoDonor = 
				new BoardData_Information_Donor(dtoDonor,dtoAction,null, donor_Evaluation, donor_StarNumber_AVG, awesomeIndex ,countEvaluation); // 어썸지수 코드 추가해야함. 
		
		return infoDonor;
	}
	
//	//신청현황에서 건수 누르면 가는 페이지1
//	//평가를 제외한 항목들은 어피 DTO_Donation_Action에서 다 뿌려줄 수 있어서 ArrayListDTO_Donation_Action 를 반환하도록
//	//missing Point-Donor의 이름, 이메일 주소와 같은 항목은 없음. BoardData를 반환할 수밖에 없음. 
//	@Override
//	public ArrayList<DTO_Donation_Action> readDonorList(String Donation_Request_idx){
//		ArrayList<DTO_Donation_Action> dtoActionList = mapperAction.selectByApproval_yet_ForReceiver(Donation_Request_idx);
//		return dtoActionList;
//	}
//	
//	//신청현황에서 건수 누르면 가는 페이지2
//	//public 평가 보드 데이터 생성하는 것 model로 두개 뿌려주기
//	//평가 ArrayListDTO_Donor_Evaluation로 반환
//	//일단 짜 봤는데 어떻게 굴러갈지 모르겠음
//	//고민-boardData의 countDonation을 countDonationOrEvaluation으로 바꾸고 거기에 저장하면 어떨까...
//	@Override
//	public ArrayList<DTO_Donor_Evaluation> evaluationCount(String Donation_Request_idx) {
//		ArrayList<DTO_Donation_Action> dtoActionList = mapperAction.selectByApproval_yet_ForReceiver(Donation_Request_idx);
//		ArrayList<DTO_Donor_Evaluation> evaluationList = new ArrayList<DTO_Donor_Evaluation>();	
//		for(DTO_Donation_Action dtoAction : dtoActionList) {
//			ArrayList<DTO_Donor_Evaluation> evalListForCount = mapperAction.selectAllEvaluationByDonorIdx(dtoAction.getMember_Donor_idx());
//			for(DTO_Donor_Evaluation evaluation : evalListForCount) {
//				evaluationList.add(evaluation);
//			}
//		}
//		return evaluationList;
//	}
//	
//	//회원정보 자세히보기1-평가 제외 나머지. // 이건 BoardData_Information_Donor로 파악이 가능함. 
//	//missing Point-평가항목 제외 사항에 DTO_Donor가 있어야함. 다 같이 합쳐서 BoardData로 만들어야 한다. 
//	//자세히 보기를 누르면 request_idx 를 hidden으로 donor_idx를 name 으로 받아서 DTO_Donation_Action형으로 넣고 controller에서 이 함수를 호출
//	//후원 진행현황의 자세히 보기도 이걸로 대체 할 수 있을듯
//	@Override
//	public DTO_Donation_Action readDetailDonorInfo(DTO_Donation_Action dtoAction) {
//		DTO_Donation_Action dtoDonationAction = mapperAction.selectByDonorIdx(dtoAction);
//		return dtoDonationAction;
//	}
//	
//	//회원정보 자세히보기2-평가 항목.
//	@Override
//	public ArrayList<DTO_Donor_Evaluation> evaluationList(String Member_Donor_idx){
//		ArrayList<DTO_Donor_Evaluation> evaluationList = mapperAction.selectAllEvaluationByDonorIdx(Member_Donor_idx);
//		return evaluationList;
//	}
	
	//다시 논의해보기. 
	//수락 신청 
	//자세히 보기의 jsp 에서 actoin_idx,request_idx를 받아와야 함
	//함수 실행 후 controller에서 후원진행 현황 페이지로 이동, 
	@Override
	public void donationAceept(String Donation_Action_idx) {//현실적으로 Donation_Action_idx를 받도록 하는 것이 현실적이지 않을까. DTO객체를 만들어서 넣는 것은 힘들듯. 
		DTO_Donation_Action dtoAction = mapperAction.selectByIdx(Donation_Action_idx);
		//일단 전부 다 취소 처리
		mapperAction.updateDisapproval(dtoAction.getDonation_Request_idx());
		//그 뒤 해당항목만 승인 처리
		mapperAction.updateApproval(Donation_Action_idx);
		//해당 request의 progress 수정. 
		mapperRequest.updateProgressFrom0To1(dtoAction.getDonation_Request_idx());//이부분 추가했음. 
		mapperRequest.updateProgressinRequestSearchFrom0To1(dtoAction.getDonation_Request_idx());
	}
	
	//check
	//후원진행 현황
	//세션에서 receiver_idx 받아온 것이 sessionIdx 
	@Override
	public ArrayList<BoardData_Donation_Action_Receiver> readDonationInProgress(String sessionIdx){
		ArrayList<BoardData_Donation_Action_Receiver> boardDataList = new ArrayList<BoardData_Donation_Action_Receiver>();
		ArrayList<DTO_Donation_Request> dtoRequestList = mapperRequest.selectByReceiverIdx(sessionIdx);
		
		for(DTO_Donation_Request dtoRequest : dtoRequestList) {
			DTO_Donation_Action dtoAction = mapperAction.selectApproval_ForReceiver(dtoRequest.getDonation_Request_idx());//여기서 정말로 action이 하나로 나오나...
			if(dtoAction!=null) {
				DTO_Donor dtoDonor = mapperDonor.selectByIdx(dtoAction.getMember_Donor_idx());
				BoardData_Donation_Action_Receiver boardData = new BoardData_Donation_Action_Receiver(dtoAction, dtoRequest, dtoDonor, 0, 0);
				boardDataList.add(boardData);
			}
		}
		return boardDataList;
	}
	
	//check
	//후원완료
	@Override
	public void donationComplete(String Donation_Action_idx) {
		System.out.println(Donation_Action_idx);
		mapperAction.updateCompleted(Donation_Action_idx);
		DTO_Donation_Action dto_Action = mapperAction.selectByIdx(Donation_Action_idx);
		mapperRequest.updateProgressFrom1To2(dto_Action.getDonation_Request_idx());//이부분 추가했음. 
		mapperRequest.updateProgressinRequestSearchFrom1To2(dto_Action.getDonation_Request_idx());
	}
	
	//check
	//후원중지
	@Override
	public void donationStop(String Donation_Action_idx) {
		mapperAction.updateNotCompleted(Donation_Action_idx);
		DTO_Donation_Action dto_Action = mapperAction.selectByIdx(Donation_Action_idx);
		mapperRequest.updateProgressFrom1To2(dto_Action.getDonation_Request_idx());//이부분 추가했음. 
	}
	
	//check
	//평가 작성에 넘겨줄 정보 Member_Donor_idx 구하기 위한 메소드 
	@Override
	public String getMemberDonorIdx(String Donation_Action_idx) {
		DTO_Donation_Action dtoAction = mapperAction.selectByIdx(Donation_Action_idx);
		String Member_Donor_idx = dtoAction.getMember_Donor_idx();
		return Member_Donor_idx;
	}
	
	//check
	//평가 db에 추가하기
	@Override
	public void writeEvaluation(DTO_Donor_Evaluation dtoEvaluation) {
		mapperAction.insertIntoDonor_Evaluation(dtoEvaluation);
	}
	
	//check!
	//후원 완료 내역
	@Override
	public ArrayList<BoardData_Donation_Action_Receiver> readBoardDataCompleteInfo(String sessionIdx){
		ArrayList<BoardData_Donation_Action_Receiver> boardDataList = new ArrayList<BoardData_Donation_Action_Receiver>();
		ArrayList<DTO_Donation_Request> dtoRequestList = mapperRequest.selectByReceiverIdx(sessionIdx);
		for(DTO_Donation_Request dtoRequest : dtoRequestList) {
			DTO_Donation_Action dtoAction = mapperAction.selectDonation_completed_ForReceiver(dtoRequest.getDonation_Request_idx());
			if(dtoAction!=null) {
				DTO_Donor dtoDonor = mapperDonor.selectByIdx(dtoAction.getMember_Donor_idx());
				System.out.println(dtoDonor.getMember_Donor_name());
				BoardData_Donation_Action_Receiver boardData = new BoardData_Donation_Action_Receiver(dtoAction, dtoRequest, dtoDonor, 0, 0);
				boardDataList.add(boardData);
			}
			
		}
		return boardDataList;
	}
}
