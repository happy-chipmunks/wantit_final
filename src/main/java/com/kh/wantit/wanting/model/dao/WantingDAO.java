package com.kh.wantit.wanting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.wanting.model.vo.Wanting;

@Repository("wDAO")
public class WantingDAO {

	public int insertWanting(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.insert("wantingMapper.insertWanting", w);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("wantingMapper.insertImage", img);
	}

	public ArrayList<Wanting> selectWantingList(SqlSessionTemplate sqlSession) {
		ArrayList<Wanting> list = (ArrayList)sqlSession.selectList("wantingMapper.selectWantingList");
		return list;
	}

	public ArrayList<Image> selectImageList(SqlSessionTemplate sqlSession) {
		ArrayList<Image> list = (ArrayList)sqlSession.selectList("wantingMapper.selectImageList");
		return list;

	}

}
