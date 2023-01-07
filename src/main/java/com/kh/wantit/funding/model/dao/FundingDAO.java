package com.kh.wantit.funding.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingDibs;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;

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

	public ArrayList<Funding> searchFundingList(SqlSessionTemplate sqlSession, Map<String, String> searchMap) {
		return (ArrayList)sqlSession.selectList("fundingMapper.searchFundingList", searchMap);
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

	public ArrayList<FundingNotice> getFundingNotice(String writer, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingNotice", writer);
	}

	public int insertReward(Reward r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertReward", r);
	}

	public Funding getCurrFunding(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getCurrFunding", bId);
	}

	public int getFundingCreatorNum(String writer, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getFundingCreatorNum", writer);
	}
	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("fundingMapper.insertReview", review);
	}

	public ArrayList<Reward> fundingRewardList(int bId, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.fundingRewardList", bId);
	}
	public int checkExistReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("fundingMapper.checkExistReview", r);
	}

	
	public Funding getFundingInfo(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getFundingInfo", bId);
	}

	public int fundingEdit(Funding f, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.fundingEdit", f);
	}

	public int getListCountR(int fundingNum, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getListCountR", fundingNum);
	}
	
	public ArrayList<Review> getFundingReview(int fundingNum, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingReview", fundingNum, rowBounds);
	}

	public ArrayList<PaySchedule> getPayList(int fundingNum, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getPayList", fundingNum);
	}

	public int getSupportCount(int fundingNum, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getSupportCount", fundingNum);
	}

	public int getReviewCount(int fundingNum, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getReviewCount", fundingNum);
	}

	public ArrayList<Funding> getFundingIngListRanking(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingIngListRanking");
	}

	public ArrayList<Funding> getFundingEndLatest(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingEndLatest");
	}

	public ArrayList<Funding> getFundingEndRanking(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingEndRanking");
	}

	public int insertDibs(FundingDibs dibs, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("fundingMapper.insertDibs", dibs);
	}

	public int deleteDibs(FundingDibs dibs, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("fundingMapper.deleteDibs", dibs);
	}

	public ArrayList<Member> getReviewerNickName(Integer fundingNum, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getReviewerNickName", fundingNum);
	}

	public int getDibsCount(int bId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.getDibsCount", bId);
	}

	public ArrayList<FundingDibs> getDibs(int bId, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getDibs", bId);
	}

	public int fundingConfirmUpdate(int fundingNum, SqlSessionTemplate sqlSession) {
		return sqlSession.update("fundingMapper.fundingConfirmUpdate", fundingNum);
	}
	public ArrayList<Funding> getMyFundingList(SqlSessionTemplate sqlSession, String nickName) {
		return (ArrayList)sqlSession.selectList("fundingMapper.getMyFundingList", nickName);
	}

	public ArrayList<Funding> popularList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.popularList");
	}

	public ArrayList<Funding> sortList(SqlSessionTemplate sqlSession, String sortType) {
		return (ArrayList)sqlSession.selectList("fundingMapper.sortList", sortType);
	}

	public ArrayList<Funding> sortCateList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("fundingMapper.sortCateList", cate);
	}

	
	
}
