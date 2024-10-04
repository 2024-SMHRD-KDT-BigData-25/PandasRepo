package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class SchoolDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Schools> getList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Schools> res = session.selectList("SpotMapper.SchoolList");
		session.close();
		return res;
	}
	public Schools findSchool(String name) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Schools res = session.selectOne("", name);
		session.close();
		return res;
	}
}
