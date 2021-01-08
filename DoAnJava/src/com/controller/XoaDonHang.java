package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DonHangDAO;
import com.dao.danhmucDAO;

@WebServlet("/XoaDonHang")
public class XoaDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public XoaDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("deldh", null);
		contextError.setAttribute("trangthai", null);
		int id = Integer.parseInt(request.getParameter("id"));
		new DonHangDAO().del(id);
		contextError.setAttribute("error", "true");
		contextError.setAttribute("deldh", "true");
		response.sendRedirect("admin/donhang.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
