package com.pandas.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//SqlSession 관리 -> web 세선과는 다름
public class SqlSessionManager {
	//SqlSession : DB연결, Sql 실행 등 DB관련 (한가지) 작업을 수앻해주는 객체
	//작업을 할 때마다 생성을 해줘야 한다
	//SqlSession 생성해주는 공장
	public static SqlSessionFactory sqlSessionFactory;
	
	//mybatis-config.xml(설정)에 작성되어있는 값을 가지고 factory 생성
	// => 클래스가 로딩되면 한번만 실행되고 더 이상 실행되지 않는다.
	
	static {
		String resource = "com/pandas/database/mybatis-config.xml";
		//Reader를 사용해서 정보를 읽어와서 factory 생성
		 try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
