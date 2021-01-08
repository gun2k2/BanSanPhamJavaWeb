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
import com.dao.ThanhVienDAO;

import com.model.ThanhVienModel;

@WebServlet("/ThanhVienController")

public class ThanhVienController extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public ThanhVienController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
	
		response.setContentType("text/html;charset=utf-8");
	
	
		String chucNang = request.getParameter("chucNang");
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("delad", null);
		contextError.setAttribute("addad", null);
		contextError.setAttribute("upad", null);
		contextError.setAttribute("edit", null);
		contextError.setAttribute("repass", null);
		if (chucNang == null || chucNang.equals("")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			new ThanhVienDAO().del(id);
			contextError.setAttribute("delad", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/admin/ListAdmin.jsp");
		} else if (chucNang.equals("Sua")) {
			boolean check = false;
			ServletContext contextID = getServletContext();
			int id =  Integer.parseInt((String) contextID.getAttribute("id"));
			System.out.println(id);
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String password = request.getParameter("newpassword");		
			String ngaysinh = request.getParameter("ngaysinh");
			int gioitinh = Integer.parseInt(request.getParameter("gioitinh"));
			String sdt = request.getParameter("sdt");
			String province = request.getParameter("province_id");
			String district = request.getParameter("district");
			String ward = request.getParameter("ward");
			if(ThanhVienDAO.checkedit(email, pass)) {
				contextError.setAttribute("edit", "true");
				contextError.setAttribute("error", "true");
				check = false;
				response.sendRedirect("admin/admin/EditAdmin.jsp?id="+id );
				
			}
			if (null != email) {
				String regex = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$";
	            Pattern pattern = Pattern.compile(regex);
	            Matcher matcher = pattern.matcher(email);
	            if (!matcher.matches()) {
	            	contextError.setAttribute("error", "true");
	            	contextError.setAttribute("errorEmail", "Email không hợp lệ !!!");
	            	check = false;
	            	response.sendRedirect("admin/admin/EditAdmin.jsp?id="+id );
	            }
	            else check = true;
	        }
			if (check) {
			
		
			ThanhVienModel tv = new ThanhVienModel(id, name, email, password,ngaysinh,gioitinh,sdt,province,district,ward);
			
			new ThanhVienDAO().edit(tv, id);
			contextError.setAttribute("upad", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/admin/ListAdmin.jsp");
			}
		} else if (chucNang.equals("Them")) {
			try {
				
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String repassword = request.getParameter("repassword");
				if(!(password.equals(repassword))) {
					contextError.setAttribute("repass", "true");
					contextError.setAttribute("error", "true");
					response.sendRedirect("admin/admin/AddAdmin.jsp");	
				}
				else {
				String ngaysinh = request.getParameter("ngaysinh");
				int gioitinh = Integer.parseInt(request.getParameter("gioitinh"));
				String sdt = request.getParameter("sdt");
				String province = request.getParameter("province_id");
				System.out.println(province);
				String district = request.getParameter("district");
				System.out.println(district);
				String ward = request.getParameter("ward");
				System.out.println(ward);
				
				
				ThanhVienModel tv = new ThanhVienModel();
				
				tv.setName(name);
				tv.setEmail(email);
				tv.setPassword(password);
				tv.setNgaysinh(ngaysinh);
				tv.setGioitinh(gioitinh);
				tv.setSdt(sdt);
				tv.setProvince(province);
				tv.setDistrict(district);
				tv.setWard(ward);
				
				
				
				contextError.setAttribute("errorEmail", null);
				contextError.setAttribute("errorSdt", null);
				contextError = new ThanhVienDAO().check(tv,contextError);
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
					response.sendRedirect("admin/admin/AddAdmin.jsp");				
				}
				else {
					new ThanhVienDAO().add(tv);	
					contextError.setAttribute("addad", "true");
					contextError.setAttribute("error", "true");
					response.sendRedirect("admin/admin/ListAdmin.jsp");
				}
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}

		else {
			System.out.println("abcd");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}
