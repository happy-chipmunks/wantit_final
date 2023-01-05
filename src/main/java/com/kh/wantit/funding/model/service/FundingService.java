package com.kh.wantit.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingDibs;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.funding.model.vo.SupportCount;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;

public interface FundingService {

	int insertFunding(Funding f);

	int insertImage(Image i);

	ArrayList<Funding> fundingList();

	ArrayList<Funding> searchFundingList(String searchText);

	String getCreatorName(String id);

	ArrayList<Image> fundingImageList();

	int getCreatorNum(String id);

	String checkWriter(int creatorNum);

	Funding getFunding(int bId, boolean yn);

	Image getImage(int bId);

	String getFundingCreator(int bId);

	int insertFundingNotice(FundingNotice fn);

	ArrayList<FundingNotice> fundingNoticeList(int bId);

	int fnListCount(int bId);

	FundingNotice getFundingNotice(int bId, boolean yn);

	int insertReward(Reward r);

	Funding getCurrFunding(int bId);

	int getFundingCreatorNum(String writer);

	ArrayList<Reward> fundingRewardList(int bId);

	Funding getFundingInfo(int fundingNum);

	int fundingEdit(Funding f);

	ArrayList<Review> getFundingReview(int fundingNum, PageInfo pi);

	ArrayList<PaySchedule> getPayList(int fundingNum);

	int getSupportCount(int fundingNum);

	int getReviewCount(int fundingNum);
	
	int getListCountR(int fundingNum);

	ArrayList<Funding> getFundingIngListRanking();

	ArrayList<Funding> getFundingEndLatest();

	ArrayList<Funding> getFundingEndRanking();

	int insertDibs(FundingDibs dibs);

	int deleteDibs(FundingDibs dibs);

	ArrayList<Member> getReviewerNickName(Integer fundingNum);

}
