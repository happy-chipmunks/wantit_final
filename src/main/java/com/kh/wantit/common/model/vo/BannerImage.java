package com.kh.wantit.common.model.vo;

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
public class BannerImage {
	private int imageNum;
	private Date startDate;
	private Date endDate;
	private String confirm;
	private String bannerStatus;
	private String imageRename;
	private String seqIdNum;
}
