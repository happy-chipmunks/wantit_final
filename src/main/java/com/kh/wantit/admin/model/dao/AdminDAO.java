package com.kh.wantit.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.FundingReport;
import com.kh.wantit.admin.model.vo.NReply;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Member;

@Repository("aDAO")
public class AdminDAO {

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllMember", i, rowBounds);
	}
	
	public ArrayList<Member> selectNewMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewMember");
	}

	public int selectNewMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectNewMemberCount");
	}

	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCount", i);
	}
	
	public int getListCountI(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCountI", i);
	}
	
	public int getListCountN(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCountN", i);
	}
	
	public int getListCountA(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCountA", i);
	}
	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteMember", id);
	}

	public ArrayList<AdminInquiry> selectAllInquiry(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllInquiry", i, rowBounds);

	}

	public int answerContent(SqlSessionTemplate sqlSession, Reply reeply) {
		return sqlSession.update("adminMapper.answerContent", reeply);
	}

	public ArrayList<Ads> selectAllAds(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllAds", i, rowBounds);
	}

	public ArrayList<Image> selectAllImage(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllImage", i);
	}

//	public ArrayList<Notice> selectAllNotice(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("adminMapper.selectAllNotice", i , rowBounds);
//	}
//	
//	public ArrayList<Notice> selectAllEvent(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("adminMapper.selectAllEvent", i, rowBounds);
//	}
	
	public ArrayList<Notice> selectAllwrite(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllwrite", i, rowBounds);
	}
//	public int getAccept(SqlSessionTemplate sqlSession, int acceptDivision) {
//		return sqlSession.update("adaminMapper.getAccept", acceptDivision);
//	}

	public int answerContentN(SqlSessionTemplate sqlSession, NReply reeply) {
		return sqlSession.update("adminMapper.answerContentN", reeply);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteNotice", id);
	}

	public int selectNewWrite(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.selectNewWrite", n);
	}

	public int getListCountRR(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCountRR", i);
	}

	public int getListCountRF(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCountRF", i);
	}

	public ArrayList<ReviewReport> selectReviewReport(SqlSessionTemplate sqlSession, PageInfo piR, int i) {
		int offset = (piR.getCurrentPage() - 1) * piR.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, piR.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectReviewReport", i, rowBounds);
	}
	
	public ArrayList<FundingReport> selectFundingReport(SqlSessionTemplate sqlSession, PageInfo piF, int i) {
		int offset = (piF.getCurrentPage() - 1) * piF.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, piF.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectFundingReport", i, rowBounds);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteReview", id);
	}
	public int deleteFunding(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteFunding", id);
	}
	
}
