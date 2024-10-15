package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class CommunityDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int getCommLength() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.selectOne("ecMapper.getCommLength");
		sqlSession.close();
		return res;
	}
	
	public List<Communities> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Communities> list = sqlSession.selectList("SpotMapper.CommunityList");
		sqlSession.close();
		return list;
	}
	
	public List<Communities> getList(int page) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Communities> list = sqlSession.selectList("ecMapper.pageComm", page);
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
		
		public int CommunityUpdate(Communities c) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int res = sqlSession.update("nyMapper.CommunityUpdate",c);
			sqlSession.close();
			return res;
		}
		
		public int CommunityDelete(int comm_idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int res = sqlSession.delete("nyMapper.CommunityDelete",comm_idx);
			sqlSession.close();
			return res;
		}
}
