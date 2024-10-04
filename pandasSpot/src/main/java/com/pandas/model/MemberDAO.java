package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int join(Members m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.join", m);		
		session.close();
		return res;
	}
	public Members login(Members m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Members res = session.selectOne("SpotMapper.login", m);
		session.close();
		return res;
	}
}
