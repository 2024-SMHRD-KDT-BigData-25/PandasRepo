package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class StudyTimeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int insertStudyTime(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.StudyTimeInsert", mem_id);
		session.close();
		return res;
	}
	public int update(StudyTimes s) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.update("SpotMapper.StudyTimeUpdate", s);
		session.close();
		return res;
	}
	
	public String getStudyTime(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String res = session.selectOne("SpotMapper.GetStudyTime", mem_id);
		session.close();
		return res;
	}
}
