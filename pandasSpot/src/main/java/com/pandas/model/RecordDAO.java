package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class RecordDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int Recording(Records m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.Recording", m);		
		session.close();
		return res;
	}
}
