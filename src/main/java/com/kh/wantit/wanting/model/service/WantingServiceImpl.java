package com.kh.wantit.wanting.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.wanting.model.dao.WantingDAO;
import com.kh.wantit.wanting.model.vo.Wanting;

@Service("wService")
public class WantingServiceImpl implements WantingService{

	@Autowired
	private WantingDAO wDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertWanting(Wanting w) {
		return  wDAO.insertWanting(sqlSession, w);
	}
	
}
