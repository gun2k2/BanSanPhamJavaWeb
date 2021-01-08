package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.dao.giohang;
@WebServlet("/XuLyXoaSP")
public class XuLyXoaSP extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public XuLyXoaSP() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP  = Integer.parseInt(request.getParameter("maSanPham"));
		System.out.println(maSP);
		new giohang().xoaSanPhamRakhoiGioHang(maSP);
		System.out.print("xoa thanh cong");
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
