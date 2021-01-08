package com.controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SanPhamDAO;



@WebServlet("/CTSanPham")
public class CTSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CTSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String maSP  = request.getParameter("maSanPham");
		
		System.out.println(session.isNew());
		
		if(session.isNew()==false) {
			
				try {
					new SanPhamDAO().updateView(maSP);
					System.out.println("1");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
		
		
		System.out.println(maSP);
//		 respone
//		rd.forward(request, response);
		
		response.sendRedirect("nguoidung/chitietsanpham.jsp?maSanPham="+maSP );
		
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
