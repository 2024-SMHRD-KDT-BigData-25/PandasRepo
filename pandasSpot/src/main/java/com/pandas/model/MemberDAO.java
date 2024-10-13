package com.pandas.model;

import java.util.List;

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
	
	public int update(Members m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.update("SpotMapper.update", m);
		session.close();
		return res;
	}
	
	
	
	public Members findMemberById(String id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Members res = session.selectOne("SpotMapper.FindId", id);
		session.close();
		return res;
	}
	
	public List<Members> findMembersById(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Members> res = session.selectList("SpotMapper.FindMembersById", mem_id);
		session.close();
		return res;
	}
}
