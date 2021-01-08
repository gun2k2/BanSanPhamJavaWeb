package com.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.KhachHangDAO;

import com.model.KhachHangModel;



@WebServlet("/LoginAdminController")
public class LoginAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		
		if(action==null) {
			System.out.println("Không làm gì hết");
		}
		else if(action.equals("Login")) {
			System.out.println(action);
			String userName = request.getParameter("username");
			String passWord = request.getParameter("password");
			System.out.println(userName + passWord);
			ServletContext contextError = getServletContext();
			contextError.setAttribute("error", "false");
			contextError.setAttribute("f5", "false");
			contextError.setAttribute("erroruser", null);
			contextError.setAttribute("errortontai", null);
			contextError = new KhachHangDAO().checkLogin(userName,passWord,contextError);
			if( contextError.getAttribute("error").equals("true")) 
			{
				contextError.setAttribute("password", null);
				response.sendRedirect("nguoidung/dangnhap.jsp");
				
			}
			else {
				HttpSession session = request.getSession();
				KhachHangModel kh =KhachHangDAO.loadData().get(userName);
				session.setAttribute("userloginadmin", kh);
				System.out.println("Dang nhap Thanh Cong");
				response.sendRedirect("nguoidung/index.jsp");
				
			}

			
		}
		else if(action.equals("Res")) {
			
			try {
				
//				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String sdt = request.getParameter("sdt");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				
				
				KhachHangModel kh = new KhachHangModel();
				kh.setName(name);			
				kh.setEmail(email);
				kh.setSdt(sdt);
				kh.setUsername(username);
				kh.setPassword(password);		
		
				ServletContext contextError = getServletContext();
				contextError.setAttribute("error", "false");
				contextError.setAttribute("f5", "false");
				contextError.setAttribute("errorUsername", null);
				contextError.setAttribute("errorEmail", null);
				contextError.setAttribute("errorSdt", null);
				contextError.setAttribute("dky", null);
				
				contextError = new KhachHangDAO().check(kh,contextError);
				if (null != email) {
					String regex = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$";
		            Pattern pattern = Pattern.compile(regex);
		            Matcher matcher = pattern.matcher(email);
		            if (!matcher.matches()) {
		            	contextError.setAttribute("error", "true");
		            	contextError.setAttribute("errorEmail", "Email không hợp lệ !!!");
		            }
		        }
				if (contextError.getAttribute("error").equals("true")) {
					
					response.sendRedirect("nguoidung/dangky.jsp");
					
				}
				else {
					new KhachHangDAO().add(kh);
					contextError.setAttribute("error", "true");
					contextError.setAttribute("dky", "true");
					response.sendRedirect("nguoidung/dangnhap.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			
		}
		else if(action.equals("Logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			System.out.println("Out Thanh Cong");
			response.sendRedirect("nguoidung/dangnhap.jsp");
		}
		
	}

}
