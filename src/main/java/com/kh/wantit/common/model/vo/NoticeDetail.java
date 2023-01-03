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
public class NoticeDetail {
	private int noticeNum;
	private String admin, noticeTitle, noticeContent;
	private Date noticeCreateDate, noticeModifyDate;
	private int noticeCount;
	private String noticeStatus, noticeDivision;
}
