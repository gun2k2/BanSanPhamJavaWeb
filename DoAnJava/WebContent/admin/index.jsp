<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.ThanhVienModel"%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trang Chu</title>
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
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <% ConnectionToDB con = new ConnectionToDB();
								ResultSet rs = con.selectData("select * from  ThanhVien"); 
							
                                %>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      
                                        <thead>
                                            <tr>
                                                 <th>Name</th>   
                                                <th>Email</th>
                                                <th>SDT</th>
                                                <th>Giới tính</th>
                                               	<th>Province</th>
                                               	<th>District</th>
                                               	<th>Ward</th>
                                            </tr>
                                        </thead>
                                         <tfoot>
                                            <tr>
                                               <th>Name</th>   
                                                <th>Email</th>
                                                <th>SDT</th>
                                                <th>Giới tính</th>
                                               	<th>Province</th>
                                               	<th>District</th>
                                               	<th>Ward</th>
                                              
                                            </tr>
                                        </tfoot>
                                        <tbody>
                     			<% while(rs.next()){
                     				
                     				%>
                     			
                                            <tr>
                                                <td><%=rs.getString(2) %></td>
                                                <td><%=rs.getString(3) %></td>
                                                <td><%=rs.getString(7) %></td>
                                                <td><%if(rs.getInt(6)==1){ 
                                                out.print("Nam");
                                                }else{ 
                                                out.print("Nu");
                                                } %></td>
                                                 <%
                                             	ResultSet p;
	            										p = con.selectData("select province_name from province where id = "
	            															+rs.getInt("province"));
	                                                	while(p.next()){
	                                                	
	                                                %>
						                        <td style="width: 10%;"><%=p.getString("province_name") %></td>
							                        <%} %>
						                            <%ResultSet d;
	                                                	d = con.selectData("select district from district where id = " 
							                         						+ rs.getInt("district") 
							                         						+ " and province_id = " + rs.getInt("province") );
	                                                	while(d.next()){
	                                                			
	                                               	%>
						                        <td style="width: 10%;"><%=d.getString("district") %></td>
						                        <%} %>
                                                <td><%=rs.getString(10) %></td>  
                                            </tr>
                                        <%
                                        }
                     					%>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
          <%@ include file="./footer/footer.jsp" %>
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
