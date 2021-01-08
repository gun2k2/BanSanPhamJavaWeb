<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	ServletContext contextChucNang = getServletContext();
	contextChucNang.setAttribute("chucNang", "");
%>
<%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String deldm = null;
					String adddm = null;
					String updm = null;
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						adddm = (String) context.getAttribute("adddm");
						updm = (String) context.getAttribute("updm");
						deldm = (String) context.getAttribute("deldm");
						getServletContext().setAttribute("f5", "true");	
					}
					%>
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Quản Lý Danh Mục</title>
<%@include file="../decorators/header.jsp" %>
</head>
<body>
<%@include file="../header/header.jsp" %>
	
		
		
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
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <% ConnectionToDB con = new ConnectionToDB();
                                
                               ResultSet rs = con.selectData("select * from danhmuc");
                                
                                
                                %>
                                <a class="btn btn-primary" href="AddDanhMuc.jsp" >Thêm Danh Mục</a>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               				<%if(deldm!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Xoa Thanh Cong !!
                                </div> <% }	 %>
                			<%if(updm!=null){ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Cap nhap Thanh Cong !!
                                </div>
                			<%} %>
                			<%if(adddm!=null){ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Them Thanh Cong !!
                                </div>
                			<%} %>
                        <thead>
                            <tr>
                               
                                <td style="width:80px;">Mã số</td>
                               
                                <td>Tên danh mục</td>
                                <td style="width:100px;">Hành động</td>
                            </tr>
                        </thead>
			            <%while(rs.next())
			            	
			            	{%>
                         <tbody>
                          
                             <tr>
                                <td class="textC"><%=rs.getInt(1) %></td>
             
                                
                                <td>
                                <span title="" class="tipS">
                                   <%=rs.getString(2) %>         
                                </span>
                                </td>
                                 <td class="option">

                              
	                                <a title="Chỉnh sửa sản phẩm" class="tipS"  href="EditDanhMuc.jsp?id=<%=rs.getInt(1)%>">
	                                     <img src="http://localhost:8080/DoAnJava/admin/images/chinhsua.jpg" height="50" style="max-width: 50px">
	                                </a>
	
	                                 <% 
		                                	ResultSet checktontaiSP = con.selectData("select top (1) * from sanpham where danhmuc = " + rs.getInt("id"));
		                                	
		                                	if (!checktontaiSP.next()){
	                                %>
	                                 <a title="Xóa sản phẩm" class="tipS remove"   href="http://localhost:8080/DoAnJava/DanhMucController?id=<%=rs.getInt(1)%>">
	                                     <img src="http://localhost:8080/DoAnJava/admin/images/xoa.png" height="40" style="max-width: 40px"  >
	                                 </a>
	                                 <%} %>
                                    
                                

                                </td>
                        
                            </tr>
                          
                            </tbody>
                            <% } %>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
<%@ include file="../decorators/footer.jsp" %>
<script type="text/javascript">
function myFunction() {
	alert("Xóa sản phẩm thành công .!!!");
}</script>
</body>
</html>