package com.dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.model.ConnectionToDB;
import com.model.KhachHangModel;

public class KhachHangDAO implements ObjectDAO {

	//public static HashMap<String, KhachHangModel> mapKhachHang = loadData();
	public KhachHangDAO() {
		
	}
	
	
	@Override // thêm
	public boolean add(Object obj) {
		KhachHangModel kh = (KhachHangModel) obj;
		try {
			new ConnectionToDB().excuteSql("insert into KhachHang values( N'" + kh.getName() + "', '" + kh.getEmail() 
					+ "','" + kh.getSdt() + "', '" + kh.getUsername() + "', '" + kh.getPassword() 
					+ "', '" +kh.getIdkh()+"'  )");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override // sửa
	public boolean edit(Object obj, int id) {
		KhachHangModel tv = (KhachHangModel) obj;
		try {
			new  ConnectionToDB().excuteSql("update KhachHang set name=N'"+tv.getName()+"',email='"+tv.getEmail()+"',sdt='"+tv.getSdt()+"',username='"+tv.getUsername()+"',password='"+tv.getPassword()+"' where id='"+id+"'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updatepassword(KhachHangModel kh, String email) {
		try {
			System.out.println("email nhap vao" + email);
			System.out.println("password moi nhap vao" + kh.getPassword());
			new  ConnectionToDB().excuteSql("update KhachHang set password='"+kh.getPassword()+"' where email='"+email+"'");
			
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
			new ConnectionToDB().excuteSql("delete from KhachHang where id='"+id+"'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public static HashMap<String, KhachHangModel> loadData(){
		HashMap<String , KhachHangModel> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from KhachHang");
			while(rs.next()) {
				
				int id =rs.getInt(1);
				String name= rs.getString(2);
				String email= rs.getString(3);
				String sdt= rs.getString(4);
				String username= rs.getString(5);
				String password= rs.getString(6);
		
				
				KhachHangModel kh = new KhachHangModel(id, name,email,sdt,username,password);
				mapTemp.put(username,kh);
				
			}
			return mapTemp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}
	public static HashMap<String, KhachHangModel> loadfb(){
		HashMap<String , KhachHangModel> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from KhachHang");
			while(rs.next()) {
				
				int id =rs.getInt(1);
				String name= rs.getString(2);
				String email= rs.getString(3);
				String sdt= rs.getString(4);
				String username= rs.getString(5);
				String password= rs.getString(6);
			
				String idkh= rs.getString(7);
				KhachHangModel kh = new KhachHangModel(id, name,email,sdt,username,password,idkh);
				mapTemp.put(idkh,kh);
				
			}
			return mapTemp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}
	
	public ServletContext checkLogin(String userName, String passWord,ServletContext contextError )
	{

		KhachHangModel kh =KhachHangDAO.loadData().get(userName);
		
		if(kh!=null)
	{
			if(kh.getPassword().equals(passWord)) {
				System.out.println("dung mk");
				contextError.setAttribute("error", "false");
			}
			else {
				contextError.setAttribute("erroruser", " Sai Thong tin dang nhap  !!");
				contextError.setAttribute("error", "true");
				
			}
		}else {
			contextError.setAttribute("errortontai", " Sai Thong tin dang nhap !!");
			contextError.setAttribute("error", "true");
		}
		return contextError;
	}
	
	
	
	public static HashMap<String, KhachHangModel> checkemail(){
		HashMap<String , KhachHangModel> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from KhachHang");
			while(rs.next()) {
				
				int id =rs.getInt(1);
				String name= rs.getString(2);
				String email= rs.getString(3);
				String sdt= rs.getString(4);
				String username= rs.getString(5);
				String password= rs.getString(6);
		
				
				KhachHangModel kh = new KhachHangModel(id, name,email,sdt,username,password);
				mapTemp.put(email,kh);
				
			}
			return mapTemp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}
	public ServletContext checkEmail(String email, ServletContext contextError )
	{

		KhachHangModel kh =KhachHangDAO.checkemail().get(email);
		
		if(kh!=null)
	{
			if(kh.getEmail().equals(email)) {
				
				contextError.setAttribute("successpass", "true");
				contextError.setAttribute("error", "false");	
			}
			else {
				contextError.setAttribute("errorpass", "true");
				contextError.setAttribute("error", "true");	
				
			}
		}else {
			contextError.setAttribute("errortontai", " Sai Thong tin dang nhap !!");
			contextError.setAttribute("error", "true");
		}
		return contextError;
	}
	


	public ServletContext check(KhachHangModel kh,ServletContext contextError ) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		
		ConnectionToDB conn = new ConnectionToDB();
		
		try {
			rs = conn.selectData("select * from KhachHang where username='" + kh.getUsername() 
								+ "' or email = '" + kh.getEmail() + "'"
								+ " or sdt = '" + kh.getSdt() + "'") ;
			while (rs.next()) {
				
				if (rs.getString("username").equals(kh.getUsername())) {
					contextError.setAttribute("errorUsername", kh.getUsername()+" already exists !!");
					contextError.setAttribute("error", "true");
				}
					
				if (rs.getString("email").equals(kh.getEmail())) {
					contextError.setAttribute("errorEmail", kh.getEmail()+" already exists !!");
					contextError.setAttribute("error", "true");
				}
				if (rs.getString("sdt").equals(kh.getSdt())) {
					contextError.setAttribute("errorSdt", kh.getSdt()+" already exists !!");
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
