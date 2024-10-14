package com.pandas.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class StudyLikesDAO {

    private SqlSessionFactory sqlSessionFactory;

    // SqlSessionFactory를 받는 생성자
    public StudyLikesDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public int upStudyLikes(int study_idx) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            session.update("jwMapper.upStudyLikes", study_idx);
            int likes = session.selectOne("jwMapper.getStudyLikes", study_idx);
            session.close();
            return likes;
        }
    }
}