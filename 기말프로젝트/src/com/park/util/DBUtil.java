package com.park.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtil {

	private static SqlSessionFactory sqlSecFactory = null;

	static {
		String resource = "com/park/util/mybatis-config.xml";
		try {
			InputStream is = Resources.getResourceAsStream(resource);
			sqlSecFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSession getSqlSession() {
		return sqlSecFactory.openSession();
	}

	public static void closeSqlSession(SqlSession sqlSession) {
		if (sqlSession != null) {
			sqlSession.close();
		}
	}

}
