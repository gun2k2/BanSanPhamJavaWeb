package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.danhmucDAO;
import com.model.DanhMucModel;


@WebServlet("/DanhMucController")
public class DanhMucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DanhMucController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//String chucNang = (String) contextChucNang.getAttribute("chucNang");
		String chucNang = request.getParameter("chucNang");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		System.out.println(chucNang);
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("deldm", null);
		contextError.setAttribute("adddm", null);
		contextError.setAttribute("updm", null);
		if (chucNang == null || chucNang.equals("")) {
				
			int id = Integer.parseInt(request.getParameter("id"));
			
			new danhmucDAO().del(id);	
			contextError.setAttribute("deldm", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/danhmuc/ListDanhMuc.jsp");
		} else if (chucNang.equals("Sua")) {
			ServletContext contextID = getServletContext();
			int id =  Integer.parseInt((String) contextID.getAttribute("id"));
			
			String name = request.getParameter("name");
			int parent_id = Integer.parseInt(request.getParameter("parent_id"));		
			DanhMucModel dm = new DanhMucModel(id, name,parent_id )	;	
			new danhmucDAO().edit(dm, id);
			contextError.setAttribute("updm", "true");
			contextError.setAttribute("error", "true");		
			response.sendRedirect("admin/danhmuc/ListDanhMuc.jsp");
		} else if (chucNang.equals("Them")) {
			try {
				
				String name = request.getParameter("name");		
				int parent_id = Integer.parseInt(request.getParameter("parent_id"));
				DanhMucModel dm = new DanhMucModel();				
				dm.setName(name);			
				dm.setParent_id(parent_id);
				new danhmucDAO().add(dm);			
				contextError.setAttribute("adddm", "true");
				contextError.setAttribute("error", "true");
				response.sendRedirect("admin/danhmuc/ListDanhMuc.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} else {
			System.out.println("abcd");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
