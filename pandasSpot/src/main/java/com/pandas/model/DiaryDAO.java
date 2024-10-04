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

// SpotMapper에서 getDiary 호출
	public Diaries getDiary(int idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Diaries res = sqlSession.selectOne("SpotMapper.getDiary", idx);
		sqlSession.close();
		return res;
	}
}
