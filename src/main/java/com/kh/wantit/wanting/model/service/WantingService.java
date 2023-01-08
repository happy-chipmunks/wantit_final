package com.kh.wantit.wanting.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingAttend;

public interface WantingService {
	
	// 원팅 게시글 작성
	int insertWanting(Wanting w);

	int insertImage(Image img);

	// 원팅 리스트 불러오기
	ArrayList<Wanting> selectWantingList();

	ArrayList<Wanting> selectWantingListPopular();

	ArrayList<Image> selectImageList();
	

	// 원팅 게시글 상세보기
	Wanting selectWanting(int wantingNum);

	ArrayList<Image> selectImage(int wantingNum);

	int getWantingYN(WantingAttend join);

	// 원팅 참여하기
	int attendWanting(WantingAttend join);

	int getWantingCount(int wantingNum);

	int updateWantingStatus(Wanting w);
	
	// 원팅 달성 알림 보내기
	ArrayList<WantingAttend> getWantingAttendList(int wantingNum);

	int sendAlarm(Alarm alarm);
	
	// 원팅 검색
	ArrayList<Wanting> searchWantingList(Map<String, String> searchMap);
	
	// 회원 전체 알림 가져오기
	ArrayList<Alarm> selectAlarmList(String id);
	
	// 회원 알림 확인하기
	int checkAlarm(int alarmNum);
	
	// 원팅 참여자 리스트 - 아이디로 맴버 가져오기
	Member getMember(String memberId);
	
	// 원팅 참여자 리스트 - 아이디로 이미지 가져오기
	Image getMemberImage(String memberId);

	// 원팅 수정 - 신청 승인 거절
	int requestUpdateWanting(Wanting w);

	int rejectUpdateWanting(int wantingNum);

	int confirmUpdateWanting(int wantingNum);
	
	// 원팅 삭제 - 신청 승인 거절
	int requestDeleteWanting(int wantingNum);

	int rejectDeleteWanting(int wantingNum);

	int confirmDeleteWanting(int wantingNum);
	ArrayList<Integer> selectWantingNumList(String id);

	ArrayList<Wanting> selectAttendWantList(PageInfo pi, ArrayList<Integer> wantingNumList);



	

	
}
