package com.kh.wantit.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.member.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int enroll(SqlSessionTemplate sqlSession, Member member) {
		return  sqlSession.insert("memberMapper.enroll", member);
	}

	

	

}
