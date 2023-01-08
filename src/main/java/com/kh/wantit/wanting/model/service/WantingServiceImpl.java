package com.kh.wantit.wanting.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.model.dao.WantingDAO;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingAttend;

@Service("wService")
public class WantingServiceImpl implements WantingService{

	@Autowired
	private WantingDAO wDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 원팅 게시글 작성
	@Override
	public int insertWanting(Wanting w) {
		return wDAO.insertWanting(sqlSession, w);
	}

	@Override
	public int insertImage(Image img) {
		return wDAO.insertImage(sqlSession, img);
	}

	
	// 원팅 리스트 불러오기
	@Override
	public ArrayList<Wanting> selectWantingList() {
		return wDAO.selectWantingList(sqlSession);
	}

	@Override
	public ArrayList<Wanting> selectWantingListPopular() {
		return wDAO.selectWantingListPopular(sqlSession);
	}

	@Override
	public ArrayList<Image> selectImageList() {
		return wDAO.selectImageList(sqlSession);
	}
	
	
	
	// 원팅 게시글 상세보기
	@Override
	public Wanting selectWanting(int wantingNum) {
		return wDAO.selectWanting(sqlSession, wantingNum);
	}

	@Override
	public ArrayList<Image> selectImage(int wantingNum) {
		return wDAO.selectImage(sqlSession, wantingNum);
	}
	
	@Override
	public int getWantingYN(WantingAttend join) {
		return wDAO.getWantingYN(sqlSession, join);
	}

	
	// 원팅 참여하기
	@Override
	public int attendWanting(WantingAttend join) {
		return wDAO.attendWanting(sqlSession, join);
	}
	
	@Override
	public int getWantingCount(int wantingNum) {
		return wDAO.getWantingCount(sqlSession, wantingNum);
	}

	@Override
	public int updateWantingStatus(Wanting w) {
		return wDAO.updateWantingStatus(sqlSession, w);
	}

	
	// 원팅 달성 알림 보내기
	@Override
	public ArrayList<WantingAttend> getWantingAttendList(int wantingNum) {
		return wDAO.getWantingAttendList(sqlSession, wantingNum);
	}
	
	public int sendAlarm (Alarm alarm) {
		return wDAO.sendAlarm(sqlSession, alarm);
	}
	
	
	// 원팅 검색
	@Override
	public ArrayList<Wanting> searchWantingList(Map<String, String> searchMap) {
		return wDAO.searchWantingList(sqlSession, searchMap);
	}

	
	// 회원 전체 안 읽은 알림 가져오기
	@Override
	public ArrayList<Alarm> selectAlarmList(String id) {
		return wDAO.selectAlarmList(sqlSession, id);
	}

	// 회원 전체 알림 가져오기 + 페이징
	@Override
	public int getAlarmListCount(String id) {
		return wDAO.getAlarmListCount(sqlSession, id);
	}
	
	@Override
	public ArrayList<Alarm> selectAlarmListPaging(PageInfo pi, String id) {
		return wDAO.selectAlarmListPaging(sqlSession, pi, id);
	}
	

	// 회원 알림 확인하기
	@Override
	public int checkAlarm(int alarmNum) {
		return wDAO.checkAlarm(sqlSession, alarmNum);
	}
	
	
	// 원팅 참여자 리스트 - 아이디로 맴버 가져오기
	@Override
	public Member getMember(String memberId) {
		return wDAO.getMember(sqlSession, memberId);
	}

	// 원팅 참여자 리스트 - 아이디로 이미지 가져오기
	@Override
	public Image getMemberImage(String memberId) {
		return wDAO.getMemberImage(sqlSession, memberId);
	}
	
	
	// 원팅 수정 - 신청 승인 거절
	@Override
	public int requestUpdateWanting(Wanting w) {
		return wDAO.requestUpdateWanting(sqlSession, w);
	}
	
	@Override
	public int rejectUpdateWanting(int wantingNum) {
		return wDAO.rejectUpdateWanting(sqlSession, wantingNum);
	}

	@Override
	public int confirmUpdateWanting(int wantingNum) {
	return wDAO.confirmUpdateWanting(sqlSession, wantingNum);
	}
	
		
	// 원팅 삭제 - 신청 승인 거절
	@Override
	public int requestDeleteWanting(int wantingNum) {
		return wDAO.requestDeleteWanting(sqlSession, wantingNum);
	}
	
	@Override
	public int rejectDeleteWanting(int wantingNum) {
		return wDAO.rejectDeleteWanting(sqlSession, wantingNum);
	}

	@Override
	public int confirmDeleteWanting(int wantingNum) {
		return wDAO.confirmDeleteWanting(sqlSession, wantingNum);
	}


	// 마이페이지 원팅 - 참여한 원팅
	@Override
	public ArrayList<Integer> selectWantingNumList(String id) {
		return wDAO.selectWantingNumList(sqlSession, id);
	}

	@Override
	public ArrayList<Wanting> selectAttendWantList(PageInfo pi, ArrayList<Integer> wantingNumList) {
		return wDAO.selectAttentWantList(sqlSession, pi, wantingNumList);
	}

	
	// 마이페이지 원팅 - 작성한 원팅
	@Override
	public int getWantingWriteListCount(String id) {
		return wDAO.getWantingWriteListCount(sqlSession, id);
	}

	@Override
	public ArrayList<Wanting> selectWantingWriteList(PageInfo pi, String id) {
		return wDAO.selectWantingWriteList(sqlSession, pi, id);
	}

	
}
