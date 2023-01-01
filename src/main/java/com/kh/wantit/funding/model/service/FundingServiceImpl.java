package com.kh.wantit.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.dao.FundingDAO;
import com.kh.wantit.funding.model.vo.Funding;
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
	public int insertReward(Reward r) {
		return fDAO.insertReward(r, sqlSession);
	}

	@Override
	public int getCreatorNum(String id) {
		return fDAO.getCreatorNum(id, sqlSession);
	}
}
