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
public class FundingEdit {
	private int fundingEditNum;
	private String fundingTitle;
	private String fundingEditContent;
	private int editFundingNum;
	private char confirm;
	private String division;
	private char status;
	private Date createDate;
}
