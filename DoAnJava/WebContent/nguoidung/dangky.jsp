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
		<title>Đăng Ký</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>

	 <!--ĐĂNG KÝ  -->
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
         <section class="lib-section-5">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div style="margin: 20px;padding-left: 20px;padding-right: 20px;">
                        <div style="color: red; font-weight: bold; text-align: center;">    </div>
                       
                        <form  action="http://localhost:8080/DoAnJava/LoginAdminController"  method="post"  enctype="multidata/form-data">
                        	<input type="hidden" name = "action" value="Res">
                            <div class="clearfix large_form ">
                                <label for="name" class="icon-field"><i class="icon-login icon-envelope "></i>Tên của bạn</label>
                                <input type="text"  name="name" id="name" placeholder="Nhập tên của bạn" class="text form-control" required >
                            </div>
                            
                            <div class="clearfix large_form ">
                                <label for="email" class="icon-field"><i class="icon-login icon-envelope "></i>Email của bạn</label>
                                <input type="email"  name="email" id="email" placeholder="Nhập email của bạn" class="text form-control" required>
                              	<p>
	                            <%
	                              		
	                           		if(errorEmail!=null)
	                           			{out.print(errorEmail);}
	                             
	                             %> 
                             </p>
                            </div>
                            
                            <div class="clearfix large_form ">
                                <label for="phone" class="icon-field"><i class="icon-login icon-envelope "></i>Số điện thoại</label>
                                <input type="tel"  name="sdt" id="phone" placeholder="Nhập số điện thoại của bạn (10 số)" pattern="[0-9]{10}" class="text form-control" required>
                                <p>
	                            <%
		                            if(errorSdt!=null)
		                  			{out.print(errorSdt);}
	                             
	                             %> 
                             </p>
                            </div>
                            
                            <div class="clearfix large_form ">
                                <label for="username" class="icon-field"><i class="icon-login icon-envelope "></i>Tài khoản</label>
                              <p>
                                 <%
	                                if(errorUsername!=null)
	                      			{out.print(errorUsername);}
                             
                             	%>
                             </p>
                                <input type="text"  name="username" id="username" placeholder="Nhập tên đăng nhập" class="text form-control" required>
                              
                            </div>
                           
                            
                              <div class="clearfix large_form ">
                                <label for="password" class="icon-field"><i class="icon-login icon-shield"></i>Mật khẩu</label>
                                <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" class="text form-control" size="16" required>
                            </div>
                            <span class="wpcf7-list-item">
        <input type="checkbox" name="acceptance-886" required  aria-invalid="false" class="check-terms" />
        
        </span>Tôi đồng ý với các điều khoản sử dụng.</div>
                            

                            <div class="clearfix action_account_custommer">
                                <div class="action_bottom button dark">
                                   <input type="submit"  class="btn btn-info btn-signin" style="margin-left: 20px" value="Registration" >
                                </div>
                                <br>
                                <div class="req_pass">
                                    <a href="QuenMatKhau.jsp">Quên mật khẩu?</a>
                                </div>
                            </div>
                        </form>
                    </div>  

                </div>
            </div>
        </div>
    </section>
    <!-- END ĐĂNG KÝ  -->
    
   
    </div>   <!-- END PAGE BODY  -->
    
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
</script>
</body>
</html>