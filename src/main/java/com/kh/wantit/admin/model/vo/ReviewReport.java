package com.kh.wantit.admin.model.vo;

import java.sql.Date;

import com.kh.wantit.funding.model.vo.Review;

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
public class ReviewReport {
	private int reportNum, reviewNum;
	private String reporter, reportCate;
	private Date reportDate;
	private String reportContent, reportStatus, reportDivision;
	private Review review;
}
