package com.kh.wantit.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int enroll(SqlSessionTemplate sqlSession, Member member) {
		return  sqlSession.insert("memberMapper.enroll", member);
	}

	
	  public Member login(SqlSessionTemplate sqlSession, Member member) {
	   return sqlSession.selectOne("memberMapper.login", member); 
	   }


	public int checkUsername(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.checkUsername",userName);
	}


	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName",nickName);
	}


	
	  public int updateInfo(SqlSessionTemplate sqlSession, Member member) { 
	  return  sqlSession.update("memberMapper.updateInfo", member); }


	public int deleteMember(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.update("memberMapper.deleteMember", userName);
	}


	public Member findmemberId(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findmemberId",member);
	}

	public int creatorInsert(Creator c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.creatorInsert", c);
	}


	public Member creatorCheck(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.creatorCheck", id);
	}

	public int businessLicense(Image i, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.businessLicense", i);
	}


	public Creator creatorRegistration(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.creatorRegistration", id);
	}


	public Member findcheckPwd(SqlSessionTemplate sqlSession, Member findPwd) {
		return sqlSession.selectOne("memberMapper.findcheckPwd",findPwd);
	}


	public Member selectMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectMember",email);
	}


	public int checkMember(SqlSessionTemplate sqlSession, Member checkIdemail) {
		return sqlSession.selectOne("memberMapper.checkMember",checkIdemail);
	}


	public int updateenPwd(SqlSessionTemplate sqlSession, Member updatePwd) {
		return sqlSession.update("memberMapper.updateenPwd",updatePwd);
	}





	

	


	
	 
	 
	

	

}
