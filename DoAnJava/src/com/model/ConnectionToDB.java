package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionToDB {

	public ConnectionToDB() {
		
	}
	public static Connection getConnect() {
		Connection connection = null;
		PreparedStatement stmt =null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			
			connection =  DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=DoAnJava; user=sa ; password=123456");
			System.out.println("Connection success");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return connection;
	}
	
	
	
	
	
	public void excuteSql(String sql) throws Exception{ // thực thi câu lệnh sql
		Connection connect = getConnect();
		 Statement stmt =   connect.createStatement();
		
	 stmt.executeUpdate(sql);
	}
	
	public ResultSet selectData(String sql) throws Exception{ // lấy dữ liệu từ database
		Connection connect = getConnect();
		Statement stmt =  connect.createStatement();
		ResultSet rs =   stmt.executeQuery(sql);
		return rs;
			
	}
	public static void main(String[] args) throws Exception {
		ConnectionToDB connect =  new ConnectionToDB();
	System.out.println(connect.getConnect());
	}
	
}
