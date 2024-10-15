package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class StudyCommentsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	public int insertComment(StudyComments c) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int res = session.insert("SpotMapper.StudyNewComment", c);
		session.close();
		return res;
	}
	
	public List<StudyComments> getCommentList(int mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<StudyComments> res = session.selectList("SpotMapper.StudyCommentList", mem_id);
		session.close();
		return res;
	}
}
