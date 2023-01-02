package com.kh.wantit.wanting.model.vo;

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
public class Wanting {
	private int wantingNum;
	private String wantingWriter;
	private String wantingNickname;
	private String wantingTitle;
	private String wantingSummary;
	private String wantingContent;
	private String wantingShopName;
	private String wantingShopAddress;
	private Date wantingCreateDate;
	private int wantingDaysCount;
	private int wantingCount;
	private int wantingLevel;
	private String wantingConfirm;
	private String wantingStatus;
}
