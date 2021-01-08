<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%KhachHangModel  kh1 = (KhachHangModel)session.getAttribute("userloginadmin");
	 KhachHangModel  khfb1 = (KhachHangModel)session.getAttribute("userfb"); 
	 KhachHangModel  khgg1 = (KhachHangModel)session.getAttribute("usergg");
	 String  codemail = (String)session.getAttribute("authcode");
	 String codemail1 = request.getParameter("code");
	 if(kh1!=null )
		 
		{
			response.sendRedirect("index.jsp"); 
		}
		if(khgg1 != null) 
		{
			 response.sendRedirect("index.jsp"); 
		}
		if(khfb1 != null) 
		{
			 response.sendRedirect("index.jsp"); 
		}
		if(codemail==null){
			response.sendRedirect("dangnhap.jsp"); 
		}
		else{
			if(!(codemail.equals(codemail1))){
				System.out.println("codemail= "+ codemail);
				System.out.println("codemail1= "+ codemail1);
				 response.sendRedirect("dangnhap.jsp"); 
			}
			
		}
		
		
	
  	
%>

    <% 
    ServletContext contextError = getServletContext();
    contextError.setAttribute("email", request.getParameter("email"));
    
    %>
   
				<%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String repassword = null;
				
					
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						repassword = (String) context.getAttribute("repassword");						
						getServletContext().setAttribute("f5", "true");	
					}
					%>
<html>
<head>
 <link rel="icon" href="http://localhost:8080/DoAnJava/nguoidung/brand.png"  type="image/x-icon"/>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Đổi mật khẩu</title>
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
    
    
    	 <!--QUEN XAC THUC  -->		
		<section class="lib-section-5">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div style="margin: 20px;padding-left: 20px;padding-right: 20px;">
                   <%if(repassword!=null)
                			{%> <div class="text-danger">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                    Mật khẩu không trùng khớp.
                                </div> <% }	 %>
                	 <% String email = request.getParameter("email");
                	 ResultSet pass = con.selectData("select * from KhachHang where email='"+email+"'");
                		
                	 	while(pass.next()){
                		 
                		 if(pass.getString("email").equals(null)){ %>	
                		
                		 <% }else{
                		 %>
								
                        <form action="http://localhost:8080/DoAnJava/SendMailController?email=<%pass.getString("email");%>&action=xacthuc" accept-charset="UTF-8"  id="customer_login" method="post" enctype="multidata/form-data" >
                            <div class="clearfix large_form ">
                                <label for="username" class="icon-field"><i class="icon-login icon-envelope "></i>Thay đổi mật khẩu</label>
     <input size="5" type="number"  required name="password"  placeholder="Nhập mật khẩu mới" class="text form-control">
	<input size="5" type="number"  required name="repassword"  placeholder="Nhập lại mật khẩu mới" class="text form-control">
                            </div>
                        
                            <div class="clearfix action_account_custommer">                         
			         <div class="action_bottom button dark">                   
                                     <div style="color: red; font-weight: bold; text-align: center;">  </div> 
                                     
                                    <input class="btn btn-info btn-signin" type="submit"  value="Xác nhận" >
                                    &ensp;&ensp;&ensp;  hoặc 
                                    <a href="http://localhost:8080/DoAnJava/nguoidung/dangky.jsp" style="margin-left: 20px" title="Đăng ký tài khoản">Đăng ký tài khoản</a>
                                </div>                           
                               <br> 
                               <div class="req_pass">
                                    <a href="dangnhap.jsp">Quay lại đăng nhập</a>
                                </div>      
                            </div>
                        </form>
                        <%}}%>
                   
                    </div>

                </div>
            </div>
        </div>
    </section>
    
    <!-- END  XAC THUC  -->
    
          
        
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