package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;

public class CommLikesDAO {

	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

    public int upCommLikes(int comm_idx) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int Likes = session.update("jwMapper.upCommLikes", comm_idx);
            session.commit();
            return Likes;
        }
    }

    public int getCommLikes(int comm_idx) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = session.selectOne("jwMapper.getCommLikes", comm_idx);
        	return result;
        }
    }
}

