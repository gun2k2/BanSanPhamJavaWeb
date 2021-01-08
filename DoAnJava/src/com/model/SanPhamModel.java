package com.model;

import java.sql.Array;

public class SanPhamModel {
	

	public SanPhamModel() {
		
	}
	
	private int maSanPham;
	private String name;
	private int price;
	private int discount;
	private int danhmuc;
	private String image_link;
	private int luotxem;
	private int buyed;
	private String hangsx;
	private int baohanh;
	private int trangthai;
	

	private String soLuongMua;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String content5;
	private String content6;
	private String content7;
	private String content8;
	private String content9;
	private String content10;
	


	public SanPhamModel( String name, int price, int discount, int danhmuc, String image_link,
			int luotxem, int buyed, String hangsx, int baohanh, int trangthai, String soLuongMua, String content1,
			String content2, String content3, String content4, String content5, String content6, String content7,
			String content8, String content9, String content10) {
		super();
		
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.danhmuc = danhmuc;
		this.image_link = image_link;
		this.luotxem = luotxem;
		this.buyed = buyed;
		this.hangsx = hangsx;
		this.baohanh = baohanh;
		this.trangthai = trangthai;
		this.soLuongMua = soLuongMua;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.content5 = content5;
		this.content6 = content6;
		this.content7 = content7;
		this.content8 = content8;
		this.content9 = content9;
		this.content10 = content10;
	}



	public SanPhamModel(int maSanPham,String name, int price, int discount, String image_link, String soLuongMua) {
		super();
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image_link = image_link;
		this.maSanPham = maSanPham;
		this.soLuongMua = soLuongMua;
	}



	public SanPhamModel(int maSanPham, String name, int price, int discount, int danhmuc, String image_link,
			 int luotxem, int buyed, String hangsx, int baohanh, int trangthai, String content1,
			String soLuongMua, String content2, String content3, String content4, String content5, String content6,
			String content7, String content8, String content9, String content10) {
		super();
		this.maSanPham = maSanPham;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.danhmuc = danhmuc;
		this.image_link = image_link;
		this.luotxem = luotxem;
		this.buyed = buyed;
		this.hangsx = hangsx;
		this.baohanh = baohanh;
		this.trangthai = trangthai;
		this.content1 = content1;
		this.soLuongMua = soLuongMua;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.content5 = content5;
		this.content6 = content6;
		this.content7 = content7;
		this.content8 = content8;
		this.content9 = content9;
		this.content10 = content10;
	}



	



	@Override
	public String toString() {
		return "SanPhamModel [maSanPham=" + maSanPham + ", name=" + name + ", price=" + price + ", discount=" + discount
				+ ", danhmuc=" + danhmuc + ", image_link=" + image_link + ", luotxem=" + luotxem + ", buyed=" + buyed
				+ ", hangsx=" + hangsx + ", baohanh=" + baohanh + ", trangthai=" + trangthai + ", soLuongMua="
				+ soLuongMua + ", content1=" + content1 + ", content2=" + content2 + ", content3=" + content3
				+ ", content4=" + content4 + ", content5=" + content5 + ", content6=" + content6 + ", content7="
				+ content7 + ", content8=" + content8 + ", content9=" + content9 + ", content10=" + content10 + "]";
	}



	public int getMaSanPham() {
		return maSanPham;
	}



	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getDiscount() {
		return discount;
	}



	public void setDiscount(int discount) {
		this.discount = discount;
	}



	public int getDanhmuc() {
		return danhmuc;
	}



	public void setDanhmuc(int danhmuc) {
		this.danhmuc = danhmuc;
	}



	public String getImage_link() {
		return image_link;
	}



	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}




	public int getLuotxem() {
		return luotxem;
	}



	public void setLuotxem(int luotxem) {
		this.luotxem = luotxem;
	}



	public int getBuyed() {
		return buyed;
	}



	public void setBuyed(int buyed) {
		this.buyed = buyed;
	}



	public String getHangsx() {
		return hangsx;
	}



	public void setHangsx(String hangsx) {
		this.hangsx = hangsx;
	}



	public int getBaohanh() {
		return baohanh;
	}



	public void setBaohanh(int baohanh) {
		this.baohanh = baohanh;
	}



	public int getTrangthai() {
		return trangthai;
	}



	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}



	public String getContent1() {
		return content1;
	}



	public void setContent1(String content1) {
		this.content1 = content1;
	}



	public String getSoLuongMua() {
		return soLuongMua;
	}



	public void setSoLuongMua(String soLuongMua) {
		this.soLuongMua = soLuongMua;
	}



	public String getContent2() {
		return content2;
	}



	public void setContent2(String content2) {
		this.content2 = content2;
	}



	public String getContent3() {
		return content3;
	}



	public void setContent3(String content3) {
		this.content3 = content3;
	}



	public String getContent4() {
		return content4;
	}



	public void setContent4(String content4) {
		this.content4 = content4;
	}



	public String getContent5() {
		return content5;
	}



	public void setContent5(String content5) {
		this.content5 = content5;
	}



	public String getContent6() {
		return content6;
	}



	public void setContent6(String content6) {
		this.content6 = content6;
	}



	public String getContent7() {
		return content7;
	}



	public void setContent7(String content7) {
		this.content7 = content7;
	}



	public String getContent8() {
		return content8;
	}



	public void setContent8(String content8) {
		this.content8 = content8;
	}



	public String getContent9() {
		return content9;
	}



	public void setContent9(String content9) {
		this.content9 = content9;
	}



	public String getContent10() {
		return content10;
	}



	public void setContent10(String content10) {
		this.content10 = content10;
	}



	public SanPhamModel(String name, int price, int discount, int danhmuc, String image_link, int luotxem,
			String hangsx, int baohanh, int trangthai, String content1, String content2,
			String content3, String content4, String content5, String content6, String content7, String content8,
			String content9, String content10) {
		super();
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.danhmuc = danhmuc;
		this.image_link = image_link;
		this.luotxem = luotxem;
		this.hangsx = hangsx;
		this.baohanh = baohanh;
		this.trangthai = trangthai;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.content5 = content5;
		this.content6 = content6;
		this.content7 = content7;
		this.content8 = content8;
		this.content9 = content9;
		this.content10 = content10;
	}








	





	





	
	
	
	
}
