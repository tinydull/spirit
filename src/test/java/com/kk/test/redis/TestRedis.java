package com.kk.test.redis;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kk.test.mybatis.TestMybatisArticle;

import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestRedis {

	@Autowired
	private ShardedJedisPool shardedJedisPool;
	
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
	public void test() throws SQLException {
		ShardedJedis redis = shardedJedisPool.getResource();
		Connection conn = session.getConnection();
		PreparedStatement prep = conn.prepareStatement("select basicId, platform from cms_class_50");
		ResultSet rs = prep.executeQuery();
		while(rs.next()) {
			redis.set(rs.getString(1), rs.getString(2));
		}
		redis.close();
		System.out.println();
	}
	@Test
	public void testSet() {
		long s = System.currentTimeMillis();
		ShardedJedis redis = shardedJedisPool.getResource();
		for (int i = 0; i < 10000; i++) {
			redis.set("name" + i, "黄腾" + i);			
		}
		redis.close();
		System.out.println(System.currentTimeMillis() - s);
	}
	
	@Test
	public void testGet() {
		long s = System.currentTimeMillis();
		String value = shardedJedisPool.getResource().get("name");
		System.out.println(System.currentTimeMillis() - s);
	}
	
}
