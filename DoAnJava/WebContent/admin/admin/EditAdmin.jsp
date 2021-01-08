
<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Sua");
    	ServletContext contextID = getServletContext(); // ngoài gửi về chức năng cần gửi kèm cái id
    	contextID.setAttribute("id", request.getParameter("id"));
    %>
   				 <%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String edit = null;
					String errorEmail = null;
					
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						edit = (String) context.getAttribute("edit");
						getServletContext().setAttribute("f5", "true");	
						errorEmail = (String ) context.getAttribute("errorEmail");
					}
					%>
    
<!DOCTYPE html>

<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Chỉnh sửa Admin</title>

 <%@include file="../decorators/header.jsp" %> 
</head>
<body>
	<%@include file="../header/header.jsp" %>
	 
	      <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="http://localhost:8080/DoAnJava/admin/index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Chỉnh sửa</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                Đây là danh sách quản lý quản trị viên, nếu có thắc mắc gì,vui lòng truy cập
                                <a target="_blank" href="https://www.facebook.com/phuongnenenha">Facebook của Admin</a>
                                .
                            </div>
                        </div>
                        <div style="color: red; font-weight: bold; text-align: center;">   </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Chỉnh sửa dữ liệu 
                            </div>
                            <%if(edit!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Mat khau Cu Khong Dung !!
                                </div> <% }	 %>
               <% String id = request.getParameter("id");
  		ResultSet rs = new ConnectionToDB().selectData("select * from ThanhVien where id='"+id+"'"); // lấy dữ liệu từ database lên
  		while(rs.next()){
  		%>
                    <form action="http://localhost:8080/DoAnJava/ThanhVienController?chucNang=Sua" method="post"  enctype="multidata/form-data">

                   


                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-5">
         <input type="text" required name="name" value="<%out.print(rs.getString(2)); %>" class="form-control" id="tenNhanVien"  placeholder="Name..." >
                    </div>
                  </div> 

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                      <input type="email" required  name="email" value="<%out.print(rs.getString(3)); %>" class="form-control" id="userName"   placeholder="Email...">          
            			<% if (errorEmail != null) out.print(errorEmail); %>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-5">
                      <input required  type="password"  value="" name="password" class="form-control" id="PassWord" placeholder="Password">
                    
                    </div>
                  </div>

      		
                  
				<div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">New Password</label>
                    <div class="col-sm-5">
                      <input required  type="password"  value="" name="newpassword" class="form-control" id="PassWord" placeholder="Password">
                    
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="param_ngaysinh" class="col-sm-2 col-form-label">Birthday</label>
                    <div class="col-sm-5">
                      <input type="date"  name="ngaysinh" value="<%out.print(rs.getString(5)); %>" class="form-control" id="param_ngaysinh"  placeholder="Birthday..." required> 
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="param_gioitinh"  class="col-sm-2 col-form-label" >Giới tính</label>
                          <div class="col-sm-5">
                        <input required type="radio" id="Nam" name="gioitinh" value="1" required>
                        <label for="Nam">Nam</label>

                        <input  required type="radio" id="female" name="gioitinh" value="0" required>
                        <label for="Nữ">Nữ</label>
                    </div>
                  </div>


                    
                  <div class="form-group row">
                    <label for="param_sdt" class="col-sm-2 col-form-label">Number Phone</label>
                    <div class="col-sm-5">
                      <input type="tel"  name="sdt" value="<%out.print(rs.getString(7)); %>" class="form-control" id="param_sdt"  pattern="[0-9]{10}" placeholder="Phone..." required> 
                    
                    </div>
                  </div>
  
                  <div class="form-group row">
                        <label  for="" >Tỉnh/ThànhPhố</label>
                       <select  id="province_id" name="province_id">
                            <option  value="0">--Chọn Tỉnh--</option>
                             <%
                           
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs1 = st.executeQuery("select * from province");
                                while (rs1.next()) {
                            %>
                             <option value="<%=rs1.getInt(1)%>"><%=rs1.getString("province_name")%></option>
                            <%
                                }
                            %>
                            </select>
                        
                        <label   id="district_id" for="">Quận/Huyện</label>
                        <select  hidden="" name="district"  >
                        
                            <option value="">--Chọn Quận/Huyện--</option>
                           
                        </select>
                       
                        <label  id="ward_name" for="">Xã/Phường</label>
                        <select hidden="" name="ward"  >
                            <option value="">--Xã/Phường--</option>  
                        </select>
                    </div>
                    
                <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-success btn-sm">Chỉnh sửa</button>
                      <a href=""><i class="fa fa-eye"></i>Làm mới</a>
                    </div>
                </div>
                </form>
                <!-- end form -->
                  <%} %>
                                <!-- end form -->
                        </div>
                    </div>
                </main>
	 	
	 	
	 	
   	<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
	<%@ include file="../decorators/footer.jsp" %>
	<script type="text/javascript">
    $(document).ready(function() {
        $("#province_id").on("change", function() {
            var province_id = $("#province_id").val();
            	$.ajax({
            		url: "http://localhost:8080/DoAnJava/admin/admin/district.jsp",
            		data: {province_id:province_id},
            		method: "POST",
            		success: function (data)
            		{
            			$("#district_id").html(data);
            		} 
            	});
        });
    });
</script>
 <script type="text/javascript">
    $(document).ready(function() {
        $("#submit").on("click", function() {
            var province_id = $("#province_id").val();
            var district_id = $("#district").val();
            var ward_name = $("#ward").val();
            if(province_id == "" || province_id == null)
            	{
            	$("#error").html("All fields are madatory. ");
            	} 
            else{
            	
            	$.ajax({
            		url: "",
            		method : "POST",
            		data: {province_id: province_id , district_id: district_id,ward_name: ward_name},
            		success: function (data)
            		{
            			
            			$("#form").trigger("reset");
            		}
            	}); 
            }
            	
        });
    });
</script>
</body>
</html>