package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ThanhVienDAO;
import com.model.ThanhVienModel;


@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginController() {
        super();
        
    }
// chạy tren Khachangdao truoc da .
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		
		if(action==null) {
			System.out.println("Không làm gì hết");
		}
		else if(action.equals("Login")) {
			String eMail = request.getParameter("email");
			String passWord = request.getParameter("password");
			System.out.println(eMail + passWord);
			//new ThanhVienDAO();
			if( ThanhVienDAO.checkLogin(eMail, passWord)) {
				HttpSession session = request.getSession();
				ThanhVienModel tv =ThanhVienDAO.loadData().get(eMail);
				session.setAttribute("userlogin", tv);
				System.out.println("Thanh Cong");
				response.sendRedirect("admin/index.jsp");
			}
			else {
				ServletContext contextError = getServletContext();
				contextError.setAttribute("erroror", "Ban Nhap Thong Tin Sai");
				response.sendRedirect("admin/DangNhap.jsp");
			}

			
		}
		else if(action.equals("Logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			System.out.println("Out Thanh Cong");
			response.sendRedirect("admin/DangNhap.jsp");
		}
	}

}
