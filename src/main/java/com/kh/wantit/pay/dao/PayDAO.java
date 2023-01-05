package com.kh.wantit.pay.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.funding.model.vo.Funding;
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

	public Funding getFundingInfo(SqlSessionTemplate sqlSession, int fundingNum) {
		return sqlSession.selectOne("payMapper.getFundingInfo", fundingNum);
	}

	public ArrayList<PaySchedule> selectPayList(SqlSessionTemplate sqlSession, PageInfo pi, String userNickName) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("payMapper.selectPayList", userNickName, rowBounds);
	}

	public int getPayListCount(SqlSessionTemplate sqlSession, String userNickName) {
		return sqlSession.selectOne("payMapper.getPayListCount", userNickName);
	}


//	public int updatePayStatus(SqlSessionTemplate sqlSession, PaySchedule ps) {
//		return sqlSession.update("payMapper.updatePayStatus", ps);
//	}

}
