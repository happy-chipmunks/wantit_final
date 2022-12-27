package com.kh.wantit.pay.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.pay.service.PayService;
import com.kh.wantit.pay.vo.PaySchedule;
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

	public int checkScheduled(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("payMapper.checkScheduled", map);
	}

	public int updateScheduleStatus(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("payMapper.updateScheduleStatus", map);
	}

	public ArrayList<String> getMerchantUId(SqlSessionTemplate sqlSession, int fundingNum) {
		return (ArrayList)sqlSession.selectList("payMapper.getMerchantUId", fundingNum);
	}

	public int updatePayStatus(SqlSessionTemplate sqlSession, Map<String, String> updateStatusMap) {
		System.out.println("dao map : " + updateStatusMap.toString());
		return sqlSession.update("payMapper.updatePayStatus", updateStatusMap);
	}

//	public int updatePayStatus(SqlSessionTemplate sqlSession, PaySchedule ps) {
//		return sqlSession.update("payMapper.updatePayStatus", ps);
//	}

}
