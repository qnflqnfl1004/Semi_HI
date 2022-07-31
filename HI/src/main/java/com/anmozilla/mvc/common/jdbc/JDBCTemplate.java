package com.anmozilla.mvc.common.jdbc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	// 여러 테이블 요청시에 오류가 날 경우 트랜젝션 처리가 가능해야 하기 떄문에 service에서 다뤄주는 것이 좋다.
	public static Connection getConnection() { 
		Connection connection = null;
		Properties properties = new Properties();
		String filePath = JDBCTemplate.class.getResource("./driver.properties").getPath();
		
//		System.out.println(filePath);
		
		try {
			properties.load(new FileReader(filePath));
		
			Class.forName(properties.getProperty("db.driver"));
			
			connection = DriverManager.getConnection(
					properties.getProperty("db.url"), 
					properties.getProperty("db.username"), 
					properties.getProperty("db.password")
			);
			
			connection.setAutoCommit(false); // 자동 커밋 방지
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public static void commit(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {				
				connection.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {				
				connection.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {
				connection.close();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement statement) {
		try {
			if(statement != null && !statement.isClosed()) {				
				statement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet resultSet) {
		try {
			if(resultSet != null && !resultSet.isClosed()) {				
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}