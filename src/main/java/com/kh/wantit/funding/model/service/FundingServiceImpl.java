package com.kh.wantit.funding.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.dao.FundingDAO;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.funding.model.vo.Reward;

@Service("fService")
public class FundingServiceImpl implements FundingService{

	@Autowired
	private FundingDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFunding(Funding f) {
		return fDAO.insertFunding(f, sqlSession);
	}

	@Override
	public int insertImage(Image i) {
		return fDAO.insertImage(i, sqlSession);
	}

	@Override
	public ArrayList<Funding> fundingList() {
		return fDAO.fundingList(sqlSession);
	}
	
	@Override
	public ArrayList<Funding> searchFundingList(String searchText) {
		return fDAO.searchFundingList(sqlSession, searchText);
	}

	@Override
	public String getCreatorName(String id) {
		return fDAO.getCreatorName(sqlSession, id);
	}

	@Override
	public ArrayList<Image> fundingImageList() {
		return fDAO.fundingImageList(sqlSession);
	}

	@Override
	public int getCreatorNum(String id) {
		return fDAO.getCreatorNum(id, sqlSession);
	}

	@Override
	public String checkWriter(int creatorNum) {
		return fDAO.checkWriter(sqlSession, creatorNum);
	}

	@Override
	public Funding getFunding(int bId, boolean yn) {
		int result = 0;
		if(yn) {
			result = fDAO.addCount(bId, sqlSession);
		}
		return fDAO.getFunding(sqlSession, bId);
	}

	@Override
	public Image getImage(int bId) {
		return fDAO.getImage(sqlSession, bId);
	}

	@Override
	public String getFundingCreator(int bId) {
		return fDAO.getFundingCreator(bId, sqlSession);
	}

	@Override
	public int insertFundingNotice(FundingNotice fn) {
		return fDAO.insertFundingNotice(fn, sqlSession);
	}

	@Override
	public ArrayList<FundingNotice> fundingNoticeList(int bId) {
		return fDAO.fundingNoticeList(bId, sqlSession);
	}

	@Override
	public int fnListCount(int bId) {
		return fDAO.fnListCount(bId, sqlSession);
	}

	@Override
	public FundingNotice getFundingNotice(int bId, boolean yn) {
		int result = 0;
		if(yn) {
			result = fDAO.addNoticeCount(bId, sqlSession);
		}
		return fDAO.getFundingNotice(bId, sqlSession);
	}

	@Override
	public int insertReward(Reward r) {
		return fDAO.insertReward(r, sqlSession);
	}

	@Override
	public Funding getCurrFunding(int bId) {
		return fDAO.getCurrFunding(bId, sqlSession);
	}
	
	@Override
	public int insertReview(Review review) {
		return fDAO.insertReview(sqlSession, review);
	}
	
	@Override
	public int checkExistReview(Review r) {
		return fDAO.checkExistReview(sqlSession, r);
	}
	
}
