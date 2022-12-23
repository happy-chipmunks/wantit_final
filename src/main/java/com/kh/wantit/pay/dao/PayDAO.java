package com.kh.wantit.pay.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.pay.service.PayService;
import com.kh.wantit.pay.vo.Reward;
import com.kh.wantit.pay.vo.TestMember;

@Repository
public class PayDAO {

	public TestMember loginTest(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("payMapper.testLogin");
	}

	public ArrayList<Reward> getRewardList(SqlSessionTemplate sqlSession, int fundingNum) {
		return (ArrayList)sqlSession.selectList("payMapper.getRewardList", fundingNum);
	}

	public String getFundingTitle(SqlSessionTemplate sqlSession, int fundingNum) {
		return sqlSession.selectOne("payMapper.getFundingTitle", fundingNum);
	}

	public void changeRewardSellCount(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		sqlSession.update("payMapper.changeRewardSellCount", map);
	}

	public int selectMerchantSequence(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("payMapper.selectMerchantSequence");
	}

	public void insertPaySchedule(SqlSessionTemplate sqlSession, Map<String, String> scheduleMap) {
		sqlSession.insert("payMapper.insertPaySchedule", scheduleMap);
		
	}

}
