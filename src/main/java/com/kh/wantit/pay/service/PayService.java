package com.kh.wantit.pay.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.pay.dao.PayDAO;
import com.kh.wantit.pay.vo.PaySchedule;
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

	public int checkScheduled(Map<String, String> map) {
		return pDAO.checkScheduled(sqlSession, map);
	}

	public int updateScheduleStatus(Map<String, String> map) {
		return pDAO.updateScheduleStatus(sqlSession, map);
	}

	public ArrayList<String> getMerchantUId(int fundingNum) {
		return pDAO.getMerchantUId(sqlSession, fundingNum);
	}

	public int updatePayStatus(Map<String, String> updateStatusMap) {
		return pDAO.updatePayStatus(sqlSession, updateStatusMap);
	}

	public Funding getFundingInfo(int fundingNum) {
		return pDAO.getFundingInfo(sqlSession, fundingNum);
	}

	public ArrayList<PaySchedule> selectPayList(PageInfo pi, String userNickName) {
		return pDAO.selectPayList(sqlSession, pi, userNickName);
	}

	public int getPayListCount(String userNickName) {
		return pDAO.getPayListCount(sqlSession, userNickName);
	}

	public void updateCurrentMoney(Map<String, Integer> updateCurrentMoneyMap) {
		pDAO.updateCurrentMoney(sqlSession, updateCurrentMoneyMap);
	}

	public void rollBackSellCount(Reward r) {
		pDAO.rollBackSellCount(sqlSession, r);
	}


//	public int updatePayStatus(PaySchedule ps) {
//		return pDAO.updatePayStatus(sqlSession, ps);
//	}
}
