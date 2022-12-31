package com.kh.wantit.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;

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
	
	
}
