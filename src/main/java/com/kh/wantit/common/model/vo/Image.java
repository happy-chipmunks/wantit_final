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
public class Image {
	private int imageNum;
	private String imageForm;
	private String originName;
	private String imageRename;
	private String imageSrc;
	private Date uploadDate;
	private String imageStatus;
	private int imageLevel;
	private int imageBoardCate;
	private String imageBoardId;
}

