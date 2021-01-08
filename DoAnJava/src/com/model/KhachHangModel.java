package com.model;

import java.io.Serializable;

public class KhachHangModel  extends Account {
	
	

	public KhachHangModel() {
		
	}
	
	
	private String username;
	private String idkh;
	
	public String getIdkh() {
		return idkh;
	}

	public void setIdkh(String idkh) {
		this.idkh = idkh;
	}

	
	
	public KhachHangModel(int id, String name, String email, String sdt, String username, String password,
			 String idkh) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.sdt = sdt;
		this.username = username;
		this.password = password;
	
		this.idkh = idkh;
	}

	public KhachHangModel(String idkh, String name, String email) {
		super();
		this.idkh = idkh;
		this.name = name;
		this.email = email;
	}
	public KhachHangModel(String email,String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public KhachHangModel(int id, String name, String email, String sdt, String username, String password
			) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.sdt = sdt;
		this.username = username;
		this.password = password;
		
		
	}

	@Override
	public String toString() {
		return "KhachHangModel [id=" + id + ", name=" + name + ", email=" + email + ", sdt=" + sdt + ", username="
				+ username + ", password=" + password + ", idkh=" + idkh + "]";
	}

	
	
	
	
	

	
	
	
}
