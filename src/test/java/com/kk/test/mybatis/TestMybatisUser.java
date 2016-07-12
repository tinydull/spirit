package com.kk.test.mybatis;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.kk.spirit.entity.UserEntity;


public class TestMybatisUser {

	private static SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	
	@BeforeClass
	public static void setUp() throws IOException {
		Reader reader = new FileReader(new File(TestMybatisUser.class.getResource("").getPath().
				replaceFirst("/", "") + "config.xml"));
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		reader.close();
	}
	@AfterClass
	public static void tearDown() {
		
		sqlSessionFactory = null;
	}
	
	@Before
	public void before() {
		session = sqlSessionFactory.openSession();		
	}
	
	@After
	public void after() {
		session.close();
	}
	@Test
	public void testUser() throws IOException {
		UserEntity user = session.selectOne("com.kk.spirit.dao.UserDao.userLoginByUsername", "admin");
		System.out.println(user);
		org.junit.Assert.assertNull(user);
	}
	
	
}
