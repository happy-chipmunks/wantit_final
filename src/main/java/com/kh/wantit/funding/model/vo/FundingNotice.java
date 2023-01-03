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
public class FundingNotice {
	private int fundingNoticeNum;
	private int fundingNum;
	private String fundingNoticeWriter;
	private String fundingNoticeTitle;
	private String fundingNoticeContent;
	private Date fundingNoticeCreateDate;
	private Date fundingNoticeModifyDate;
	private int fundingNoticeCount;
	private char fundingNoticeStatus;
	private String fundingNoticeCategory;
}
