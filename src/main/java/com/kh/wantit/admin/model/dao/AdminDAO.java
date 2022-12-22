package com.kh.wantit.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.member.vo.Member;

@Repository("aDAO")
public class AdminDAO {

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllMember", i, rowBounds);
	}
	
	public ArrayList<Member> selectNewMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewMember");
	}

	public int selectNewMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectNewMemberCount");
	}

	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCount", i);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteMember", id);
	}

	public ArrayList<AdminInquiry> selectAllInquiry(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllInquiry", i, rowBounds);

	}

	public int answerContent(SqlSessionTemplate sqlSession, Reply reeply) {
		return sqlSession.update("adminMapper.answerContent", reeply);
	}

	public ArrayList<Ads> selectAllAds(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllAds", i, rowBounds);
	}

}
