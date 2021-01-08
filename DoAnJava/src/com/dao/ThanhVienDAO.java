package com.dao;

import java.sql.ResultSet;
import java.util.HashMap;


import javax.servlet.ServletContext;

import com.model.ConnectionToDB;

import com.model.ThanhVienModel;

public class ThanhVienDAO implements ObjectDAO {
		
	
	@Override // thêm
	public boolean add(Object obj) {
		ThanhVienModel tv = (ThanhVienModel) obj;
		try {
			new ConnectionToDB().excuteSql("insert into ThanhVien values('" + tv.getName() + "', '" + tv.getEmail() 
					+ "','" + tv.getPassword() + "', '" + tv.getNgaysinh() + "', " + tv.getGioitinh() 
					+ ", '" + tv.getSdt() + "', N'" + tv.getProvince() + "', N'" + tv.getDistrict() +"', N'" 
					+ tv.getWard()  + "')");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override // sửa
	public boolean edit(Object obj, int id) {
		ThanhVienModel tv = (ThanhVienModel) obj;
		try {	
			
			new  ConnectionToDB().excuteSql("update ThanhVien set name=N'"+tv.getName()+"',email='"+tv.getEmail()
			+"',password='"+tv.getPassword()
			+"',ngaysinh='"+tv.getNgaysinh()
			+"',gioitinh='"+tv.getGioitinh()
			+"',sdt='"+tv.getSdt()
			+"',province='"+tv.getProvince()
			+"',district='"+tv.getDistrict()
			+"',ward=N'"+tv.getWard()
			+"' where id='"+id+"'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	@Override // xóa
	public boolean del(int id) {
		try {
			new ConnectionToDB().excuteSql("delete from ThanhVien where id='"+id+"'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public static HashMap<String, ThanhVienModel> loadData(){
		HashMap<String , ThanhVienModel> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from ThanhVien");
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String name= rs.getString(2);
				String email= rs.getString(3);
				String password= rs.getString(4);
				String ngaysinh= rs.getString(5);
				int gioitinh= rs.getInt(6);
				String sdt= rs.getString(7);	
				String province= rs.getString(8);
				String district= rs.getString(9);
				String ward= rs.getString(10);
				ThanhVienModel tv = new ThanhVienModel(id,name,email,password,ngaysinh,gioitinh,sdt,province,district,ward);
				mapTemp.put(email,tv);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mapTemp;
	}
	
	public static boolean checkLogin(String eMail, String passWord )
	{

		ThanhVienModel tv =ThanhVienDAO.loadData().get(eMail);
		
		if(tv!=null)
	{
			if(tv.getPassword().equals(passWord)) {
				System.out.println("dung mk");
				return true;
			}
			else {
				System.out.println("sai mk");
				return false;
			}
		}else {
			System.out.println("tk k co");
			return false;
		}
	}
	
	public static boolean checkedit(String eMail, String passWord )
	{

		ThanhVienModel tv =ThanhVienDAO.loadData().get(eMail);
		
		if(tv!=null)
	{
			if(tv.getPassword().equals(passWord)) {
				System.out.println("dung mk");
				return false;
			}
			else {
				System.out.println("sai mk");
				return true;
			}
		}else {
			System.out.println("tk k co");
			return false;
		}
	}
	public ServletContext check(ThanhVienModel tv,ServletContext contextError ) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		
		ConnectionToDB conn = new ConnectionToDB();
		
		try {
			rs = conn.selectData("select * from ThanhVien where email ='" + tv.getEmail() + "'"
								+ " or sdt = '" + tv.getSdt() + "'") ;
			while (rs.next()) {
				
			
					
				if (rs.getString("email").equals(tv.getEmail())) {
					contextError.setAttribute("errorEmail", tv.getEmail()+" already exists !!");
					contextError.setAttribute("error", "true");
				}
				if (rs.getString("sdt").equals(tv.getSdt())) {
					contextError.setAttribute("errorSdt", tv.getSdt()+" already exists !!");
					contextError.setAttribute("error", "true");
				}
				
			}
				
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contextError;
	}
	
	
	
}
