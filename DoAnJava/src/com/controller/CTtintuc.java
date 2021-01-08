package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SanPhamDAO;
import com.dao.TinTucDAO;


@WebServlet("/CTtintuc")
public class CTtintuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CTtintuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int id = Integer.parseInt(request.getParameter("id"));

		if(session.isNew()==false) {
			
				try {
					new TinTucDAO().updateView(id);
					System.out.println("1");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
		response.sendRedirect("nguoidung/chitiettintuc.jsp?id="+id );
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		response.sendRedirect("nguoidung/chitiettintuc.jsp?id="+id );
	}

}
