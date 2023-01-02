package com.kh.wantit.wanting.model.service;

import java.util.ArrayList;

import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
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
	ArrayList<WantingAttend> getMemberList(int wantingNum);

	int sendAlarm(Alarm alarm);
	
	// 원팅 삭제 및 수정
	int deleteWanting(int wantingNum);



	

	

}
