package com.kh.wantit.funding.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
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

//	public int insertReward(Reward r, SqlSessionTemplate sqlSession) {
//		return sqlSession.insert("fundingMapper.insertReward", r);
//	}

	public int getCreatorNum(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getCreatorNum", id);
	}

	public String checkWriter(SqlSessionTemplate sqlSession, int creatorNum) {
		return sqlSession.selectOne("fundingMapper.checkWriter", creatorNum);
	}

	public Funding getFunding(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("fundingMapper.getFunding", bId);
	}

	public Image getImage(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("fundingMapper.getImage", bId);
	}

	public int addCount(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("fundingMapper.addCount", bId);
	}

	public String getFundingCreator(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getFundingCreator", bId);
	}

	public int insertFundingNotice(FundingNotice fn, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertFundingNotice", fn);
	}

	public ArrayList<FundingNotice> fundingNoticeList(int bId, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.fundingNoticeList", bId);
	}

	public int fnListCount(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.fnListCount", bId);
	}

	public int addNoticeCount(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("fundingMapper.addNoticeCount", bId);
	}

	public FundingNotice getFundingNotice(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getFundingNotice", bId);
	}

	public int insertReward(Reward r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertReward", r);
	}

	public Funding getCurrFunding(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getCurrFunding", bId);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("fundingMapper.insertReview", review);
	}

	public int checkExistReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("fundingMapper.checkExistReview", r);
	}

	
}
