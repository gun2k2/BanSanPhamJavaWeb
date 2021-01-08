package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.KhachHangDAO;
import com.model.KhachHangModel;

@WebServlet("/Loginfb")
public class Loginfb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Loginfb() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		//HttpSession session = request.getSession();
			
		
		if(action.equals("Face"))
		{
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String idkh = request.getParameter("id");
			KhachHangModel kh =KhachHangDAO.loadfb().get(idkh);
			if(kh!=null)
			{
					if(kh.getIdkh().equals(idkh)) {
						System.out.println("dung mk");
						HttpSession session = request.getSession();
						session.setAttribute("userfb", kh);
						System.out.println("Dang nhap Thanh Cong");
						response.sendRedirect("nguoidung/index.jsp");
					}
					
			}
			else 
			{
				System.out.println(name);
				System.out.println(email);
				System.out.println(idkh);
				KhachHangModel khfb = new KhachHangModel();
				khfb.setIdkh(idkh);
				khfb.setName(name);			
				khfb.setEmail(email);
				new KhachHangDAO().add(khfb);
				System.out.println("Dang Ky Thanh Cong");
				response.sendRedirect("nguoidung/index.jsp");
			}
		}
		else if(action.equals("google"))
		{
			String name = request.getParameter("Name");
			String email = request.getParameter("Email");
			String idkh = request.getParameter("ID");
			KhachHangModel kh1 =KhachHangDAO.loadfb().get(idkh);
			if(kh1!=null)
			{
					if(kh1.getIdkh().equals(idkh)) 
					{
						System.out.println("dung mk");
						HttpSession session = request.getSession();
						session.setAttribute("usergg", kh1);
						System.out.println("Dang nhap Thanh Cong");
						response.sendRedirect("nguoidung/index.jsp");
					}
					
			}
			else {
				System.out.println(name);
				System.out.println(email);
				System.out.println(idkh);
				KhachHangModel khgg = new KhachHangModel();
				khgg.setIdkh(idkh);
				khgg.setName(name);			
				khgg.setEmail(email);
				new KhachHangDAO().add(khgg);
				System.out.println("Dang ky Thanh Cong");
				response.sendRedirect("nguoidung/index.jsp");
				}
		}
			
		}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
