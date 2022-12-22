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
public class AdminInquiry {
	private int inquiryCode;
	private String writer, inquiryCate, inquiryTitle, inquiryContent;
	private Date createDate;
	private String inquiryStatus, answerContent;
	private Date answerDate;
	
}
