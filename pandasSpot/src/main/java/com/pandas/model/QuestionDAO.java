package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class QuestionDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Questions> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Questions> list = sqlSession.selectList("SpotMapper.QuestionList");
		sqlSession.close();
		return list;
	}
}
