package com.kh.wantit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.dao.AdminDAO;
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

@Service("aService")
public class AdminService {
	@Autowired
	AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember(PageInfo pi, int i) {
		return aDAO.selectAllMember(sqlSession, pi, i);
	}
	
	public ArrayList<Member> selectNewMember() {
		return aDAO.selectNewMember(sqlSession);
	}

	public int selectNewMemberCount() {
		return aDAO.selectNewMemberCount(sqlSession);
	}

	public int getListCount(int i) {
		return aDAO.getListCount(sqlSession, i);
	}
	
	public int getListCountI(int i) {
		return aDAO.getListCountI(sqlSession, i);
	}
	public int getListCountA(int i) {
		return aDAO.getListCountA(sqlSession, i);
	}
	
	public int getListCountN(int i) {
		return aDAO.getListCountN(sqlSession, i);
	}
	public int deleteMember(String id) {
		return aDAO.deleteMember(sqlSession, id);
	}

	public ArrayList<AdminInquiry> selectAllInquiry(PageInfo pi, int i) {
		return aDAO.selectAllInquiry(sqlSession, pi, i);
	}

	public int answerContent(Reply reeply) {
		return aDAO.answerContent(sqlSession, reeply);
	}

	public ArrayList<Ads> selectAllAds(PageInfo pi, int i) {
		return aDAO.selectAllAds(sqlSession, pi, i);
	}

	public ArrayList<Image> selectAllImage(int i) {
		return aDAO.selectAllImage(sqlSession, i);
	}

//	public ArrayList<Notice> selectAllNotice(PageInfo pi, int i) {
//		return aDAO.selectAllNotice(sqlSession, pi, i);
//	}
//
//	public ArrayList<Notice> selectAllEvent(PageInfo pi, int i) {
//		return aDAO.selectAllEvent(sqlSession, pi, i);
//	}

	public ArrayList<Notice> selectAllwrite(PageInfo pi, int i) {
		return aDAO.selectAllwrite(sqlSession, pi, i);
	}

	public int answerContentN(NReply reeply) {
		return aDAO.answerContentN(sqlSession, reeply);
	}

	public int deleteNotice(String id) {
		return aDAO.deleteNotice(sqlSession, id);
	}

	public int selectNewWrite(Notice n) {
		return aDAO.selectNewWrite(sqlSession, n);
	}

	public int getListCountRR(int i) {
		return aDAO.getListCountRR(sqlSession, i);
	}

	public int getListCountRF(int i) {
		return aDAO.getListCountRF(sqlSession, i);
	}

	public ArrayList<ReviewReport> selectReviewReport(PageInfo piR, int i) {
		return aDAO.selectReviewReport(sqlSession, piR, i);
	}

	public ArrayList<FundingReport> selectFundingReport(PageInfo piF, int i) {
		return aDAO.selectFundingReport(sqlSession, piF, i);
	}
	
	public int deleteReview(String id) {
		return aDAO.deleteReview(sqlSession, id);
	}

	public int deleteFunding(String id) {
		return aDAO.deleteFunding(sqlSession, id);
	}

//	public int getAccept(int acceptDivision) {
//		return aDAO.getAccept(sqlSession, acceptDivision);
//	}

	
}
