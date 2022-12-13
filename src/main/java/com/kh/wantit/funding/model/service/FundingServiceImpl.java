package com.kh.wantit.funding.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.funding.model.dao.FundingDAO;

@Service
public class FundingServiceImpl {

	@Autowired
	private FundingDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
