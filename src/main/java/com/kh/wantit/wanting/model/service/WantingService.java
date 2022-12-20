package com.kh.wantit.wanting.model.service;

import java.util.ArrayList;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.wanting.model.vo.Wanting;

public interface WantingService {

	int insertWanting(Wanting w);

	int insertImage(Image img);

	
	ArrayList<Wanting> selectWantingList();

	ArrayList<Image> selectImageList();
	

}
