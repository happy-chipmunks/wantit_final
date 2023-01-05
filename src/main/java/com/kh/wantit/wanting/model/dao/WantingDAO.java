package com.kh.wantit.wanting.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingAttend;

@Repository("wDAO")
public class WantingDAO {

	// 원팅 게시글 작성
	public int insertWanting(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.insert("wantingMapper.insertWanting", w);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("wantingMapper.insertImage", img);
	}

	
	// 원팅 리스트 불러오기
	public ArrayList<Wanting> selectWantingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectWantingList");
	}

	public ArrayList<Wanting> selectWantingListPopular(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectWantingListPopular");
	}

	public ArrayList<Image> selectImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectImageList");
	}
	
	
	// 원팅 게시글 상세보기
	public Wanting selectWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.selectOne("wantingMapper.selectWanting", wantingNum);
	}

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int wantingNum) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectImage", wantingNum);
	}

	public int getWantingYN(SqlSessionTemplate sqlSession, WantingAttend join) {
		return sqlSession.selectOne("wantingMapper.getWantingYN", join);
	}
	
	
	// 원팅 참여하기
	public int attendWanting(SqlSessionTemplate sqlSession, WantingAttend join) {
		return sqlSession.insert("wantingMapper.attendWanting", join);
	}
	
	public int getWantingCount(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.selectOne("wantingMapper.getWantingCount", wantingNum);
	}

	public int updateWantingStatus(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.update("wantingMapper.updateWantingStatus", w);
	}

	
	// 원팅 달성 알림 보내기
	public ArrayList<WantingAttend> getWantingAttendList(SqlSessionTemplate sqlSession, int wantingNum) {
		return (ArrayList)sqlSession.selectList("wantingMapper.getWantingAttendList", wantingNum);
	}

	public int sendAlarm(SqlSessionTemplate sqlSession, Alarm alarm) {
		return sqlSession.insert("wantingMapper.sendAlarm", alarm);
	}

	
	// 원팅 검색
	public ArrayList<Wanting> searchWantingList(SqlSessionTemplate sqlSession, String searchText) {
		return (ArrayList)sqlSession.selectList("wantingMapper.searchWantingList", searchText);
	}	
	
	
	// 회원 전체 알림 가져오기
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectAlarmList", id);
	}
	
	
	// 회원 알림 확인하기
	public int checkAlarm(SqlSessionTemplate sqlSession, int alarmNum) {
		return sqlSession.update("wantingMapper.checkAlarm", alarmNum);
	}
	
	
	// 원팅 참여자 리스트 - 아이디로 맴버 가져오기
	public Member getMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("wantingMapper.getMember", memberId);
	}
	

	// 원팅 수정 - 신청 승인 거절
	public int requestUpdateWanting(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.insert("wantingMapper.requestUpdateWanting", w);
	}
	
	public int rejectUpdateWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		int result1 = sqlSession.update("wantingMapper.rejectUpdateWanting", wantingNum);
		//int result2 = sqlSession.update("wantingMapper.rejectUpdateWantinStatus", wantingNum);
		int result3 = sqlSession.update("wantingMapper.rejectUpdateWantingDelete", wantingNum);
		return (result1 + result3);		
	}

	public int confirmUpdateWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		int result1 = sqlSession.update("wantingMapper.confirmUpdateWanting", wantingNum);
		int result2 = sqlSession.update("wantingMapper.confirmUpdateWantingStatus", wantingNum);
		int result3 = sqlSession.update("wantingMapper.confirmUpdateWantingDelete", wantingNum);
		return (result1 + result2 + result3);		
	}
	

	// 원팅 삭제 - 신청 승인 거절
	public int requestDeleteWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.update("wantingMapper.requestDeleteWanting", wantingNum);
	}
	
	public int rejectDeleteWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.update("wantingMapper.rejectDeleteWanting", wantingNum);
	}
	
	public int confirmDeleteWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.update("wantingMapper.confirmDeleteWanting", wantingNum);
	}

	public int dfd(SqlSessionTemplate sqlSession, int wantingNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	public ArrayList<Integer> selectWantingNumList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectWantingNumList", id);
	}

	public ArrayList<Wanting> selectAttentWantList(SqlSessionTemplate sqlSession, PageInfo pi, ArrayList<Integer> wantingNumList) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("wantingMapper.selectAttendWantList", wantingNumList, rowBounds);
	}


	





}
