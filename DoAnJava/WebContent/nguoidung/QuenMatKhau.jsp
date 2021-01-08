
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
 <%KhachHangModel  kh1 = (KhachHangModel)session.getAttribute("userloginadmin");
	 KhachHangModel  khfb1 = (KhachHangModel)session.getAttribute("userfb");
	 KhachHangModel  khgg1 = (KhachHangModel)session.getAttribute("usergg");
  
%>

<html>
<head>
 <link rel="icon" href="http://localhost:8080/DoAnJava/nguoidung/brand.png"  type="image/x-icon"/>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Quên Mật Khẩu</title>
		<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="691715780779-0hg6vracpjl1mihtfo4evcd1vt9bh6pj.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>

				<%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String errorpass = null;
					String successpass = null;
					
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						errorpass = (String) context.getAttribute("errorpass");
						successpass = (String) context.getAttribute("successpass");					
						getServletContext().setAttribute("f5", "true");	
					}
					%>
	 <!--QUEN MK  -->		
		<section class="lib-section-5">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div style="margin: 20px;padding-left: 20px;padding-right: 20px;">
                   
                	 	<%if(successpass!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Vui lòng kiểm tra email để thay đổi mật khẩu !!
                                </div> <% }	 %>
                                <%if(errorpass!=null)
                			{%> <div class="text-danger">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Tài khoản Email không tồn tại.
                                </div> <% }	 %>
                                
                        <form action="http://localhost:8080/DoAnJava/SendMailController?action=guimail" accept-charset="UTF-8"  id="customer_login" method="post" enctype="multidata/form-data" >
                            <div class="clearfix large_form ">
                                <label for="username" class="icon-field"><i class="icon-login icon-envelope "></i>Email</label>
                             <input size="5" type="email"  required name="email" id="username" placeholder="Nhập email của bạn" class="text form-control">
                            </div>
                        
                            <div class="clearfix action_account_custommer">                         
			         <div class="action_bottom button dark">                   
                                     <div style="color: red; font-weight: bold; text-align: center;">  </div> 
                                     
                                    <input class="btn btn-info btn-signin" type="submit"  value="Gửi mail" >
                                    &ensp;&ensp;&ensp;  hoặc 
                                    <a href="http://localhost:8080/DoAnJava/nguoidung/dangky.jsp" style="margin-left: 20px" title="Đăng ký tài khoản">Đăng ký tài khoản</a>
                                </div>                           
                               <br> 
                               <div class="req_pass">
                                    <a href="dangnhap.jsp">Quay lại đăng nhập</a>
                                </div>      
                            </div>
                        </form>
                    
                    </div>

                </div>
            </div>
        </div>
    </section>
    
    <!-- END QUEN MK  -->
    
				
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
  

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
</script>
</body>
</html>