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
public class Alarm {
	private int alarmNum;
	private String memberId;
	private String alarmMsg;
	private int alarmBoardCate;
	private int alarmBoardId;
	private int alarmCheck;
}
