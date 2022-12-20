package com.kh.wantit.member.vo;

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
public class Creator {
	private int creatorNum;
	private String creator;
	private char businessType;
	private String businessNumber;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String creatorName;
}
