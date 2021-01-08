<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.model.ThanhVienModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Thong Ke</title>
       <link href="css/styles.css" rel="stylesheet" type="text/css">	
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link href="css/thongke.css" rel="stylesheet" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
     <%ThanhVienModel tv = (ThanhVienModel)session.getAttribute("userlogin"); %>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="http://localhost:8080/DoAnJava/admin/index.jsp"><img src="http://localhost:8080/DoAnJava/admin/images/ironman.png" height="40" style="max-width: 40px" ><%if(tv!=null)
            {	out.print("D18CQAT01");
            	
            
            }else{
            	response.sendRedirect("DangNhap.jsp");
            	}%></a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="http://localhost:8080/DoAnJava/admin/images/brand.png" height="40" style="max-width: 40px" ></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#"><img src="http://localhost:8080/DoAnJava/admin/images/setting.jpg" height="40" style="max-width: 40px" >Setting</a>
                        <div class="dropdown-divider"></div>
                         <a title="Đăng Xuất" class="dropdown-item" href="http://localhost:8080/DoAnJava/DangXuatAdmin">
                             <img src="http://localhost:8080/DoAnJava/admin/images/trove.jpg" height="40" style="max-width: 40px" >Đăng Xuất
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
          <div id="layoutSidenav">
                 <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/index.jsp">
                                <img src="http://localhost:8080/DoAnJava/admin/images/dash.jpg" height="40" style="max-width: 40px" >
                                Dashboard
                            </a>
                                 <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/thongke.jsp">
                                <img src="http://localhost:8080/DoAnJava/admin/images/thongke.jpg" height="40" style="max-width: 40px" >
                                Thống kê
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                               <img src="http://localhost:8080/DoAnJava/admin/images/sanpham.jpg" height="40" style="max-width: 40px" >
                                Sản phẩm
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/sanpham/ListSanPham.jsp">Sản phẩm</a>
                                    <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/danhmuc/ListDanhMuc.jsp">Nhóm sản phẩm</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                               <img src="http://localhost:8080/DoAnJava/admin/images/nguoidung.png" height="40" style="max-width: 40px" >
                                Người dùng
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Admin
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/admin/ListAdmin.jsp">Danh sách</a>
                                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/admin/AddAdmin.jsp">Thêm</a>
                                          
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Khách hàng
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/khachhang/ListKhachHang.jsp">Danh sách</a>
                                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/khachhang/AddKhachHang.jsp">Thêm</a>
                                            
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="http://localhost/it/Error_controller/E401">401 Page</a>
                                            <a class="nav-link" href="http://localhost/it/Error_controller/E404">404 Page</a>
                                            <a class="nav-link" href="http://localhost/it/Error_controller/E500">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                         
                            <a class="nav-link" href="http://localhost:8080/DoAnJava/admin/donhang.jsp">
                               <img src="http://localhost:8080/DoAnJava/admin/images/contact.png" height="40" style="max-width: 40px" >
                               
                                Đơn Hàng
                            </a>
                       
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <%if(tv!=null)
            {
            	out.print(tv.getName());
            
            } %>
                    </div>
                </nav>
            </div>
            <div style="color: red; font-weight: bold; text-align: center;">   </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="http://localhost:8080/DoAnJava/admin/index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Danh sách</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                Đây là danh sách quản lý quản trị viên, nếu có thắc mắc gì,vui lòng truy cập
                                <a target="_blank" href="https://www.facebook.com/phuongnenenha">Facebook của Admin</a>
                                .
                            </div>
                        </div>
		                 		<%
									String ngaybatdau=null;
		                 			String ngayketthuc=null;
		                 			
									String doituongTimKiem = request.getParameter("doituongTimKiem");
									if (request.getParameter("ngaybatdau")!=null){
										ngaybatdau =  request.getParameter("ngaybatdau");
		                                ngayketthuc = request.getParameter("ngayketthuc");
		                                
									}
									
								%>                            
                                <form action=""  method = "get">
                                	<input type = date name = "ngaybatdau" max="<%=LocalDate.now() %>" value = "<%=ngaybatdau %>" required>
                                	<input type = date name = "ngayketthuc" value = "<%=ngayketthuc%>" required>
                                	
                                	<select name = "doituongTimKiem">
                                		<option value = "donhang" >Đơn hàng</option>
                                		<option value = "maSanPham">Mã Sản Phẩm</option>
                                	</select>
                                	
                                	<input type = submit value = "Thống kê">
                                </form>
                                
								<% 
									ConnectionToDB con = new ConnectionToDB();
		                 			ResultSet rs = null;
		                 			int tongtien = 0;
	                                
								%>
								
								
                        <div class="card mb-4">
                            <div class="card-body">
								
								<%
									if (ngaybatdau != null && ngayketthuc != null && doituongTimKiem != null) {
								%>
								<form action="xuatExcel.jsp" target="_new' method="get">									
									<input type ="hidden" name = "ngaybatdau" value=<%=ngaybatdau%>>
									<input type ="hidden" name = "ngayketthuc" value=<%=ngayketthuc%>>
									<input type ="hidden" name = "doituongTimKiem" value=<%=doituongTimKiem%>>
									
									<input type="submit" value="Xuất Excel">
								</form>
								<table>
									<%	
									if (doituongTimKiem.equals("donhang")) {
										ResultSet donhang = con.selectData("select DISTINCT id from ct_donhang where ngaymua between '" + ngaybatdau 
            									+ "' and '" + ngayketthuc + "' and trangthai = 0");
									%>
										<thead>
											<tr> 
											 	<th>MaDH</th>
											    <th>Số điện thoại</th> 
											    <th>Ngày mua</th> 
											    <th>Thành tiền</th> 
											</tr>
										</thead>
									<%
										while(donhang.next()){
											rs = con.selectData("select ThanhTien from ct_donhang where id = "+donhang.getInt("id"));
											int thanhtien = 0;
											while (rs.next()) {
												tongtien += rs.getInt("thanhtien");
												thanhtien +=rs.getInt("thanhtien");
											}
											rs = con.selectData("select top (1) * from ct_donhang where id = "+donhang.getInt("id"));
									
	                                		if (rs != null) 
	                                		while (rs.next() ){
	                                			
		 							%>
	 										
		 										<tbody>
													<tr> 
														<th><%=rs.getString("id")%></th> 
														<th><%=rs.getString("sdt")%></th>   
														<th><%=rs.getString("ngaymua")%></th>
														<th><fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=thanhtien%>" /></th>
													 </tr>
												</tbody>
											
	 									<%
	 										}
	                                	}
	                                	
										}else{
											String sql = "select sanpham.maSanPham, SoLuong=sum(soluong), ThanhTien=sum(thanhtien) "
													+ "from sanpham left join (select * from CT_DonHang where ngaymua between '" 
													+ ngaybatdau + "' and '"+ ngayketthuc+"') ct_dh" 
													+ " on sanpham.maSanPham = ct_dh.maSanPham"
													+ " group by sanpham.maSanPham"
													+ " order by ThanhTien desc";
											rs = con.selectData(sql);
										%>
										<thead>
											<tr> 
											 	<th>Mã Sản Phẩm</th>
											    <th>Tên Sản Phẩm</th> 
											    <th>Đã bán (cái)</th> 
											    <th>Doanh thu</th> 
											</tr>
										</thead>
	                                	<%
	                                		if (rs != null) 
	                                		while (rs.next() ){
	                                			tongtien += rs.getInt("thanhtien");
	                                			String soluong =  rs.getString("soluong");
	                                			if (soluong == null) soluong = "0";
	                                			
	                                			String thanhtien = rs.getString("thanhtien");
	                                			if (thanhtien == null) thanhtien = "0";
	                                			
	                                			ResultSet ds_tensp = con.selectData("select name from sanpham where masanpham = " 
	                                								+ rs.getString("maSanPham"));
	                                			ds_tensp.next();
		 								%>
	 										
		 										<tbody>
													<tr> 
														<th><%=rs.getString("maSanPham")%></th> 
														<th><%=ds_tensp.getString("name") %></th>
														<th><%=soluong%></th>   
														<th>
															<fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=thanhtien%>" />
														</th>
													 </tr>
												</tbody>
											
	 										<%}%>
		 								<%}%>
		 							<%}%>
	 									<tfoot>
											<tr>
												<td>Tổng tiền: <fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=tongtien%>" /></td>
											</tr>
										</tfoot>	                               		
		                                
								</table>

                            </div>
                        </div>



                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    	<script src="assets/demo/datatables-demo.js"></script>

    </body>
</html>
    