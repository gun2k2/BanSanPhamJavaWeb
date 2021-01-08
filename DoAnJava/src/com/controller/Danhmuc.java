package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Danhmuc")
public class Danhmuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Danhmuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id  = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		
		response.sendRedirect("nguoidung/sanpham.jsp?id="+id);
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
