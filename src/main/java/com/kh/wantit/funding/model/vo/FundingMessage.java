package com.kh.wantit.funding.model.vo;

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
public class FundingMessage {
	private int messageCode;
	private String sender;
	private String receiver;
	private int fundingNum;
	private String messageTitle;
	private String messageContent;
	private String messageCate;
	private Date messageDate;
	private char messageReadStatus;
	private String replyContent;
	private Date replyDate;
	private char replyStatus;
	private String fundingTitle;
}
