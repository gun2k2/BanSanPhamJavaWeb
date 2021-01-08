package com.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.giohang;
import com.model.SanPhamModel;


@WebServlet("/XuLyMuaHang")
public class XuLyMuaHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public XuLyMuaHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int maSP = Integer.parseInt(request.getParameter("maSanPham"));
		String action = request.getParameter("action");

		System.out.println(maSP);
		giohang cart = new giohang();
		if (action.equals("giam")) 
		{
			cart.giamGioHang(maSP);
		}
			
		else if(action.equals("update")) {
			
			int sl = Integer.parseInt(request.getParameter("sl"));
			cart.tangsoluonggiohang(maSP,sl);
		}
		else {
			cart.themVaoGioHang(maSP);
		}
		
		
		
		ArrayList<SanPhamModel> dsGioHang = new ArrayList<SanPhamModel>();
		dsGioHang = giohang.getGioHang();
		session.setAttribute("cart", dsGioHang);
		response.sendRedirect("nguoidung/giohang.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
