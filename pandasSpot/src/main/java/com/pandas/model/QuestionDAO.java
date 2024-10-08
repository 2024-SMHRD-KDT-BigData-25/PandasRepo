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

// SpotMapper에서 getQuestion 호출
		public Questions getQuestion(int idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			Questions res = sqlSession.selectOne("SpotMapper.getQuestion", idx);
			sqlSession.close();
			return res;
	}
		
		public int QuestionPost(Questions q) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int res = sqlSession.insert("SpotMapper.QuestionPost",q);
			sqlSession.close();
			return res;
	}
		
		
}
