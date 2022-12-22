package com.kh.wantit.funding.model.vo;

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
	private int rewardPrice;
	private int rewardShipping;
	private int rewardLimit;
}
