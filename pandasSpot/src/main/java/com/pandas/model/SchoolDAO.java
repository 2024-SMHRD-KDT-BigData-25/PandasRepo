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
	public List<Schools> findSchool(String name) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Schools> res = session.selectList("SpotMapper.FindSchool", name);
		session.close();
		return res;
	}
	
	public double findSchool(Schools s) {
		SqlSession session = sqlSessionFactory.openSession(true);
		double res = session.selectOne("SpotMapper.FindSchoolNum", s);
		session.close();
		return res;
	}
	
	public String findSchoolName(Double num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String res = session.selectOne("SpotMapper.FindSchoolName", num);
		session.close();
		return res;
	}
	
	public Schools getSchoolInfo(double num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Schools res = session.selectOne("SpotMapper.FindSchoolInfo", num);
		session.close();
		return res;
	}
}
