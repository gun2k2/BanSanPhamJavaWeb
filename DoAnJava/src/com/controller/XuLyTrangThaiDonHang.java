package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DonHangDAO;
import com.dao.ThanhVienDAO;
import com.model.DonHangModel;


@WebServlet("/XuLyTrangThaiDonHang")
public class XuLyTrangThaiDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public XuLyTrangThaiDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("trangthai", null);
		contextError.setAttribute("deldh", null);
		int id = Integer.parseInt(request.getParameter("id"));
		
		int trangthai = Integer.parseInt(request.getParameter("trangthai"));
		DonHangModel dh = new DonHangModel(trangthai);
		new DonHangDAO().edit(dh, id);
		contextError.setAttribute("error", "true");
		contextError.setAttribute("trangthai", "true");
		response.sendRedirect("admin/donhang.jsp");

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
