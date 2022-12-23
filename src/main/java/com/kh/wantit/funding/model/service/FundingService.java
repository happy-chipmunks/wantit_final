package com.kh.wantit.funding.model.service;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;

public interface FundingService {

	int insertFunding(Funding f);

	int insertImage(Image i);
	
}
