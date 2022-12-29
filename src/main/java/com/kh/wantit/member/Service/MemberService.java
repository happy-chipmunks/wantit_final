package com.kh.wantit.member.Service;

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

	

	

	

	

	

	
	

}
