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
	private String wantingContent;
	private String wantingShopLocation;
	private String wantingShopName;
	private int wantingLevel;
	private String wantingStatus;
	private Date wantingCreateDate;
	private int wantingCount;
	private int wantingDaysCount;
	private String wantingConfirm;
	private String division;
}
