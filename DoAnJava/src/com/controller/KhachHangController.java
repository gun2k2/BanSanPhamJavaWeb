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

import com.dao.KhachHangDAO;
import com.model.KhachHangModel;


@WebServlet("/KhachHangController")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public KhachHangController() {
        super();
       
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
		contextError.setAttribute("errorUsername", null);
		contextError.setAttribute("errorEmail", null);
		contextError.setAttribute("errorSdt", null);
		contextError.setAttribute("delkh", null);
		contextError.setAttribute("addkh", null);
		contextError.setAttribute("upkh", null);
		if (chucNang == null || chucNang.equals("")) {
			chucNang=request.getParameter("chucNang");
			int id = Integer.parseInt(request.getParameter("id"));
			new KhachHangDAO().del(id);
			contextError.setAttribute("delkh", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/khachhang/ListKhachHang.jsp");
		} else if (chucNang.equals("Sua")) {
			ServletContext contextID = getServletContext();
			int id =  Integer.parseInt((String) contextID.getAttribute("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
	
			
			KhachHangModel kh = new KhachHangModel(id, name, email,sdt,username, password);
			new KhachHangDAO().edit(kh, id);
			contextError.setAttribute("upkh", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/khachhang/ListKhachHang.jsp");
		} else if (chucNang.equals("Them")) {
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
				
					response.sendRedirect("admin/khachhang/AddKhachHang.jsp");
					
				}
				else {
					new KhachHangDAO().add(kh);
					contextError.setAttribute("addkh", "true");
					contextError.setAttribute("error", "true");
					response.sendRedirect("admin/khachhang/ListKhachHang.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} else {
			System.out.println("abcd");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		
	}

}
