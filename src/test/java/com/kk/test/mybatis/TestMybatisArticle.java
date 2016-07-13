package com.kk.test.mybatis;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.kk.spirit.entity.Article;

public class TestMybatisArticle {

	private static SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	
	@BeforeClass
	public static void setUp() throws IOException {
		Reader reader = new FileReader(new File(TestMybatisArticle.class.getResource("").getPath().
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
		List<Article> list = session.selectList("com.kk.spirit.dao.ArticleDao.queryArticles", null);
		System.out.println(list);
	}
	
	
}
