﻿package com.kh.wantit.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.admin.model.vo.AFunding;
import com.kh.wantit.admin.model.vo.AdReply;
import com.kh.wantit.admin.model.vo.AddReply;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.CReply;
import com.kh.wantit.admin.model.vo.EdReply;
import com.kh.wantit.admin.model.vo.FundingReport;
import com.kh.wantit.admin.model.vo.NReply;
import com.kh.wantit.admin.model.vo.NoReply;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingEdit;
import com.kh.wantit.member.vo.Creator;
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


	public ArrayList<Creator> creatorApproval(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.creatorApproval");
	}

	public ArrayList<Image> businessImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.businessImage");
	}

	public ArrayList<Image> selectAdImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdImage");
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
		return sqlSession.delete("adminMapper.deleteNotice", id);
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

		public ArrayList<Integer> getListCountPM(SqlSessionTemplate sqlSession, int i) {
			return (ArrayList)sqlSession.selectList("adminMapper.getListCountPM", i);
		}

	public ArrayList<AFunding> selectOkList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectOkList", i, rowBounds);
	}

	public int updateMemberType(SqlSessionTemplate sqlSession, String changeId) {
		return sqlSession.update("adminMapper.updateMemberType", changeId);
	}
	public ArrayList<AFunding> projectApproval(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.projectApproval");
	}

	public int deleteCreator(String delCreator, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("adminMapper.deleteCreator", delCreator);
	}

	public int updateCreatorType(String delCreator, SqlSessionTemplate sqlSession) {
		return sqlSession.update("adminMapper.updateCreatorType", delCreator);
	}

	public ArrayList<BannerImage> selectBannerImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBannerImageList");
	}
	
	
	public int okProjectW(SqlSessionTemplate sqlSession, String id) {
//		System.out.println("daoW"+id);
		int result = sqlSession.update("adminMapper.okProjectW", id);
//		System.out.println("w result = " + result);
		return result;
	}
	
	public int okProjectF(SqlSessionTemplate sqlSession, String id) {
//		System.out.println("daoF"+id);
		int result = sqlSession.update("adminMapper.okProjectF", id);
//		System.out.println("f result = " + result);
		return result;
	}
	
	public int noProjectW(SqlSessionTemplate sqlSession, String id) {
//		System.out.println("daoW"+id);
		int result = sqlSession.update("adminMapper.noProjectW", id);
//		System.out.println("w result = " + result);
		return result;
	}
	
	public int noProjectF(SqlSessionTemplate sqlSession, String id) {
//		System.out.println("daoF"+id);
		int result = sqlSession.update("adminMapper.noProjectF", id);
//		System.out.println("f result = " + result);
		return result;
	}

	public int noEditProjectF(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("adminMapper.noEditProjectF", id);
	}
	
	public int noEditProjectW(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("adminMapper.noEditProjectW", id);
	}

	public int okEditProjectF(CReply cr, SqlSessionTemplate sqlSession) {
		int result = sqlSession.update("adminMapper.okEditPro", cr);
		return sqlSession.update("adminMapper.okEditProjectF", cr);
	}
	public int insertImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("adminMapper.insertImage", img);
	}

	public ArrayList<Notice> allNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.allNotice");
	}

	public ArrayList<Notice> editNotice(SqlSessionTemplate sqlSession, String code) {
		return (ArrayList)sqlSession.selectList("adminMapper.editNotice", code);
	}

	public String checkCode(SqlSessionTemplate sqlSession, String code) {
		return sqlSession.selectOne("adminMapper.checkCode", code);
	}

	public int addCount(String code, SqlSessionTemplate sqlSession) {
		return sqlSession.update("adminMapper.addCount", code);
	}

	public Notice getNotice(SqlSessionTemplate sqlSession, String code) {
		return sqlSession.selectOne("adminMapper.getNotice", code); 
	}

	public Image getImage(SqlSessionTemplate sqlSession, String code) {
		return sqlSession.selectOne("adminMapper.getImage", code);
	}

	
	public ArrayList<Image> selectNoticeImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeImage");
	}

	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNum) {
		return sqlSession.selectOne("adminMapper.selectNotice", noticeNum);
	}

	public String getImageBoardId(SqlSessionTemplate sqlSession, int imageNum) {
		return sqlSession.selectOne("adminMapper.getImageBoardId", imageNum);
	}

	public Funding getFundingInfo(SqlSessionTemplate sqlSession, int imageBoardId) {
		return sqlSession.selectOne("adminMapper.getFundingInfo", imageBoardId);
	}

	public int insertAds(SqlSessionTemplate sqlSession, Ads ads) {
		return sqlSession.insert("adminMapper.insertAds", ads);
	}

	public int insertBannerImage(SqlSessionTemplate sqlSession, BannerImage bi) {
		return sqlSession.insert("adminMapper.insertBannerImage", bi);
	}
	public int noEditProjectFF(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.update("adminMapper.noEditProjectFF", id);
	}
	
	public int noEditProjectWW(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.update("adminMapper.noEditProjectWW", id);
	}
//	public int okEditProjectW(int id, SqlSessionTemplate sqlSession) {
//		int result = sqlSession.update("adminMapper.okEditProW", id);
//		return sqlSession.update("adminMapper.okEditProjectW", id);
//	}
//
//	public Notice selectNoticeDetail(SqlSessionTemplate sqlSession, NoReply nr) {
//		return sqlSession.selectOne("adminMapper.selectNoticeDetail", nr);
//	}
//
//	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int code) {
//		return (ArrayList) sqlSession.selectList("adminMapper.selectImage", code);
//	}
//
//
//	public int confirmNotice(SqlSessionTemplate sqlSession, EdReply er) {
//		return sqlSession.update("adminMapper.confirmNotice", er);
//	}

	public int refuseAd(SqlSessionTemplate sqlSession, AdReply ar) {
		return sqlSession.delete("adminMapper.refuseAd", ar);
	}

	public int refuseAdImage(SqlSessionTemplate sqlSession, AdReply ar) {
		return sqlSession.delete("adminMapper.refuseAdImage", ar);
	}

	public int confirmAd(SqlSessionTemplate sqlSession, AddReply ar) {
		return sqlSession.update("adminMapper.confirmAd", ar);
	}

	public int successEdit(SqlSessionTemplate sqlSession, String id) {
		int result = sqlSession.delete("adminMapper.successEdit", id);
		return result;
	}

	public int failEdit(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("adminMapper.failEdit", id);
	}

	public int failEditWW(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.update("adminMapper.failEditWW", id);
	}

	public int confirmAdImage(SqlSessionTemplate sqlSession, AddReply ar) {
		return sqlSession.update("adminMapper.confirmAdImage", ar);
	}

	public int okEditProjectW(CReply cr, SqlSessionTemplate sqlSession) {
		int result = sqlSession.update("adminMapper.okEditProW", cr);
		return sqlSession.update("adminMapper.okEditProjectW", cr);
	}

	public Notice selectNoticeDetail(SqlSessionTemplate sqlSession, NoReply nr) {
		return sqlSession.selectOne("adminMapper.selectNoticeDetail", nr);
	}

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int code) {
		return (ArrayList) sqlSession.selectList("adminMapper.selectImage", code);
	}


	public int confirmNotice(SqlSessionTemplate sqlSession, EdReply er) {
		return sqlSession.update("adminMapper.confirmNotice", er);
	}

	public void plusNoticeCount(SqlSessionTemplate sqlSession, int noticeNum) {
		sqlSession.update("adminMapper.plusNoticeCount", noticeNum);
	}

	
}
