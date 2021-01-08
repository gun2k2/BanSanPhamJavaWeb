package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.ConnectionToDB;

public class TinTucDAO {

	public TinTucDAO() {
		
	}
	public boolean updateView(int id)  throws SQLException, Exception {
		Connection conn  = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		ConnectionToDB db = new ConnectionToDB();
		System.out.println("2");
		try {
			String query =" update tintuc" +" set luotxem=luotxem +1 where id='"+id+"'";
			System.out.println("3");
			conn = db.getConnect();
			ps =conn.prepareStatement(query);
			ps.executeUpdate();
			System.out.println("4");
			return true;
		} catch (Exception e) {
			throw e;
		} 
		
	
	}
}
