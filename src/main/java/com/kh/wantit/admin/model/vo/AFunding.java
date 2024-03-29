package com.kh.wantit.admin.model.vo;

import java.sql.Date;

import com.kh.wantit.funding.model.vo.FundingEdit;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingEdit;

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
public class AFunding {
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
	private String confirm;
	private Date createDate;
	private Date modifyDate;
	private String FundingStatus;
	private String creatorNickname;
	private String division;
	private Wanting wanting;
	private FundingEdit fundingEdit;
	private WantingEdit wantingEdit;
}
