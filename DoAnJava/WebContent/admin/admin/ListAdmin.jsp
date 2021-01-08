<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.jdi.connect.Connector"%>
<%@page import="java.sql.Statement"%>
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
					String delad = null;
					String addad = null;
					String upad = null;
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						addad = (String) context.getAttribute("addad");
						upad = (String) context.getAttribute("upad");
						delad = (String) context.getAttribute("delad");
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
		<title>Quản Lý Admin</title>
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
                                  
                               <%if(delad!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Xoa Thanh Cong !!
                                </div> <% }	 %>
                			<%if(upad!=null){ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Cap nhap Thanh Cong !!
                                </div>
                			<%} %>
                			<%if(addad!=null)
                			{ %>
                			<div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Them Thanh Cong !!
                                </div>
                			<%} %>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            <th>ID</th>
                                               	<th>Name</th>   
                                                <th>Email</th>
                                                <th>Password</th>
                                                <th>Date</th>
                                                <th>Gender</th>
                                                <th>Phone</th>
                                                <th>Province</th>
                                                <th>District</th>
                                                <th>Village</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                        
                                            <tr>
                                            	<th>ID</th>
                                                <th>Name</th>   
                                                <th>Email</th>
                                                <th>Password</th>
                                                <th>Date</th>
                                                <th>Gender</th>
                                                <th>Phone</th>
                                                <th>Province</th>
                                                <th>District</th>
                                                <th>Village</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        
                                         <% 
                                         
                                   ConnectionToDB con = new ConnectionToDB();
   									ResultSet rs = null;     
                                   String query = request.getParameter("q");
                                            	
                                	String data;
                                	if(query!=null)
                                	{
                                		data = "select * from ThanhVien where name like N'%"
			                                	+query+"%' or email like '%"
			                                	+query+"%' or sdt like '%"
			                                	+query+"%'";
                                	}else{
                                		data = "select * from ThanhVien order by id asc";
                                	}
                                	
                                	
                                	rs	 = con.selectData(data);
                                	ResultSet p= null; 
                                	ResultSet d = null;
                                %>
                         	<%
                         	while(rs.next()){ 
                     				
                     				%>
                                           <tr>
                                           		<td><%=rs.getInt(1) %></td>
                                              	<td><%=rs.getString(2) %></td>
                                                <td><%=rs.getString(3) %></td>
                                                <td><%=rs.getString(4) %></td>
                                                <td><%=rs.getString(5) %></td>
                                                <td> 
                                                <%if(rs.getInt(6)==1){ 
                                                out.print("Nam");
                                                }else{ 
                                                out.print("Nu");
                                                } %>
                                                </td>
                                                <td><%=rs.getString(7) %></td>
                                                 <%
	                                             
	            										p = con.selectData("select province_name from province where id = "
	            															+rs.getInt("province"));
	                                                	p.next();
	                                                	String tenprovince = p.getString("province_name");
	                                                %>
                                                <td style="width: 10%;"><%=tenprovince%></td>
                                                
                                               <%
	                                                	d = con.selectData("select district from district where id = " 
							                         						+ rs.getInt("district") 
							                         						+ " and province_id = " + rs.getInt("province") );
	                                                	while(d.next()){
	                                                			
	                                               	%>
						                        <td style="width: 10%;"><%=d.getString("district") %></td>
						                        <%} %>
                                                <td><%=rs.getString(10) %></td>  
                                                <td class="option">
                                
                                <a href="EditAdmin.jsp?id=<%=rs.getInt(1)%>" ><i class="fas fa-wrench fix"></i></a>
								<%if(!(rs.getString("email").equals("phuongjav150@gmail.com"))){ %>
                                
                                <a href="http://localhost:8080/DoAnJava/ThanhVienController?id=<%=rs.getInt(1)%>"><i class="fas fa-user-times remove verify_action"></i></a>
                          	<%} %>
                            </td>
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

<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
<%@ include file="../decorators/footer.jsp" %>
<%
                                
                               ResultSet rs1 = con.selectData("select * from ThanhVien");
                                
                                while(rs1.next()){
                                %>
 <script>
 $(document).ready(function() {
     $('.remove').click(function(event) {
         var id = $(this).attr("id");
         if(confirm("Bạn có muốn xóa mục này ?")){
             window.location = "http://localhost:8080/DoAnJava/ThanhVienController?id=<%=rs1.getInt(1)%>";
         }else{
                 return false;
         }
     });
 });
    </script>
    <%} %>
</body>
</html>