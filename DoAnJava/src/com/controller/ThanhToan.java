package com.controller;

import java.io.IOException;

import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.giohang;
import com.model.DonHangModel;




@WebServlet("/ThanhToan")
public class ThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ThanhToan() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
//			for(String i: sanpham) {
//				System.out.println(i);
//			}
//			int id = Integer.parseInt(request.getParameter("id"));
			ServletContext contextError = getServletContext();
			contextError.setAttribute("error", "false");
			contextError.setAttribute("f5", "false");
			contextError.setAttribute("thanhtoan", null);
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");	
			String province = request.getParameter("province_id");
			System.out.println(province);
			String district = request.getParameter("district");
			System.out.println(district);
			String ward = request.getParameter("ward"); 
			System.out.println(ward);
			
			String ghichu = request.getParameter("ghichu");
			System.out.println(ghichu);
			
			String[] sanpham = request.getParameterValues("sanpham[]");
			
			
			String[] masp = request.getParameterValues("masp[]");
			String[] soluong = request.getParameterValues("soluong[]");
		
			String[] tongtien = request.getParameterValues("tongtien[]");
		
			 Date ngaymua = new Date(); 
					
			int trangthai = Integer.parseInt("1");
			
			
			DonHangModel dh = new DonHangModel();
			
			dh.setName(name);			
			dh.setEmail(email);
			dh.setSdt(sdt);	
			dh.setProvince(province);
			dh.setDistrict(district);
			dh.setWard(ward);
			dh.setGhichu(ghichu);
			
			dh.setSanpham(sanpham);
			
			dh.setMasp(masp);
			dh.setSoluong(soluong);
			dh.setTongtien(tongtien);
			dh.setNgaymua(ngaymua);
			dh.setTrangthai(trangthai);
			
			new giohang().add(dh); 
			String[] maSP  = request.getParameterValues("maSanPham[]");
			int size = maSP.length;
		     int [] arr = new int [size];
		     for(int i=0; i<size; i++) {
		         arr[i] = Integer.parseInt(maSP[i]);
		      }
		     System.out.println(Arrays.toString(arr));
			new giohang().xoa(arr);
			contextError.setAttribute("thanhtoan", "true");
			contextError.setAttribute("error", "true");
			
			response.sendRedirect("nguoidung/giohang.jsp");
	}

}
