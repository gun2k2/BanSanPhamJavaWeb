package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DangXuatAdmin
 */
@WebServlet("/DangXuatAdmin")
public class DangXuatAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DangXuatAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.invalidate();
		System.out.println("Dang Xuat Thanh Cong");
		response.sendRedirect("admin/DangNhap.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.invalidate();
		System.out.println("Dang Xuat Thanh Cong");
		response.sendRedirect("admin/DangNhap.jsp");
	}

}
