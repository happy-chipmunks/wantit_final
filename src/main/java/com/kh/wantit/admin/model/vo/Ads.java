package com.kh.wantit.admin.model.vo;

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
public class Ads {
	private int adsNum, fundingNum, adsPrice;
	private String adsStatus, confirm;
	private Date adsStart, adsEnd, adsCreateDate;
	private String fundingTitle;
	private String imageRename;
	private int imageNum;
}
