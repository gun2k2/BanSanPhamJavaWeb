package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.KhachHangDAO;
import com.model.KhachHangModel;

@WebServlet("/editKH")
public class editKH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public editKH() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ServletContext contextChucNang = getServletContext();
		String chucNang = (String) contextChucNang.getAttribute("chucNang");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(chucNang);
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("info", null);
		if (chucNang.equals("Sua")) {
			ServletContext contextID = getServletContext();
			int id =  Integer.parseInt((String) contextID.getAttribute("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
		
			KhachHangModel kh = new KhachHangModel(id, name, email,sdt,username, password);
			new KhachHangDAO().edit(kh, id);
			contextError.setAttribute("info", "true");
			contextError.setAttribute("error", "true");
			HttpSession session = request.getSession(true);	
			session.invalidate();
			System.out.println("Dang Xuat Thanh Cong");
			response.sendRedirect("nguoidung/dangnhap.jsp");
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
