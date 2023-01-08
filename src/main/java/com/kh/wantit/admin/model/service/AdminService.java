package com.kh.wantit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.dao.AdminDAO;
import com.kh.wantit.admin.model.vo.AFunding;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.EdReply;
import com.kh.wantit.admin.model.vo.FundingReport;
import com.kh.wantit.admin.model.vo.NReply;
import com.kh.wantit.admin.model.vo.NoReply;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.common.model.vo.CreatorImage;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.CreatorImage;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingEdit;
import com.kh.wantit.member.vo.Creator;
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

	public ArrayList<Creator> creatorApproval() {
		return aDAO.creatorApproval(sqlSession);
	}

	public ArrayList<Image> businessImage() {
		return aDAO.businessImage(sqlSession);
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

	public ArrayList<Integer> getListCountPM(int i) {
		return aDAO.getListCountPM(sqlSession, i);
	}

	public ArrayList<AFunding> selectOkList(PageInfo pi, int i) {
		return aDAO.selectOkList(sqlSession, pi, i);
	}

	public ArrayList<AFunding> projectApproval() {
		return aDAO.projectApproval(sqlSession);
	}
	
	public int okProjectW(String id) {
//		System.out.println("s"+id);
		return aDAO.okProjectW(sqlSession, id);
	}
	
	public int okProjectF(String id) {
//		System.out.println("s"+id);
		return aDAO.okProjectF(sqlSession, id);
	}
	
	public int noProjectW(String id) {
//		System.out.println("s"+id);
		return aDAO.noProjectW(sqlSession, id);
	}
	
	public int noProjectF(String id) {
//		System.out.println("s"+id);
		return aDAO.noProjectF(sqlSession, id);
	}
//	public int noProject(String id) {
//		return aDAO.noProject(sqlSession, id);
//	}
	
	public int updateMemberType(String changeId) {
		return aDAO.updateMemberType(sqlSession, changeId);
	}

	public int deleteCreator(String delCreator) {
		return aDAO.deleteCreator(delCreator, sqlSession);
	}

	public int updateCreatorType(String delCreator) {
		return aDAO.updateCreatorType(delCreator, sqlSession);
	}

	public ArrayList<BannerImage> selectBannerIamgeList() {
		return aDAO.selectBannerImageList(sqlSession);
	}

	public int noEditProjectF(String id) {
		return aDAO.noEditProjectF(id, sqlSession);
	}

	public int okEditProjectF(int id) {
		return aDAO.okEditProjectF(id, sqlSession);
	}

	public int insertImage(Image img) {
		return aDAO.insertImage(sqlSession, img);
	}

	public ArrayList<Notice> allNotice() {
		return aDAO.allNotice(sqlSession);
	}

	public ArrayList<Notice> editNotice(String code) {
		return aDAO.editNotice(sqlSession, code);
	}

	public String checkCode(String code) {
		return aDAO.checkCode(sqlSession, code);
	}

	public Notice getNotice(String code, boolean yn) {
		int result = 0;
		if(yn) {
			result = aDAO.addCount(code, sqlSession);
		}
		return aDAO.getNotice(sqlSession, code);
	}

	public Image getImage(String code) {
		return aDAO.getImage(sqlSession, code);
	}

	public ArrayList<Image> selectNoticeImage() {
		return aDAO.selectNoticeImage(sqlSession);
	}

	public int getNoticeListCount() {
		return aDAO.getNoticeListCount(sqlSession);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return aDAO.selectNoticeList(sqlSession, pi);
	}

	public Notice selectNotice(int noticeNum) {
		return aDAO.selectNotice(sqlSession, noticeNum);
	}

	public String getImageBoardId(int imageNum) {
		return aDAO.getImageBoardId(sqlSession, imageNum);
	}

	public Funding getFundingInfo(int imageBoardId) {
		return aDAO.getFundingInfo(sqlSession, imageBoardId);
	}

	public int insertAds(Ads ads) {
		return aDAO.insertAds(sqlSession, ads);
	}

	public int insertBannerImage(BannerImage bi) {
		return aDAO.insertBannerImage(sqlSession, bi);
	}

	public int okEditProjectW(int id) {
		return aDAO.okEditProjectW(id, sqlSession);
	}

	public int noEditProjectFF(String id) {
		return aDAO.noEditProjectFF(id, sqlSession);
	}

	 public Notice selectNoticeDetail(NoReply nr) {
        return aDAO.selectNoticeDetail(sqlSession, nr);
    }


    public ArrayList<Image> selectImage(int code) {
        return aDAO.selectImage(sqlSession, code);
    }
	    
	public int confirmNotice(EdReply er) {
		return aDAO.confirmNotice(sqlSession, er);
	}

	public void plusNoticeCount(int noticeNum) {
		aDAO.plusNoticeCount(sqlSession, noticeNum);
	}


	
}
