package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class CommunityDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Communities> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Communities> list = sqlSession.selectList("SpotMapper.CommunityList");
		sqlSession.close();
		return list;
	}
}
