package com.kk.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.BeforeClass;
import org.junit.Test;

public class TestJDBC {

	private String url = "jdbc:mysql://192.168.1.128:3306/spirit?useUnicode=true&characterEncoding=UTF-8";
	private String user = "root";
	private String password = "root";

	@BeforeClass
	public static void setUp() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void test() {
		for (int i = 0; i < 100; i++) {
			Connection conn = null;
			PreparedStatement prep = null;
			ResultSet rs = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				prep = conn.prepareStatement("select now()");
				rs = prep.executeQuery();
				while (rs.next()) {
					System.out.println(rs.getString(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
					prep.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
