<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Them");
    %>
    
    <%
			ServletContext context = getServletContext(); 
			String error = (String) getServletContext().getAttribute("error");
			String f5 = (String) getServletContext().getAttribute("f5");
			String errorUsername = "";
			String errorEmail = "";
			String errorSdt = "";
			
			if (error == null) error = "false";	
			if (f5 == null) f5 = "false";
			if (error.equals("true") & f5.equals("false")) {
				errorUsername = (String) context.getAttribute("errorUsername");
				errorEmail = (String) context.getAttribute("errorEmail");
				errorSdt = (String) context.getAttribute("errorSdt");
				
				getServletContext().setAttribute("f5", "true");	
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
		<title>Thêm mới Khách Hàng</title>
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
                            <li class="breadcrumb-item active">Thêm mới</li>
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
                                Thêm mới dữ liệu 
                            </div>
                     <form  method="post" action="http://localhost:8080/DoAnJava/KhachHangController"  enctype="multidata/form-data">

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-5">
                      <input type="text"  name="name"  class="form-control" id="tenNhanVien"  placeholder="Name..." required>
                    </div>
                  </div> 

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                      <input type="email"  name="email"  required class="form-control" id="userName"  placeholder="Email...">
                    <%
                              		
                           		if(errorEmail!=null)
                           			{out.print(errorEmail);}
                             
                             %> 
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="param_sdt" class="col-sm-2 col-form-label">Number Phone</label>
                    <div class="col-sm-5">
                      <input type="tel"  name="sdt"  class="form-control" id="param_sdt" pattern="[0-9]{10}" placeholder="Phone..." required>
                    <%
	                            if(errorSdt!=null)
	                  			{out.print(errorSdt);}
                             
                             %> 
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">UserName</label>
                    <div class="col-sm-5">
                      <input type="text"  name="username"  class="form-control" id="param_username"  placeholder="Tài khoản đăng nhập..." required>
                   <%
	                                if(errorUsername!=null)
	                      			{out.print(errorUsername);}
                             
                             	%>
                    </div>
                  </div>
                  
                  

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-5">
                      <input type="password"  name="password" class="form-control" id="PassWord" placeholder="Password">
                    
                    </div>
                  </div>

			
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary">Thêm mới</button>

                      <a title="Trở về" class="tipS"  href="ListKhachHang.jsp">
    <img src="http://localhost:8080/DoAnJava/admin/images/trove.jpg" height="50" style="max-width: 50px">
   </a>
                    </div>
                  </div>
                </form>
                <!-- end form -->
                        </div>
                    </div>
                </main>

	<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
	<%@ include file="../decorators/footer.jsp" %>
	  
</body>
</html>