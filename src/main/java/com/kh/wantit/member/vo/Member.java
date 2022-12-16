package com.kh.wantit.member.vo;

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
public class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickname; 
	private String memberPhone;
	private String memberAddress;
	private String memberEmail;
	private Date memberEnrolldate;
	private String memberGender;
	private String memberType;
	private String memberIntroduce;
	private String memberCate;
	private String memberStatus;
}
