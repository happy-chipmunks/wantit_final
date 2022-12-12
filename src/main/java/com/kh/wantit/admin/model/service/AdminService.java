package com.kh.wantit.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.dao.AdminDAO;

@Service("aService")
public class AdminService {
	@Autowired
	AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
