<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
   <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Sua");
    	ServletContext contextID = getServletContext(); // ngoài gửi về chức năng cần gửi kèm cái id
    	contextID.setAttribute("id", request.getParameter("id"));
    %>
    
   			 
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Thông tin tài khoản</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>

  <div class="product-overview-tab">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-hg-12">
                <div class="fw">
                    <link href="//theme.hstatic.net/1000340279/1000431896/14/product_tabs.scss.css?v=7" rel="stylesheet" type="text/css" media="all">
                    <div class="product_tabs panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading-1">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
                                        <i class="fa fa-info-circle" aria-hidden="true"></i> <span><strong>Thông tin tài khoản</strong></span>
                                    </a>
                                </h4>
                            </div>
                            
                   <!--  NỘI DUNG TK -->
                            <div id="collapse-1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-1" aria-expanded="true">
                            <div class="panel-body rte">
                            
						<% 
                          ConnectionToDB ketnoi = new ConnectionToDB();
                               ResultSet khachhang = ketnoi.selectData("select * from KhachHang " );
    					while(khachhang.next()){ 
    						if(kh==null )
    						{%> 
    							
    						
    						<%}if(kh!=null){ %>
    						<% if(khachhang.getString("email").equals(kh.getEmail()) ){
    							String id = request.getParameter("id");
						  		ResultSet rs = new ConnectionToDB().selectData("select * from KhachHang where id='"+id+"'"); 
						  		while(rs.next()){%>
						  		 <form action="http://localhost:8080/DoAnJava/editKH" method="post"  enctype="multidata/form-data">


                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-5">
                      <input type="text"  name="name" value="<%out.print(rs.getString(2)); %>" class="form-control" id="tenNhanVien" required  placeholder="Name..." required>
                    </div>
                  </div> 

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                      <input type="text"  required name="email" value="<%out.print(rs.getString(3)); %>" class="form-control" id="userName"   placeholder="Email...">          
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="param_sdt" class="col-sm-2 col-form-label">Number Phone</label>
                    <div class="col-sm-5">
                      <input type="text"  name="sdt" value="<%out.print(rs.getString(4)); %>" class="form-control" id="param_sdt"  placeholder="Phone..." required> 
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Tài khoản đăng nhập</label>
                    <div class="col-sm-5">
                      <input type="text"  name="username" value="<%out.print(rs.getString(5)); %>"  class="form-control" id="param_username"  placeholder="Tài khoản đăng nhập..." required>
                    </div>
                  </div>
                  

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-5">
                      <input type="password" required value="<%out.print(rs.getString(6)); %>" name="password" class="pass-key" id="password" placeholder="Password">
        			 <span class="show"> <i class="fa fa-eye" aria-hidden="true"></i></span>
		          
         
                    </div>
                  </div>
   			
          
                <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-success btn-sm">Chinh Sua</button>
                      <a href=""><i class="fa fa-eye"></i>Làm mới</a>
                      
                    </div>
                </div>
                </form>
                <!-- end form -->  
    						
    						
    						<%}} %>
    						<%}if(khfb==null){ %>
    						
    						<%}if(khfb!=null){ %>
    							<% if(khachhang.getString("email").equals(khfb.getEmail()) ){
    							String id = request.getParameter("id");
						  		ResultSet rs = new ConnectionToDB().selectData("select * from KhachHang where id='"+id+"'"); 
						  		while(rs.next()){%>
						  		 <form action="http://localhost:8080/DoAnJava/editKH" method="post"  enctype="multidata/form-data">


                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-5">
                      <input type="text"  name="name" value="<%out.print(rs.getString(2)); %>" class="form-control" id="tenNhanVien" required  placeholder="Name..." required>
                    </div>
                  </div> 

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                      <input type="text"  required name="email" value="<%out.print(rs.getString(3)); %>" class="form-control" id="userName"   placeholder="Email...">          
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="param_sdt" class="col-sm-2 col-form-label">Number Phone</label>
                    <div class="col-sm-5">
                      <input type="text"  name="sdt"  value="<%out.print(rs.getString(4)); %>" class="form-control" id="param_sdt"  placeholder="Phone..." required> 
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Tài khoản đăng nhập</label>
                    <div class="col-sm-5">
                      <input type="text"  name="username"  value="<%out.print(rs.getString(5)); %>"  class="form-control"   placeholder="Tài khoản đăng nhập..." required>
                    
                    </div>
                  </div>
                  

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-5">
                      <input type="password" required value="<%out.print(rs.getString(6)); %>" name="password" class="pass-key" id="password" placeholder="Password">
        			 <span class="show"> <i class="fa fa-eye" aria-hidden="true"></i></span>
		          
         
                    </div>
                  </div>
   			
          
                <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-success btn-sm">Cập nhập </button>
                      <a href=""><i class="fa fa-eye"></i>Làm mới</a>
                      
                    </div>
                </div>
                </form>
                <!-- end form -->  
    						
    						
    						<%}} %>
    						<%} %>
    						 <%}%>
    					
                                </div>
                            </div>
                    <!-- END NỘI DUNG TK -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
<%@ include file="footer/footer.jsp" %>
	<%@ include file="decorators/footer.jsp" %>
<script>
  window.onscroll = function() {myFunction()};

  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop;

  function myFunction() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
  const pass = document.querySelector('.pass-key');
  const showpass = document.querySelector('.show');
  showpass.addEventListener('click', function(){
    if(pass.type === "password"){
      pass.type = "text";
      showpass.textContent = "HIDE";
      showpass.style.color = "#3498db";
    }else{
      pass.type = "password";
     showpass.textContent = "SHOW";
      showpass.style.color = "#222";
    }
  });
 
</script>
</body>
</html>