package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CommLikesDAO {

    private SqlSessionFactory sqlSessionFactory;

    // SqlSessionFactory를 받는 생성자
    public CommLikesDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public int upCommLikes(int comm_idx) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            session.update("jwMapper.upCommLikes", comm_idx);
            int likes = session.selectOne("jwMapper.getCommLikes", comm_idx);
            session.close();
            return likes;
        }
    }
}

