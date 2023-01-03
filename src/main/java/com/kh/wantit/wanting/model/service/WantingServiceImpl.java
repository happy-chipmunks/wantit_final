package com.kh.wantit.wanting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
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
	public ArrayList<WantingAttend> getMemberList(int wantingNum) {
		return wDAO.getMemberList(sqlSession, wantingNum);
	}
	
	public int sendAlarm (Alarm alarm) {
		return wDAO.sendAlarm(sqlSession, alarm);
	}
	
	
	// 원팅 검색
	@Override
	public ArrayList<Wanting> searchWantingList(String searchText) {
		return wDAO.searchWantingList(sqlSession, searchText);
	}

	
	// 회원 전체 알림 가져오기
	@Override
	public ArrayList<Alarm> selectAlarmList(String id) {
		return wDAO.selectAlarmList(sqlSession, id);
	}
	

	// 회원 알림 확인하기
	@Override
	public int checkAlarm(int alarmNum) {
		return wDAO.checkAlarm(sqlSession, alarmNum);
	}
	
	
	// 원팅 수정 및 삭제
	@Override
	public int updateWanting(Wanting w) {
		return wDAO.updateWanting(sqlSession, w);
	}

	@Override
	public int deleteWanting(int wantingNum) {
		return wDAO.deleteWanting(sqlSession, wantingNum);
	}
		



	
}
