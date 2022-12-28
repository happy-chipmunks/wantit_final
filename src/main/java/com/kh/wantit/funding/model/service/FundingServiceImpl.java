package com.kh.wantit.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.dao.FundingDAO;
import com.kh.wantit.funding.model.vo.Funding;

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
}
