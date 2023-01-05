﻿package com.kh.wantit.member.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wantit.common.model.vo.CreatorImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;

public interface MemberService {

	int enroll(Member member);

	 Member login(Member member);

	int checkUserName(String userName);

	int checkNickName(String nickName);

	void certifiedmemberPhone(String Phone, String numStr);

	 int updateInfo(Member member);

	int deleteMember(String userName);

	Member findmemberId(Member member);

	int creatorInsert(Creator c);

	Member creatorCheck(String id);

	int businessLicense(Image i);

	Creator creatorRegistration(String id);

	Member findcheckPwd(Member findPwd);

	Member selectMember(String email);

	int checkMember(Member checkIdemail);

	int updateenPwd(Member updatePwd);

	int insertmemberImage(Image m);

	Image selectImage(Image image);

	ArrayList<Integer> allProfileImage(String id);

	ArrayList<CreatorImage> selectCreatorImageList(ArrayList<Integer> memberIds);

	int insertcreatorImage(Image cm);//크리에이터 사진등록

	Image selectcreatorImage(Image image);//크리에이터 사진 불러오기

	Image selectcImage(Image cimage);//크리에이터 사진 가져오기 로그인할때

	int deletesupImg(String filedelete);//마이페이지 서포터 프로필 삭제

	int deleteboforeImage(Image m);

	int deleteboforecImage(Image cm);

	

	
	


	



	



	

	

	

	

	

	

	

	

	

	

	

	

	

	
	

}
