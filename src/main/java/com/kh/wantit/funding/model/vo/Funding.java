package com.kh.wantit.funding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Funding {
	private int fundingNum;
	private int creatorNum;
	private String fundingCate;
	private String fundingTitle;
	private String fundingContent;
	private int fundingCount;
	private Date fundingStart;
	private Date fundingEnd;
	private long currentMoney;
	private long targetMoney;
	private char confirm;
	private Date createDate;
	private Date modifyDate;
	private String FundingStatus;
	private String creatorNickname;
}
