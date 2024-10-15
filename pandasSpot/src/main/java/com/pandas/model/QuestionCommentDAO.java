package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class QuestionCommentDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int insertComment(QuestionComments c) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.QnAyNewComment", c);
		session.close();
		return res;
	}
	
	public List<QuestionComments> getCommentList(int mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<QuestionComments> res = session.selectList("SpotMapper.QnACommentList", mem_id);
		session.close();
		return res;
	}
}
