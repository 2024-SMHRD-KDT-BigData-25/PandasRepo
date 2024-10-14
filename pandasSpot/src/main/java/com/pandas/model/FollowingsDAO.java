package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class FollowingsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<String> getMyfollowers(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> res = session.selectList("SpotMapper.getFollowers", mem_id);
		session.close();
		return res;
	}
	public List<String> getMyfollowings(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> res = session.selectList("SpotMapper.getFollowings", mem_id);
		session.close();
		return res;
	}
	
	public List<String> friendFollow(Followings f) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("SpotMapper.Follow", f);
		List<String> res = session.selectList("SpotMapper.getFollowers", f.getFollowing_id());
		session.close();
		return res;
	}
	public List<String> friendUnfollow(Followings f) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("SpotMapper.unFollow", f);
		List<String> res = session.selectList("SpotMapper.getFollowers", f.getFollowing_id());
		session.close();
		return res;
	}
}
