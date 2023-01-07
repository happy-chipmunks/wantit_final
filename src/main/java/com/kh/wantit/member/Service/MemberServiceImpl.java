package com.kh.wantit.member.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.common.model.vo.CreatorImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.member.dao.MemberDAO;
import com.kh.wantit.member.vo.Creator;
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


	@Override
	public int creatorInsert(Creator c) {
		return mDAO.creatorInsert(c, sqlSession);
	}


	@Override
	public Member creatorCheck(String id) {
		return mDAO.creatorCheck(id, sqlSession);
	}


	@Override
	public int businessLicense(Image i) {
		return mDAO.businessLicense(i, sqlSession);
	}


	@Override
	public Creator creatorRegistration(String id) {
		return mDAO.creatorRegistration(id, sqlSession);
	}

	public Member findcheckPwd(Member findPwd) {
		return mDAO.findcheckPwd(sqlSession,findPwd);
	}


	@Override
	public Member selectMember(String email) {
		return mDAO.selectMember(sqlSession,email);
	}


	@Override
	public int checkMember(Member checkIdemail) {
		return mDAO.checkMember(sqlSession,checkIdemail);
	}


	@Override
	public int updateenPwd(Member updatePwd) {
		return mDAO.updateenPwd(sqlSession,updatePwd);
	}


	@Override
	public int insertmemberImage(Image m) {
		return mDAO.insertmemberImage(sqlSession,m);
	}

	@Override
	public Image selectImage(Image image) {
		return mDAO.selectImage(sqlSession, image);
	}
	
	@Override
	public ArrayList<Integer> allProfileImage(String id) {
		return mDAO.allProfileImage(sqlSession, id);
	}

	@Override
	public ArrayList<CreatorImage> selectCreatorImageList(ArrayList<Integer> memberIds) {
		return mDAO.selectCreatorImageList(sqlSession, memberIds);
	}


	


	@Override
	public int insertcreatorImage(Image cm) {//크리에이터 사진등록
		return mDAO.insertcreatorImage(sqlSession,cm);
	}


	@Override
	public Image selectcreatorImage(Image image) {//크리에이터 사진불러오기
		return mDAO.selectcreatorImage(sqlSession, image);
	}


	@Override
	public Image selectcImage(Image cimage) {
		return mDAO.selectcImage(sqlSession, cimage);
	}

	@Override
	public int deletesupImg(String filedelete) {//마이페이지 서포터프로필 삭제
		return mDAO.deletesupImg(sqlSession,filedelete);
	}


	@Override
	public int deleteboforeImage(Image m) {
		return mDAO.deleteboforeImage(sqlSession,m);
	}


	@Override
	public int deleteboforecImage(Image cm) {
		return mDAO.deleteboforecImage(sqlSession,cm);
	}
	
	@Override
	public int getImageNum(Image img) {
		return mDAO.getImageNum(sqlSession, img);
	}



	


	


	
	

	





	


	


	


	

	


	

	


	
	
	 

 


}
