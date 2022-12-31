package com.kh.wantit.admin.model.vo;

import java.sql.Date;

import com.kh.wantit.funding.model.vo.Funding;

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
public class FundingReport {
	private int reportNum, fundingNum;
	private String memberId;
	private Date reportDate;
	private String reportCate, reportContent, reportStatus, reportDivision;
	private Funding funding;
}
