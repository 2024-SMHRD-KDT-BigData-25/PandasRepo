package com.pandas.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class DiaryDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int getDiaryLength() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.selectOne("ecMapper.getDiaryLength");
		sqlSession.close();
		return res;
	}
	
	public List<Diaries> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Diaries> list = sqlSession.selectList("SpotMapper.DiaryList");
		sqlSession.close();
		return list;
	}
	
	public List<Diaries> getList(int page) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Diaries> list = sqlSession.selectList("ecMapper.pageDiary", page);
		sqlSession.close();
		return list;
	}
	
	public List<Diaries> getMemberList(int page) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Diaries> list = sqlSession.selectList("ecMapper.pageDiary", page);
		sqlSession.close();
		return list;
	}
	
	public List<Diaries> getMyPostList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Diaries> list = sqlSession.selectList("SpotMapper.MyPostList", id);
		sqlSession.close();
		return list;
	}

// SpotMapper에서 getDiary 호출
	public Diaries getDiary(int idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Diaries res = sqlSession.selectOne("SpotMapper.getDiary", idx);
		sqlSession.close();
		return res;
	}
	
	public int DiaryPost(Diaries d) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("SpotMapper.DiaryPost",d);
		sqlSession.close();
		return res;
	}
	
	public int DiaryUpdate(Diaries d) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.update("SpotMapper.DiaryUpdate",d);
		sqlSession.close();
		return res;
	}
	
	public int DiaryDelete(int diary_idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.delete("nyMapper.DiaryDelete",diary_idx);
		sqlSession.close();
		return res;
	}
}
