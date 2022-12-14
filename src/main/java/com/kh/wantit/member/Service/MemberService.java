package com.kh.wantit.member.Service;

import com.kh.wantit.member.vo.Member;

public interface MemberService {

	int enroll(Member member);

	 Member login(Member member);

	int checkUserName(String userName);

	int checkNickName(String nickName);

	void certifiedPhoneNumber(String userPhoneNumber, int randomNumber); 

	

	

	

	
	

}
