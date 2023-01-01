package com.kh.wantit.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.Reward;

@Repository("fDAO")
public class FundingDAO {

	public int insertFunding(Funding f, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertFunding", f);
	}

	public int insertImage(Image i, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertImage", i);
	}

	public ArrayList<Funding> fundingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.fundingList");
	}

	public ArrayList<Funding> searchFundingList(SqlSessionTemplate sqlSession, String searchText) {
		return (ArrayList)sqlSession.selectList("fundingMapper.searchFundingList", searchText);
	}

	public String getCreatorName(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("fundingMapper.getCreatorName", id);
	}

	public ArrayList<Image> fundingImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.fundingImageList");
	}

	public int insertReward(Reward r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertReward", r);
	}

	public int getCreatorNum(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getCreatorNum", id);
	}

	public String checkWriter(SqlSessionTemplate sqlSession, int creatorNum) {
		return sqlSession.selectOne("fundingMapper.checkWriter", creatorNum);
	}

	public Funding getFunding(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("fundingMapper.getFunding", bId);
	}

	public ArrayList<Image> getImage(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getImage", bId);
	}

	public int addCount(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("fundingMapper.addCount", bId);
	}
	
	
}
