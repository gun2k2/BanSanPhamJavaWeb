package com.model;

import java.util.Arrays;
import java.util.Date;
import java.sql.Timestamp;

public class DonHangModel {

	public DonHangModel() {
		
	}
	
	private int id;
	private String[] masp;
	@Override
	public String toString() {
		return "DonHangModel [id=" + id + ", masp=" + Arrays.toString(masp) + ", name=" + name + ", email=" + email
				+ ", sdt=" + sdt + ", province=" + province + ", district=" + district + ", ward=" + ward + ", ghichu="
				+ ghichu + ", sanpham=" + Arrays.toString(sanpham) + ", soluong=" + Arrays.toString(soluong)
				+ ", tongtien=" + Arrays.toString(tongtien) + ", ngaymua=" + ngaymua + ", trangthai=" + trangthai + "]";
	}

	private String name;
	private String email;
	private String sdt;
	private String province;
	private String district;
	private String ward;
	private String ghichu;
	private String[] sanpham;

	
	private String[] soluong;
	private String[] tongtien;
	private Date ngaymua = new Date();
	
	private int trangthai;

	
	public DonHangModel(int trangthai) {
		super();
		this.trangthai = trangthai;
	}

	public DonHangModel(String[] masp,int id, String name, String email, String sdt, String province, String district, String ward,
			String ghichu, String[] sanpham,  String[] soluong, String[] tongtien, Date ngaymua,
			int trangthai) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.sdt = sdt;
		this.province = province;
		this.district = district;
		this.ward = ward;
		this.ghichu = ghichu;
		this.sanpham = sanpham;
		this.masp = masp;
		this.soluong = soluong;
		this.tongtien = tongtien;
		this.ngaymua = ngaymua;
		this.trangthai = trangthai;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getGhichu() {
		return ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	public String[] getSanpham() {
		return sanpham;
	}

	public void setSanpham(String[] sanpham) {
		this.sanpham = sanpham;
	}

	public String[] getMasp() {
		return masp;
	}

	public void setMasp(String[] masp) {
		this.masp = masp;
	}

	public String[] getSoluong() {
		return soluong;
	}

	public void setSoluong(String[] soluong) {
		this.soluong = soluong;
	}

	public String[] getTongtien() {
		return tongtien;
	}

	public void setTongtien(String[] tongtien) {
		this.tongtien = tongtien;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public int getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}


	
	



	
	
}
