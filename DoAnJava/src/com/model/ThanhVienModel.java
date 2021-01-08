package com.model;

public class ThanhVienModel extends Account {
		
	public ThanhVienModel()  {
		
	}
	private String ngaysinh;
	private int gioitinh;	
	private String province;
	private String district;
	private String ward;


	public ThanhVienModel(int id, String name, String email, String password, String ngaysinh, int gioitinh,
			String sdt, String province, String district, String ward) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.ngaysinh = ngaysinh;
		this.gioitinh = gioitinh;
		this.sdt = sdt;
		this.province = province;
		this.district = district;
		this.ward = ward;
	}
	
	public String getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public int getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(int gioitinh) {
		this.gioitinh = gioitinh;
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
	@Override
	public String toString() {
		return "ThanhVienModel [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", ngaysinh=" + ngaysinh + ", gioitinh=" + gioitinh + ", sdt=" + sdt + ", province=" + province
				+ ", district=" + district + ", ward=" + ward + "]";
	}


	
	
		
}
