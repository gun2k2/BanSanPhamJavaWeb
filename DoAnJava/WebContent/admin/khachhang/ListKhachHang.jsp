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
					String delkh = null;
					String addkh = null;
					String upkh = null;
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						addkh = (String) context.getAttribute("addkh");
						upkh = (String) context.getAttribute("upkh");
						delkh = (String) context.getAttribute("delkh");
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
		<title>Quản Lý Khách Hàng</title>
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
						<form action="" method="get">
                       		Name: <input type="text" name="q" value="" placeholder="Tim kiem..." /> <br> 
                    	</form>
                    	<br>
                              
                          	<%if(delkh!=null){%> 
                          		<div class="alert alert-success text-left">
                                   <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                   </button>
                                   Xoa Thanh Cong !!
                               </div> 
                           <%}%>
               			<%if(upkh!=null){ %>
               			<div class="alert alert-success text-left">
                                   <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                   </button>
                                   Cap nhap Thanh Cong !!
                               </div>
               			<%} %>
               			<%if(addkh!=null){ %>
               				<div class="alert alert-success text-left">
                                   <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i></button>
                                   Them Thanh Cong !!
                               </div>
               			<%} %>
                               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                   		<th>ID</th>   
                                      	<th>Name</th>   
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>UserName</th>
                                        <th>Password</th>                                     
                                		<th>ID KH</th> 
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                    	<th>ID</th>   
                                      	<th>Name</th>   
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>UserName</th>
                                        <th>Password</th>                                     
                                 		<th>ID KH</th> 
                                        <th>Action</th>
                                    </tr>
                                </tfoot>
                                <tbody>
	                             <% ConnectionToDB con = new ConnectionToDB();
	                           
									ResultSet rs = null;     
	                             	String query = request.getParameter("q");
	                                      	
		                          	String data;
		                          	if(query!=null)
		                          	{
		                          		data = "select * from KhachHang where name like N'%"
		                          	+query+"%' or email like '%"
		                          	+query+"%' or sdt like '%"
		                          	+query+"%' or username like '%"
		                          	+query+"%'";
		                          	}else{
		                          		data = "select * from KhachHang order by id";
		                          	}
	                          	
	                          	
		                          	rs	 = con.selectData(data);
		                          	ResultSet p= null; 
		                          	ResultSet d = null;
		                          	%>
		                    		<%while(rs.next()){%>
										<tr>
											<td><%=rs.getInt(1) %></td>
											<td><%=rs.getString(2) %></td>
											<td><%=rs.getString(3) %></td>
											<td><%=rs.getString(4) %></td>
											<td><%=rs.getString(5) %></td>
											<td><%=rs.getString(6) %></td>
			                               	<td><%=rs.getString(7) %></td>
											<td class="option">
												<a href="EditKhachHang.jsp?id=<%=rs.getInt(1)%>" ><i class="fas fa-wrench fix"></i></a>
				                              	<a href="http://localhost:8080/DoAnJava/KhachHangController?id=<%=rs.getInt(1)%>&chucNang=Xoa">
				                              		<i class="fas fa-user-times remove verify_action"></i>
				                              	</a>              
											</td>
										</tr>
		                        	<% }%>       
             				        
                                </tbody>
                            </table>
                	</div>
	            </div>
	        </div>
	    </div>
	</main>
<%@ include file="../footer/footer.jsp" %>
</div>

<%@ include file="../decorators/footer.jsp" %>
<%
                                
	ResultSet rs1 = con.selectData("select * from KhachHang");
	 
	while(rs1.next()){
%>
<script>
	$(document).ready(function() {
		$('.remove').click(function(event) {
			var id = $(this).attr("id");
			if(confirm("Bạn có muốn xóa mục này ?")){
				window.location = "http://localhost:8080/DoAnJava/KhachHangController?id=<%=rs1.getInt(1)%>";
			}else{
					return false;
			}
		});
	});
</script> 
<%} %>
</body>
</html>