package com.kh.wantit.member.Service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.member.dao.MemberDAO;
import com.kh.wantit.member.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int enroll(Member member) {
		return mDAO.enroll(sqlSession, member);

	}

	
	  @Override public Member login(Member member) {
		  return mDAO.login(sqlSession,member); }


	@Override
	public int checkUserName(String userName) {
		return mDAO.checkUsername(sqlSession, userName);
	}


	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession,nickName);
	}


	@Override
	public void certifiedmemberPhone(String Phone, String numStr) {
		
		String api_key= "NCSREFNZBR3HJR61";
		String api_secret = "0LSG4VVE0E4OGEPECFFPEMDTOCCJG7NY";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new  HashMap<String, String>();
		params.put("to", "Phone");
		params.put("from", "01072211074");
		params.put("type", "SMS");
		params.put("text", "[WANTIT] WANTIT 회원 인증번호"+ "["+numStr+"]"+"를 입력해주세요.");
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj =(JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
			
	}


	@Override
	public int updateInfo(Member member) {
		return mDAO.updateInfo(sqlSession,member); 
		
	}


	@Override
	public int deleteMember(String userName) {
		return mDAO.deleteMember(sqlSession,userName);
	}

	//ID 찾는 로직
	@Override
	public Member findmemberId(Member member) {
		return mDAO.findmemberId(sqlSession,member);
	}

	


	
	
	 

 


}
