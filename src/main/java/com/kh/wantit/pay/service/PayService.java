package com.kh.wantit.pay.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.pay.dao.PayDAO;
import com.kh.wantit.pay.vo.Reward;
import com.kh.wantit.pay.vo.TestMember;

@Service
public class PayService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PayDAO pDAO;

	public TestMember loginTest() {
		return pDAO.loginTest(sqlSession);
	}

	public ArrayList<Reward> getRewardList(int fundingNum) {
		return pDAO.getRewardList(sqlSession, fundingNum);
	}

	public String getFundingTitle(int fundingNum) {
		return pDAO.getFundingTitle(sqlSession, fundingNum);
	}

	public void changeRewardSellCount(Map<String, Integer> map) {
		pDAO.changeRewardSellCount(sqlSession, map);
	}

	public int selectMerchantSequence() {
		return pDAO.selectMerchantSequence(sqlSession);
	}

	public void insertPaySchedule(Map<String, String> scheduleMap) {
		pDAO.insertPaySchedule(sqlSession, scheduleMap);
	}
}
