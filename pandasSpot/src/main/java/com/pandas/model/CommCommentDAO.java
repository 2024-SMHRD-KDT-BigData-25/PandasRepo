package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class CommCommentDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int insertComment(CommComments c) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.CommNewComment", c);
		session.close();
		return res;
	}
	
	public List<CommComments> getCommentList(int mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<CommComments> res = session.selectList("SpotMapper.CommCommentList", mem_id);
		session.close();
		return res;
	}
	
	public int commentLikes(String comm_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.update("SpotMapper.CommCommentLikes", comm_idx);
		session.close();
		return res;
	}
	
	public int commentUnlikes(String comm_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.update("SpotMapper.CommCommentUnlikes", comm_idx);
		session.close();
		return res;
	}
}
