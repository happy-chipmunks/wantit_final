package com.kh.wantit.funding.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Reward;

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
	
}
