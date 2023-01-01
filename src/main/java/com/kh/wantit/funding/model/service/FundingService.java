package com.kh.wantit.funding.model.service;

import java.util.ArrayList;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.Reward;

public interface FundingService {

	int insertFunding(Funding f);

	int insertImage(Image i);

	ArrayList<Funding> fundingList();

	ArrayList<Funding> searchFundingList(String searchText);

	String getCreatorName(String id);

	ArrayList<Image> fundingImageList();

	int insertReward(Reward r);

	int getCreatorNum(String id);
	
}
