package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class CommunityDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Communities> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Communities> list = sqlSession.selectList("SpotMapper.CommunityList");
		sqlSession.close();
		return list;
	}
	
// SpotMapper에서 getCommunities 호출
		public Communities getCommunities(int idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			Communities res = sqlSession.selectOne("SpotMapper.getCommunities", idx);
			sqlSession.close();
			return res;
	}
		
		public int CommunityPost (Communities c) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int res = sqlSession.insert("SpotMapper.CommunityPost",c);
			sqlSession.close();
			return res;
		}
		
		
}
