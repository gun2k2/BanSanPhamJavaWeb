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
import com.dao.SendMailDAO;
import com.model.KhachHangModel;


@WebServlet("/SendMailController")
public class SendMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SendMailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("successpass", null);
		contextError.setAttribute("errorpass", null);
		contextError.setAttribute("errorcode", null);
		String action = request.getParameter("action");
		HttpSession session  = request.getSession();
		
		SendMailDAO sm = new SendMailDAO();
		String code = sm.getRandom();
		System.out.println(code);
		if (action.equals("guimail")) {
			String email = request.getParameter("email");
			boolean success = sm.sendEmail(email, code);
			contextError = new KhachHangDAO().checkEmail(email,contextError);
			if( contextError.getAttribute("error").equals("true")) {
				
				System.out.println("email khong ton tai.");
				contextError.setAttribute("errorpass", "true");
				contextError.setAttribute("error", "true");	
	            response.sendRedirect("nguoidung/QuenMatKhau.jsp");
				
			}else {
				if (success) {
					System.out.println("vao duoc");
					contextError.setAttribute("error", "true");		
		            session.setAttribute("authcode", code);            
		            response.sendRedirect("nguoidung/QuenMatKhau.jsp");
				}
			}
			
					
		}
		else if (action.equals("xacthuc")) {
			String authcode = (String) session.getAttribute("authcode");
			
				String email =  (String) contextError.getAttribute("email");
				
				contextError.setAttribute("password", null);
				contextError.setAttribute("repassword", null);
			    contextError = getServletContext();
		
				
				System.out.println("Trung code xac thuc");
				
				String password = request.getParameter("password");
				String repassword = request.getParameter("repassword");
				System.out.println("code" + authcode);
			
				if(password.equals(repassword)) 
				{
					KhachHangModel kh = new KhachHangModel(email,password);
					new KhachHangDAO().updatepassword(kh, email);
					contextError.setAttribute("password", "true");
					contextError.setAttribute("error", "true");
					
					response.sendRedirect("nguoidung/dangnhap.jsp");
				}
				else {
					contextError.setAttribute("repassword", "true");
					contextError.setAttribute("error", "true");	
					response.sendRedirect("nguoidung/doipass.jsp?code="+authcode+"&email="+email );
				}
			
					
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
