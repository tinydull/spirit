package com.kk.test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;

public class TestJson {

	public static void main(String[] args) {
		final DruidDataSource dataSource = new DruidDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		dataSource.setInitialSize(10);
		dataSource.setMaxActive(50);
		dataSource.setMinIdle(10);
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/spirit?useUnicode=true&characterEncoding=UTF-8");
		for(int i = 0; i < 5; i++) {
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					test(dataSource);					
				}
			}).start();
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					test2(dataSource);				
				}
			}).start();
			
		}
//		dataSource.close();
	}
	
	public static void test(DruidDataSource dataSource) {
		try {
			DruidPooledConnection conn = dataSource.getConnection();
			PreparedStatement prep = conn.prepareStatement("select now()");
			ResultSet rs = prep.executeQuery("select 1");
			while(rs.next()) {
				String str = rs.getString(1);
				System.out.println(str);
			}
			rs.close();
			prep.close();
			conn.close();
			System.out.println(dataSource);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void test2(DruidDataSource dataSource) {
		try {
			DruidPooledConnection conn = dataSource.getConnection();
			PreparedStatement prep = conn.prepareStatement("");
			ResultSet rs = prep.executeQuery("select 1");
			while(rs.next()) {
				String str = rs.getString(1);
				System.out.println(str);
			}
			rs.close();
			prep.close();
			conn.close();
			System.out.println(dataSource);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
