package com.dao;


import java.sql.ResultSet;

import java.time.LocalDate;
import java.util.ArrayList;


import com.model.ConnectionToDB;
import com.model.DonHangModel;
import com.model.SanPhamModel;



public class giohang implements ObjectDAO   {
				public static ArrayList<SanPhamModel> dsSanPham= new ArrayList<>();
				public static ArrayList<SanPhamModel> gioHang= new ArrayList<>();
				
				public  giohang(){
					
				
					dsSanPham.removeAll(dsSanPham);
						try {
							ResultSet rs = new ConnectionToDB().selectData("select * from sanpham ");
							while(rs.next()){
								int maSanPham = rs.getInt("maSanPham");								
								String soLuongMua = rs.getString("soLuongMua");
								String name = rs.getString("name");
								int price = rs.getInt("price");
								int discount = rs.getInt("discount");
								String image_link = rs.getString("image_link");
								SanPhamModel sanpham = new SanPhamModel(maSanPham,name, price, discount ,image_link, soLuongMua);
								dsSanPham.add(sanpham);
							
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
				
				}
							
				public boolean kiemTraSanPhamCoTrongGioHangChua(int maSanPham){
					for (int i = 0; i < gioHang.size(); i++) {
						if(gioHang.get(i).getMaSanPham() == maSanPham){
							return true;
						}
					}
					return false;
				}
				
				public boolean themVaoGioHang(int maSanPham){
					System.out.println("da vao gio hang");
					System.out.println(gioHang.size());
					System.out.println(dsSanPham.size());
					boolean kiemTra = kiemTraSanPhamCoTrongGioHangChua(maSanPham);
					for (int i = 0; i <dsSanPham.size(); i++) {
				
							if(dsSanPham.get(i).getMaSanPham()== maSanPham && kiemTra==false){
								gioHang.add(dsSanPham.get(i));
								
								return true;
							}
					}
					if(kiemTra==true){
						int index =gioHang.size();
						for (int i = 0; i < index; i++) {
							if(gioHang.get(i).getMaSanPham()== maSanPham){
								System.out.println("index="+index);
								System.out.println("i="+i);
								gioHang.get(i).setSoLuongMua(Integer.parseInt(gioHang.get(i).getSoLuongMua())+1+"");
								index=i;
							}
						}
					}
					return false;
				}
				
		
				public boolean tangsoluonggiohang(int maSanPham,int sl){
					System.out.println("da vao gio hang");
				
					boolean kiemTra = kiemTraSanPhamCoTrongGioHangChua(maSanPham);
					for (int i = 0; i <dsSanPham.size(); i++) {
				
							if(dsSanPham.get(i).getMaSanPham()== maSanPham && kiemTra==false){
								gioHang.add(dsSanPham.get(i));
								
								return true;
							}
					}
					if(kiemTra==true){
						System.out.println(gioHang.size());
		
						for (int i = 0; i < sl; i++) {
							if(gioHang.get(i).getMaSanPham()== maSanPham){
								if(Integer.parseInt(gioHang.get(i).getSoLuongMua())>0) {
								
							
								System.out.println("i="+i);
								System.out.println("sl="+sl);
								gioHang.get(i).setSoLuongMua((sl)+"");
								
								}
								sl=i;
							}
							
						}
					}
					return false;
				}
				public boolean xoaSanPhamRakhoiGioHang(int maSanPham){
				
					for (int i = 0; i < gioHang.size(); i++) {
						if(gioHang.get(i).getMaSanPham()== maSanPham){
							
							gioHang.remove(i);
							
							return true;
						}
					}
					return false;
				}
				public boolean xoa(int[] maSanPham){
					gioHang.removeAll(gioHang);
					return true;
				}

				public static ArrayList<SanPhamModel> getDsSanPham() {
					return dsSanPham;
				}

				public static void setDsSanPham(ArrayList<SanPhamModel> dsSanPham) {
					giohang.dsSanPham = dsSanPham;
				}

				public static ArrayList<SanPhamModel> getGioHang() {
					return gioHang;
				}

				public static void setGioHang(ArrayList<SanPhamModel> gioHang) {
					giohang.gioHang = gioHang;
				}
				@Override
				public boolean add(Object obj) {
					DonHangModel dh = (DonHangModel) obj;
					int buyed = 0;
					int madonhang = 1;
					ConnectionToDB con = new ConnectionToDB();
					try {
						ResultSet rs = con.selectData("select top (1) id from ct_donhang order by id desc");
						if (rs.next()) { 
							madonhang = rs.getInt("id")+1;
						}
						 
						
						
						for(int i = 0; i < gioHang.size(); i++) { 
							new ConnectionToDB().excuteSql("insert into ct_donhang values("+madonhang + "," + dh.getMasp()[i] + ",N'" + dh.getName() + "', '" 
							+ dh.getEmail() + "', '" + dh.getSdt() + "', N'" + dh.getProvince() + "', N'" + dh.getDistrict() + "', N'" 
							+ dh.getWard() + "', N'" + dh.getGhichu() + "', " + dh.getSoluong()[i] +", " + dh.getTongtien()[i] + ", '" 
							+LocalDate.now()+ "' , 1)");	
							rs = con.selectData("select buyed from sanpham where masanpham = "+dh.getMasp()[i]);
							rs.next();
							buyed = rs.getInt("buyed") + Integer.parseInt(dh.getSoluong()[i]);
							new ConnectionToDB().excuteSql("update sanpham set buyed = "+buyed 
															+" where masanpham = " + dh.getMasp()[i]);
						}
						
						return true;
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
					return false;
				}

				@Override
				public boolean edit(Object obj, int id) {
					// TODO Auto-generated method stub
					return false;
				}

				@Override
				public boolean del(int id) {
					// TODO Auto-generated method stub
					return false;
				}

				public void giamGioHang(int maSP) {
					// TODO Auto-generated method stub
					int index =gioHang.size();
					
					for (int i = 0; i < index; i++) {
						if(gioHang.get(i).getMaSanPham()== maSP){
							gioHang.get(i).setSoLuongMua(Integer.parseInt(gioHang.get(i).getSoLuongMua())-1+"");
							if (gioHang.get(i).getSoLuongMua().equals("0")) gioHang.remove(i);
							index=i;
						}
					}
					
				}
				
}

