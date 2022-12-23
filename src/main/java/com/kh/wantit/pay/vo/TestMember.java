package com.kh.wantit.pay.vo;

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
public class TestMember {
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private String phone;
	private String address;
	private String email;
	private Date enrollDate;
	private String gender;
	private String type;
	private String introduce;
	private String cate;
	private String status;
	
}
