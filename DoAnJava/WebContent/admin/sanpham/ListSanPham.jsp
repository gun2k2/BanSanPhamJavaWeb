<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Quản Lý Sản Phẩm</title>
	<%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String delsp = null;
					String addsp = null;
					String upsp = null;
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						addsp = (String) context.getAttribute("addsp");
						upsp = (String) context.getAttribute("upsp");
						delsp = (String) context.getAttribute("delsp");
						getServletContext().setAttribute("f5", "true");	
					}
					%>
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
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <% ConnectionToDB con = new ConnectionToDB();
                                
                               ResultSet rs = con.selectData("select * from sanpham");
                                
                                
                                %>
                                <a class="btn btn-primary" href="AddSanPham.jsp" >Thêm Sản Phẩm</a>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                					<%if(delsp!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Xoa Thanh Cong !!
                                </div> <% }	 %>
                			<%if(upsp!=null){ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Cap nhap Thanh Cong !!
                                </div>
                			<%} %>
                			<%if(addsp!=null)
                			{ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Them Thanh Cong !!
                                </div>
                			<%} %>
                        <thead>
                            <tr>
                               
                                <td style="width:60px;">Mã số</td>
			                    <td>Tên</td>
			                    <td>MaSP</td>
			                    <td>Giá</td>
			                    <td style="width:75px;">HangSX</td>
			                    <td style="width:120px;">Hành động</td>
			                                
                            </tr>
                        </thead>
			            
			                         <tbody>
			                          <%while(rs.next())
			            	
			            					{%>
			                             <tr>
			                                <td class="textC"><%=rs.getInt(1) %></td>
			           						<td>
							                     <div class="image_thumb"> 
							                        <img height="50" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>">
							                        <div class="clear"></div>
							                    </div>
							                    
							                    <a target="_blank" title="" class="tipS" href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getInt(1)%>">
							                        <b><%=rs.getString(2)%></b>
							                    </a>
							                    
							                    <div class="f11">
							                      Đã bán: <%=rs.getInt(8)%> | Xem: <%=rs.getInt(7)%>                 
							                     </div>
				             				</td>
				             				<td class="textR">TEAMATTT_<%=rs.getInt(1)%></td>
			           						<td class="textR">
				           						<fmt:formatNumber type = "number" groupingUsed = "true" 
				           							value = "<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100%>" />
			           							
			           						</td>
			           						
			           						<td class="textR"><%=rs.getString(9)%></td>
			                             	<td class="option">
				                                <a title="Chỉnh sửa sản phẩm" class="tipS"  href="EditSanPham.jsp?maSanPham=<%=rs.getInt(1)%>">
				                                     <img src="http://localhost:8080/DoAnJava/admin/images/chinhsua.jpg" height="50" style="max-width: 50px">
				                                </a>
				                                 <a title="Xóa sản phẩm" class="tipS"   href="http://localhost:8080/DoAnJava/SanPhamController?maSanPham=<%=rs.getInt(1)%>">
				                                     <img src="http://localhost:8080/DoAnJava/admin/images/xoa.png" height="40" style="max-width: 40px"  class=" remove verify_action">
				                                </a>
			                                </td>
			                        
			                            </tr>
			                          <% } %>
			                            </tbody>
                            

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
 <%
                                
                               ResultSet rs1 = con.selectData("select * from sanpham");
                                
                                rs1.next();
                                %>
<script>
		$(document).ready(function() {
			$('.remove').click(function(event) {
				var id = $(this).attr("id");
				if(confirm("Bạn có muốn xóa mục này ?")){
					window.location = "http://localhost:8080/DoAnJava/SanPhamController?maSanPham=<%=rs1.getInt(1)%>";
				}else{
						return false;
				}
			});
		});
	</script> 
</body>
</html>