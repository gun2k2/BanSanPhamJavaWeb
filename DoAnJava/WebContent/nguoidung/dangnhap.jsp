

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
 <%KhachHangModel  kh1 = (KhachHangModel)session.getAttribute("userloginadmin");
	 KhachHangModel  khfb1 = (KhachHangModel)session.getAttribute("userfb");
	 KhachHangModel  khgg1 = (KhachHangModel)session.getAttribute("usergg");
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
  	
%>

  		
  		
 
<html>
<head>
 <link rel="icon" href="http://localhost:8080/DoAnJava/nguoidung/brand.png"  type="image/x-icon"/>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Đăng Nhập</title>
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


	 <!--ĐĂNG NHẬP  -->
		<%
		ServletContext context = getServletContext(); 
		String error = (String) getServletContext().getAttribute("error");
		String f5 = (String) getServletContext().getAttribute("f5");
		String erroruser = "";
		String errortontai = "";
		String info = null;
		String dky = null;
		String password = null;
		if (error == null) error = "false";	
		if (f5 == null) f5 = "false";
		if (error.equals("true") & f5.equals("false")) {
			info = (String) context.getAttribute("info");
			dky = (String) context.getAttribute("dky");
			erroruser = (String) context.getAttribute("erroruser");
			errortontai = (String) context.getAttribute("errortontai");
			password = (String) context.getAttribute("password");
			getServletContext().setAttribute("f5", "true");	
		}
		
		%>
		
         <section class="lib-section-5">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div style="margin: 20px;padding-left: 20px;padding-right: 20px;">
                    <%if(info!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                   Cập nhập thông tin tài khoản thành công, Vui lòng đăng nhập lại !
                                </div> <% }	 %>  
                                <%if(dky!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                   Đăng ký thành công tài khoản, chúc quý khách có một ngày tốt lành ! !
                                </div> <% }	 %>  
                                    <%if(password!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                  Đổi mật khẩu thành công, cùng mua hàng cùng P'tit Duo thôi nào!
                                </div> <% }	 %> 
                        <form action="http://localhost:8080/DoAnJava/LoginAdminController?action=Login" accept-charset="UTF-8"  id="customer_login" method="post" enctype="multidata/form-data" >
                            <div class="clearfix large_form ">
                                <label for="username" class="icon-field"><i class="icon-login icon-envelope "></i>Tài khoản</label>
                             <input type="text"  required name="username" id="username" placeholder="Nhập tên đăng nhập" class="text form-control">
                            </div>
                            <div class="clearfix large_form ">
                                <label for="password" class="icon-field"><i class="icon-login icon-shield"></i>Mật khẩu</label>
                                <input type="password" required name="password" id="password" placeholder="Nhập mật khẩu" class="text form-control" size="16">
                            </div>
                           
                            <div class="clearfix action_account_custommer">
                             <p><%
                             		
                      if(erroruser!=null)
                        {out.print(erroruser);}
                             if(errortontai!=null)
                 			{out.print(errortontai);}
                             %> </p>

                                <div class="action_bottom button dark">                   
                                     <div style="color: red; font-weight: bold; text-align: center;">  </div> 
                                     
                                    <input class="btn btn-info btn-signin" type="submit"  value="Đăng nhập" >
                                    &ensp;&ensp;&ensp; hoặc <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
&ensp;&ensp;&ensp; hoặc <button class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></button> &ensp;&ensp;&ensp;
                                    <a href="http://localhost:8080/DoAnJava/nguoidung/dangky.jsp" style="margin-left: 20px" title="Đăng ký tài khoản">Đăng ký tài khoản</a>
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
    <!-- END ĐĂNG NHẬP  -->
    
   
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
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();  
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
		  FB.api('/me',{fields:'name,email'},function(response){
		  console.log(response);
		  window.location.href = 'http://localhost:8080/DoAnJava/Loginfb?action=Face&name='+response.name+'&email='+response.email+'&id='+response.id;
		 
		  }); 
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '207476110975683',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v9.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

</script>
<script>
	      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Name: ' + profile.getName());        
        console.log("Email: " + profile.getEmail());
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);   
        
    
        //window.location.href = 'http://localhost:8080/DoAnJava/Loginfb?action=google&Name='+profile.getName()+'&Email='+profile.getEmail()+'&ID='+profile.getId();
       
      }
    </script>





<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>