package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class DiaryDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Diaries> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Diaries> list = sqlSession.selectList("SpotMapper.DiaryList");
		sqlSession.close();
		return list;
	}
}
