package com.teamawesome.awesomedonor.service.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamawesome.awesomedonor.mapper.adminspace.UploadFileSQLMapper;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Admin;
import com.teamawesome.awesomedonor.mapper.member.Mapper_Receiver;
import com.teamawesome.awesomedonor.vo.dto.adminspace.UploadFileVo;
import com.teamawesome.awesomedonor.vo.dto.member.DTO_Admin;
import com.teamawesome.awesomedonor.vo.session.SessionData;
import com.teamawesome.awesomedonor.vo.session.Session_Admin;

@Service
public class ServiceImpl_Admin implements Service_Admin {

	@Autowired
	Mapper_Admin mapper_Admin;
	
	@Autowired
	Mapper_Receiver mapper_receiver;
	
	@Autowired
	UploadFileSQLMapper uploadFileSQLMapper;
	
	/*
	 * @Autowired
	 * Mapper_Donor mapper_Donor;
	 */
	
//////관리자/////////////////////////////////////////////////////////////////////////////////////////
	//------------------------------------------------------------------------
	//관리자 회원가입
	@Override
	public void joinMember(DTO_Admin dto_Admin) {
		
		mapper_Admin.insert(dto_Admin);
	}
	//관리자 로그인
	@Override
	public SessionData login(DTO_Admin dto) {
		SessionData sessionData = new SessionData();
		Session_Admin session_Admin;
		DTO_Admin dto_Admin = mapper_Admin.selectByAdminId(dto.getMember_Admin_id());
		
		if(dto_Admin != null &&
				dto_Admin.getMember_Admin_pw().equals(dto.getMember_Admin_pw())) {
			
			session_Admin = new Session_Admin(dto_Admin.getMember_Admin_idx(), dto_Admin.getMember_Admin_id());
			sessionData.setSession_Admin(session_Admin);
			//identified는 어떻게?? 나중에..
			return sessionData;
			}
	else return null;
	}
//------------------------------------------------------------------------------------------
	//배너 파일 업로드...
	@Override
	public void updateBanner(ArrayList<UploadFileVo> fileVoList) {
		// TODO Auto-generated method stub
		
		for (UploadFileVo uploadFileVo : fileVoList) {
			uploadFileSQLMapper.updateBanner(uploadFileVo);
		}	
	}

	@Override
	public String selectIdxByLinkName(String f_link_name) {
		// TODO Auto-generated method stub
		
		String f_idx = uploadFileSQLMapper.selectByLinkName(f_link_name);
			
		return f_idx;
	}
	
	public UploadFileVo readFile(int f_idx) {
		
		UploadFileVo uploadFileVo = uploadFileSQLMapper.selectLinkNameFromIdx(f_idx);		
		return uploadFileVo;
		
	}
	
	
//------------------기관------------------------------------------------------
	/*							//ServiceImpl_Receiver에 있음.
	//기관 인증여부갱신
	@Override
	public void updateReceiver_identified(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_identified(Member_Receiver_idx);
	}
	//기관 아이디 삭제
	@Override
	public void updateReceiver_Removed(String Member_Receiver_idx) {
		mapper_receiver.updateReceiver_Removed(Member_Receiver_idx);
	}
	//아이디 복원.
		public void updateReceiver_RemovedBack(String Member_Receiver_idx) {
			mapper_receiver.updateReceiver_RemovedBack(Member_Receiver_idx);
		}
	
	
	
	//기관 리스트 뽑아오기
	@Override
	public ArrayList<DTO_Receiver> readReceiverList() {
		ArrayList<DTO_Receiver> receiverList = mapper_receiver.selectAll();
		return receiverList;
	}
	//기관 이름으로 검색 필터링??
	@Override
	public ArrayList<DTO_Receiver> filterByReceiver_Name(String Member_Receiver_name) {
		ArrayList<DTO_Receiver> sortNameReceiverList = mapper_receiver.selectByReceiver_Name(Member_Receiver_name);
		return sortNameReceiverList;
	}
	*/
//------------------------------------------------------------------------------------------
	
	
	
	
	
	
//------------------기부자------------------------------------------------------
	
	
	
	
//------------------------------------------------------------------------------
}
