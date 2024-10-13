package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class FollowingsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Followings> getMyfollowers(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Followings> res = session.selectList("SpotMapper.getFollowers", mem_id);
		session.close();
		return res;
	}
	public List<Followings> getMyfollowees(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Followings> res = session.selectList("SpotMapper.getFollowees", mem_id);
		session.close();
		return res;
	}
}
