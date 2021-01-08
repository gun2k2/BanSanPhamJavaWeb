package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.model.ConnectionToDB;

import com.model.SanPhamModel;
public class SanPhamDAO   {	
	private static String danhSachThuocTinh1 = "name,price, discount,danhmuc, image_link ,luotxem,buyed, hangsx, baohanh, trangthai,soLuongMua, content1,content2,content3,content4,content5,content6,content7,content8,content9,content10";
	private static String INSERT_QUERY = "INSERT INTO sanpham" + "(" + danhSachThuocTinh1 + ") VALUES " + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);" ;	
	private static String DELETE_QUERY = "DELETE FROM sanpham WHERE maSanPham = ?; ";
	private static String UPDATE_QUERY = "UPDATE sanpham set name = ?, price = ?, discount = ?, danhmuc = ?, image_link = ?, luotxem = ?, buyed = ?, hangsx = ?, baohanh = ?, trangthai = ?,soLuongMua = ?,content1 = ?,content2 = ?,content3 = ?,content4 = ?,content5 = ?,content6 = ?,content7 = ?,content8 = ?,content9 = ?,content10 = ? where maSanPham = ?";
	
	private static String SELECT_BY_ID = "select * from sanpham where id =?";
	
	public SanPhamDAO() {		
	}	
	
	//insert
	public static void add(SanPhamModel sp) throws SQLException {
        new ConnectionToDB();
		try (Connection connection = ConnectionToDB.getConnect(); PreparedStatement lenhSql = connection.prepareStatement(INSERT_QUERY)) {
			lenhSql.setString(1, sp.getName());
			lenhSql.setInt(2, sp.getPrice());
			lenhSql.setInt(3, sp.getDiscount());
			lenhSql.setInt(4, sp.getDanhmuc());
			lenhSql.setString(5, sp.getImage_link());
			lenhSql.setInt(6, sp.getLuotxem());
			lenhSql.setInt(7, sp.getBuyed());
			lenhSql.setString(8, sp.getHangsx());
			lenhSql.setInt(9, sp.getBaohanh());
			lenhSql.setInt(10, sp.getTrangthai());
			lenhSql.setString(11, sp.getSoLuongMua());
			lenhSql.setString(12, sp.getContent1());			
			lenhSql.setString(13, sp.getContent2());
			lenhSql.setString(14, sp.getContent3());
			lenhSql.setString(15, sp.getContent4());
			lenhSql.setString(16, sp.getContent5());
			lenhSql.setString(17, sp.getContent6());
			lenhSql.setString(18, sp.getContent7());
			lenhSql.setString(19, sp.getContent8());
			lenhSql.setString(20, sp.getContent9());
			lenhSql.setString(21, sp.getContent10());
		
            lenhSql.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
	//Delete
	public boolean del(int maSanPham) throws SQLException {
        boolean rowDeleted; //kq
        try (Connection connection = ConnectionToDB.getConnect(); PreparedStatement lenhSql = connection.prepareStatement(DELETE_QUERY);) {
        	lenhSql.setInt(1, maSanPham);
            rowDeleted = lenhSql.executeUpdate() > 0;            
        }
        return rowDeleted;
    }
	
	
	public boolean update(SanPhamModel sp, int maSanPham) throws SQLException {
        boolean rowUpdated;
      
        try (Connection connection = ConnectionToDB.getConnect(); 
        	PreparedStatement lenhSql = connection.prepareStatement(UPDATE_QUERY);) {
        	lenhSql.setString(1, sp.getName());
			lenhSql.setInt(2, sp.getPrice());
			lenhSql.setInt(3, sp.getDiscount());
			lenhSql.setInt(4, sp.getDanhmuc());
			lenhSql.setString(5, sp.getImage_link());
			lenhSql.setInt(6, sp.getLuotxem());
			lenhSql.setInt(7, sp.getBuyed());
			lenhSql.setString(8, sp.getHangsx());
			lenhSql.setInt(9, sp.getBaohanh());
			lenhSql.setInt(10, sp.getTrangthai());
			lenhSql.setString(11, sp.getSoLuongMua());
			lenhSql.setString(12, sp.getContent1());			
			lenhSql.setString(13, sp.getContent2());
			lenhSql.setString(14, sp.getContent3());
			lenhSql.setString(15, sp.getContent4());
			lenhSql.setString(16, sp.getContent5());
			lenhSql.setString(17, sp.getContent6());
			lenhSql.setString(18, sp.getContent7());
			lenhSql.setString(19, sp.getContent8());
			lenhSql.setString(20, sp.getContent9());
			lenhSql.setString(21, sp.getContent10());
        	lenhSql.setInt(22, maSanPham);
           
            rowUpdated = lenhSql.executeUpdate() > 0;
        }
        return rowUpdated;
    }
	
		
	
		
	
	
	
	//in lỗi
	private static void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

	


	public boolean updateView(String maSP)  throws SQLException, Exception {
		Connection conn  = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		ConnectionToDB db = new ConnectionToDB();
		System.out.println("2");
		try {
			String query =" update sanpham" +" set luotxem=luotxem +1 where maSanPham='"+maSP+"'";
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
