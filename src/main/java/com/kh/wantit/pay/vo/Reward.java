package com.kh.wantit.pay.vo;

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
public class Reward {
	private int rewardNum;
	private int fundingNum;
	private String rewardTitle;
	private String rewardContent;
	private int price;
	private int shipping;
	private int rewardLimit;
	private int rewardSellCount;
	private Date rewardExpectDate;
}
