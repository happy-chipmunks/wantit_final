package com.kh.wantit.wanting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.wanting.model.vo.Wanting;

@Repository("wDAO")
public class WantingDAO {

	public int insertWanting(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.insert("wantingMapper.insertWanting", w);
	}

}
