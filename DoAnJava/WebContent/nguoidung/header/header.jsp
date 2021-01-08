<%@page import="com.dao.giohang"%>
<%@page import="com.model.KhachHangModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.jdi.connect.Connector"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.model.SanPhamModel"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%KhachHangModel  kh = (KhachHangModel)session.getAttribute("userloginadmin"); %>
   
        <%KhachHangModel  khfb = (KhachHangModel)session.getAttribute("userfb"); %>  
        <%KhachHangModel  khgg = (KhachHangModel)session.getAttribute("usergg"); %>    	
  <header class="header">
	
        <div class="mainbar topbar">
        <div class="container">
            <div class="row">
                <div class="menu-bar hidden-lg">
                    <a href="#nav-mobile">
                        <i class="fa fa-align-justify"></i>
                    </a>
                </div>
                <!--  ICON MẠNG XÃ HỘI  -->
                <div class="hidden-xs col-sm-4 col-sm-offset-0 col-md-4 col-lg-2 item-mainbar">
                    <div class="header-social">
                        <ul class="inline-list social-icons">
                            <li>
                               <a class="icon-fallback-text txt-facebook hv-bg-facebook hv-bd-facebook" target="_blank" href="https://www.facebook.com/phuongnenenha">
                                                <span class="icon icon-facebook" aria-hidden="true">
                                                    <i class="fa fa-facebook"></i>
                                                </span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-fallback-text txt-twitter hv-bg-twitter hv-bd-twitter"
                                   href="https://twitter.com/">
                                                <span class="icon icon-twitter" aria-hidden="true">
                                                    <i class="fa fa-twitter"></i>
                                                </span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-fallback-text txt-google-plus hv-bg-google-plus hv-bd-google-plus"
                                   href="https://plus.google.com/">
                                                <span class="icon icon-google-plus" aria-hidden="true">
                                                    <i class="fa fa-google-plus"></i>
                                                </span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-fallback-text txt-youtube hv-bg-youtube hv-bd-youtube"
                                   href="https://www.youtube.com">
                                                <span class="icon icon-youtube" aria-hidden="true">
                                                    <i class="fa fa-youtube"></i>
                                                </span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-fallback-text txt-instagram hv-bg-instagram hv-bd-instagram"
                                   href="https://www.instagram.com/">
                                                <span class="icon icon-instagram" aria-hidden="true">
                                                    <i class="fa fa-instagram"></i>
                                                </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END ICON MẠNG XÃ HỘI  -->
            <!--  LOGO CUA TRANG CHỦ -->
                <div class="col-xs-2 hidden-sm hidden-md hidden-lg"></div>
                <div class="col-xs-6 col-xs-offset-1 col-sm-4 col-sm-offset-0 col-md-4 col-lg-3 item-mainbar">
                    <div class="logo">
                        <a title="PHUONGPHAN.VN" href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">
                            <img id="logo-header" class="img-responsive" src="http://localhost:8080/DoAnJava/nguoidung/images/brand.png"
                                 alt="">
                        </a>
                    </div>
                </div>
            <!-- END LOGO CUA TRANG CHỦ -->
            
            <!-- TÌM KIẾM -->
                <div class="hidden-xs hidden-sm hidden-md col-lg-5 item-mainbar">
                    <div class="top_right fw ">
                        <div class="search_bar">
                            <div class="input-group">
                                <form action="search.jsp" method="get">
                                    <input type="text" class="form-control" autocomplete="off" maxlength="70"
                                           name="q"   id="search" title="Nhập từ khoá cần tìm"
                                           placeholder="Tìm theo tên sản phẩm..." required/>
                                    <button  class="btn" >
                                        <i class="fa fa-search"></i>
                                    </button>
                                </form>
                             <%      ConnectionToDB con = new ConnectionToDB();
								ResultSet dm = null;     
                                String query = request.getParameter("q");
                                         	
                             	String data;
                             	if(query!=null)
                             	{
                             		data = "select * from danhmuc where name like '%"+query+"%'  ";
                             	}else{
                             		data = "select * from danhmuc order by id asc";
                             	}
                             	
                             	
                             	dm	 = con.selectData(data); 
                         %>
                            </div>
                        </div>
                        <%if(kh!= null || khfb!= null || khgg!= null){ %>
                        <div class="hotline hidden-xs">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <nav id="taikhoaninfo" style="position: relative; color:back; background-color: blue; " >
                      <ul id="nav" class="nav container"> <!-- 4 CỘT -->
                     <li class="nav-item "> <!--  CỘT 1 -->
 					      
                    <a class="nav-link">Tài Khoản<i class="fa fa-angle-down" data-toggle="dropdown"></i></a>
                    <ul class="dropdown-menu"> 
                  
                   
                         <li class="dropdown-submenu nav-item-lv2">  <!-- MỤC ĐẦU TIÊN -->
                    
                 	 <%if(kh==null){ %> <%} if(kh!=null){  
                 	 ResultSet khach = new ConnectionToDB().selectData("select * from KhachHang where id= " + kh.getId());
                        while( khach.next()){%>        
                         	<a class="nav-link"  href="http://localhost:8080/DoAnJava/nguoidung/thongtintaikhoan.jsp?id=<%=khach.getInt(1)%>" title="<%=khach.getString(2)%>">
                            <strong>Thông tin tài khoản</strong>
                            </a> 
                        <%}} if(khfb!=null){
                       ResultSet khach = new ConnectionToDB().selectData("select * from KhachHang where id= " + khfb.getId());
                        while(khach.next()){ %>
                        <a class="nav-link"  href="http://localhost:8080/DoAnJava/nguoidung/thongtintaikhoan.jsp?id=<%=khach.getInt(1)%>" title="<%=khach.getString(2)%>">
                            <strong>Thông tin tài khoản</strong>
                            </a> 
                        
                        <%} }%>
                            <a class="nav-link"  href="http://localhost:8080/DoAnJava/nguoidung/theodoidonhang.jsp" title="">
                         
                            <strong>Đơn hàng của tôi</strong>
                            </a> 
                            
					   </li>
                                      
                    </ul>
                </li>
		
             </ul>
             </nav>
             </div>
                        </div>
                        <%} %>
                    </div>
                </div>
            <!-- END TÌM KIẾM -->
            <!-- ĐĂNG NHẬP -->
                <div class="hidden-xs hidden-sm hidden-md col-lg-1 item-mainbar">
                     <div class="top_left fw">
                            <ul>
                                <li class="cp-item">
                              
                                    <a href="http://localhost:8080/DoAnJava/DangXuat"  class="btn-transition">
                                        <i class="fa fa-sign-in"></i><span >
                                          <%if(kh!=null)
                                          {
                                        	  out.print(kh.getName());
                                          } 
                                          else if(khfb!=null)
                                          {    
         									  out.print(khfb.getName());                    
                                           }
                                           else{ 
                                        	   if(khgg!=null){
                                        		   
                                        		   out.print(khgg.getName());  
                                        	   }
                                        	   else{
                                        		   out.print("ĐăngNhập");  
                                        	   }
                                        	   
                                           }%>   
                                         
                                            
            			
            	 				</span>
            	 				
                                    </a>
                                   
                                </li>
                            </ul>
                  </div>
                </div>
                
            <!-- END ĐĂNG NHẬP -->
            
             <!-- GIỎ HÀNG -->
                <div class="col-xs-2 col-xs-offset-1 col-sm-4 col-sm-offset-0 col-md-4 col-lg-1 item-mainbar">
                    <div class="top-cart-contain panel_cart">
                        <div class="mini-cart text-xs-center">
                            <div class="heading-cart">
                                <a href="http://localhost:8080/DoAnJava/nguoidung/giohang.jsp">
                                    <div class="img">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                             enable-background="new 0 0 50 50" height="50px" id="Layer_1" version="1.1"
                                             viewBox="0 0 50 50" width="50px" xml:space="preserve"><path
                                                    d="M8,14L4,49h42l-4-35H8z" fill="none" stroke="#000000"
                                                    stroke-linecap="round" stroke-miterlimit="10"
                                                    stroke-width="2"></path>
                                            <rect fill="none" height="50" width="50"></rect>
                                            <path d="M34,19c0-1.241,0-6.759,0-8  c0-4.971-4.029-9-9-9s-9,4.029-9,9c0,1.241,0,6.759,0,8"
                                                  fill="none" stroke="#000000" stroke-linecap="round"
                                                  stroke-miterlimit="10" stroke-width="2"></path>
                                            <circle cx="34" cy="19" r="2"></circle>
                                            <circle cx="16" cy="19" r="2"></circle></svg>
                                    </div>
                                    <div class="info">
                                    <span class="cart_info">
                                    <%ArrayList<SanPhamModel>  gioHang = new giohang().getGioHang();%>
                                     
                                            
                                        <%  for(int i = 0;i<gioHang.size();i++){ %>  
                                        <span class="cartCount count_item_pr" id="cart-total">
                                        <%
                                        
                                        	out.print(gioHang.get(i).getSoLuongMua());
                                        %>
                                        </span>
                                        <%} %>
                                       
                                    </span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            <!--  END GIỎ HÀNG -->

            </div>
        </div>
    </div>

    
    <div class="header-menu hidden-md hidden-sm hidden-xs" id="navbar">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <nav>
                <ul id="nav" class="nav container"> <!-- 4 CỘT -->
                     <li class="nav-item "> <!--  CỘT 1 -->
 					      
                    <a class="nav-link">Danh mục<i class="fa fa-angle-down" data-toggle="dropdown"></i></a>
                    <ul class="dropdown-menu"> 
                    <% 
                    		
                               ResultSet dm2 = con.selectData("select * from danhmuc");
                    while(dm2.next())              	
        			{ if(dm2.getInt("parent_id")==0){
              						 %>
                   
                         <li class="dropdown-submenu nav-item-lv2">  <!-- MỤC ĐẦU TIÊN -->
                         
                         
                            <a class="nav-link"  href="http://localhost:8080/DoAnJava/Danhmuc?id=<%=dm2.getInt(1)%>" title="<%=dm2.getString(2) %>">
                            <strong><%=dm2.getString(2) %> </strong><i class="fa fa-caret-right"></i> 
                            </a> 
                            
                     
                            <ul class="dropdown-menu">  
                             
                            <% ResultSet dm3 = con.selectData("select * from danhmuc where parent_id=" + dm2.getInt("id"));
                            while(dm3.next()) {  
                            %>                                             
                            <li class="dropdown-submenu nav-item-lv3">                                                                      
                            <a class="nav-link" href="http://localhost:8080/DoAnJava/Danhmuc?id=<%=dm3.getInt(1)%>">               
                             <strong><%=dm3.getString(2)%></strong> 
                            </a>                         
                             </li> 
                             <%} %>                            
							</ul> 
							 
                        	
                        </li>
                         <%}} %>                
                    </ul>
                </li>
				<li class="nav-item "> <!--  CỘT 2 -->
                    <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" class="nav-link">Trang Chủ</a>
                 </li> 
                <li class="nav-item "> <!--  CỘT 2 -->
                    <a href="http://localhost:8080/DoAnJava/nguoidung/tintuc.jsp" class="nav-link">Tin Công Nghệ</a>
                 </li>

                 <li class="nav-item "> <!--  CỘT 3 -->
                    <a href="http://localhost:8080/DoAnJava/nguoidung/gioithieu.jsp" class="nav-link">Giới Thiệu</a>
                 </li>

                 <li class="nav-item "> <!--  CỘT 4-->
                    <a href="http://localhost:8080/DoAnJava/nguoidung/gioithieu.jsp" class="nav-link">Liên Hệ</a>
                 </li>
             </ul>
         </nav>
     </div>
     </div>
    </div>
    </div>

</header>
