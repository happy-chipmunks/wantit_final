package com.kh.wantit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.dao.AdminDAO;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.member.vo.Member;

@Service("aService")
public class AdminService {
	@Autowired
	AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember(PageInfo pi, int i) {
		return aDAO.selectAllMember(sqlSession, pi, i);
	}
	
	public ArrayList<Member> selectNewMember() {
		return aDAO.selectNewMember(sqlSession);
	}

	public int selectNewMemberCount() {
		return aDAO.selectNewMemberCount(sqlSession);
	}

	public int getListCount(int i) {
		
		return aDAO.getListCount(sqlSession, i);
	}

	public int deleteMember(String id) {
		return aDAO.deleteMember(sqlSession, id);
	}

	public ArrayList<AdminInquiry> selectAllInquiry(PageInfo pi, int i) {
		return aDAO.selectAllInquiry(sqlSession, pi, i);
	}

	public int answerContent(Reply reeply) {
		return aDAO.answerContent(sqlSession, reeply);
	}

	public ArrayList<Ads> selectAllAds(PageInfo pi, int i) {
		return aDAO.selectAllAds(sqlSession, pi, i);
	}


}
