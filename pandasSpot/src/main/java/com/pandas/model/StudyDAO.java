package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class StudyDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	
	public List<Studies> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Studies> list = sqlSession.selectList("SpotMapper.StudyList");
		sqlSession.close();
		return list;
	}
	
	public int Studing(Studies m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.Studing", m);		
		session.close();
		return res;
	}
	
	// SpotMapper에서 getRecords 호출
	public Studies getStudies(int idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Studies res = sqlSession.selectOne("SpotMapper.getStudies", idx);
		sqlSession.close();
		return res;
	}
	
}
