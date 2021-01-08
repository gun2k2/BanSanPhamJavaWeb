package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.SanPhamDAO;
import com.model.SanPhamModel;

@WebServlet("/SanPhamController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
				maxFileSize=1024*1024*10,      // 10MB
				maxRequestSize=1024*1024*50)   // 50MB
public class SanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String chucNang = request.getParameter("chucNang");
		

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(chucNang);
		ServletContext contextError = getServletContext();
		contextError.setAttribute("error", "false");
		contextError.setAttribute("f5", "false");
		contextError.setAttribute("delsp", null);
		contextError.setAttribute("addsp", null);
		contextError.setAttribute("upsp", null);
		if (chucNang == null || chucNang.equals("") ) {
			int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
			try {
				new SanPhamDAO().del(maSanPham);
				contextError.setAttribute("delsp", "true");
				contextError.setAttribute("error", "true");
				response.sendRedirect("admin/sanpham/ListSanPham.jsp");
			} catch (SQLException e) {
				e.printStackTrace();    //xoÃ¡ khÃ´ng thÃ nh cÃ´ng in lá»—i
			}			
			
		} else if (chucNang.equals("Sua")) {
		
			try {
				ServletContext contextID = getServletContext();
				
				int maSanPham =  Integer.parseInt((String) contextID.getAttribute("maSanPham"));
				System.out.println(maSanPham);
				String name = request.getParameter("name");
				int price = Integer.parseInt(request.getParameter("price"));
				int discount = Integer.parseInt(request.getParameter("discount"));	
				int danhmuc = Integer.parseInt(request.getParameter("danhmuc"));
				//upload anh
				String image_link = getFileName(request); 			
				
				int baohanh = Integer.parseInt(request.getParameter("baohanh"));
				
				String hangsx =request.getParameter("hangsx");
				int luotxem = Integer.parseInt("1");
				int buyed = Integer.parseInt("0");
				String soLuongMua = "1";
				int trangthai = Integer.parseInt("1");
				
				String content1 =request.getParameter("content1");
				String content2 =request.getParameter("content2");
				String content3 =request.getParameter("content3");
				String content4 =request.getParameter("content4");
				String content5 =request.getParameter("content5");
				String content6 =request.getParameter("content6");
				String content7 =request.getParameter("content7");
				String content8 =request.getParameter("content8");
				String content9 =request.getParameter("content9");
				String content10 =request.getParameter("content10");
				SanPhamModel sp = new SanPhamModel(name, price, discount, danhmuc, image_link, luotxem,buyed, hangsx, baohanh, trangthai,soLuongMua, content1, content2, content3, content4, content5, content6, content7, content8, content9, content10);
				System.out.println(sp);			
				new SanPhamDAO().update(sp, maSanPham);	
				contextError.setAttribute("upsp", "true");
				contextError.setAttribute("error", "true");
				response.sendRedirect("admin/sanpham/ListSanPham.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();   
			}
			
	}  
	else if (chucNang.equals("Them")) {
		try {
			
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			int discount = Integer.parseInt(request.getParameter("discount"));	
			int danhmuc = Integer.parseInt(request.getParameter("danhmuc"));
			//upload anh
			String image_link = getFileName(request); 			
			
			int baohanh = Integer.parseInt(request.getParameter("baohanh"));
			
			String hangsx =request.getParameter("hangsx");
			int luotxem = Integer.parseInt("1");
			int buyed = Integer.parseInt("0");
			String soLuongMua = "1";
			int trangthai = Integer.parseInt("1");
			
			String content1 =request.getParameter("content1");
			String content2 =request.getParameter("content2");
			String content3 =request.getParameter("content3");
			String content4 =request.getParameter("content4");
			String content5 =request.getParameter("content5");
			String content6 =request.getParameter("content6");
			String content7 =request.getParameter("content7");
			String content8 =request.getParameter("content8");
			String content9 =request.getParameter("content9");
			String content10 =request.getParameter("content10");
			SanPhamModel sp = new SanPhamModel(name, price, discount, danhmuc, image_link, luotxem,buyed, hangsx, baohanh, trangthai,soLuongMua, content1, content2, content3, content4, content5, content6, content7, content8, content9, content10);
			System.out.println(sp);
			new SanPhamDAO();
			SanPhamDAO.add(sp);
			contextError.setAttribute("addsp", "true");
			contextError.setAttribute("error", "true");
			response.sendRedirect("admin/sanpham/ListSanPham.jsp");
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}  
		else {
			System.out.println("abcd");
		}
		
	}

	
//	private String getFileName(HttpServletRequest request) throws IOException, ServletException {
//		String duongdanWin = getServletContext().getRealPath("") + "admin"+File.separator+"images";
//		Part file = request.getPart("image_link");
//		String fileName = file.getSubmittedFileName();
//        file.write(duongdanWin + File.separator + fileName); 
//		return fileName;		
//	}
	private String getFileName(HttpServletRequest request) throws IOException, ServletException {
		//String projectName = "JavaWeb/DoAnJava";
			
		Part file = request.getPart("image_link");
		String fileName = file.getSubmittedFileName();
		
		String duongdanWin = getServletContext().getRealPath("") + "nguoidung"+File.separator+"images";
        file.write(duongdanWin + File.separator + fileName); 
       
        System.out.println("duongdanWin" + duongdanWin);
    	System.out.println("fileName" + fileName);
    	
		return fileName;		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
