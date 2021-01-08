<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>

<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Phuongphan.vn</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
	 <div class="category-products products">
        <div class="module-content">
    
     
            <section class="products-view products-view-grid">
            
                  <% int id = Integer.parseInt(request.getParameter("id"));
                   ConnectionToDB connn = new ConnectionToDB();  
                   ResultSet rss = connn.selectData("select * from danhmuc where id='"+id+"'");  
         			%>
         			 <%while(rss.next()){%> 
                 <h1 class="title-head collection-title">
                 <%=rss.getString(2)%>
            	</h1>
            	<%} %>
            	
            	    <% int danhmuc  = Integer.parseInt(request.getParameter("id"));
                   ConnectionToDB connnn = new ConnectionToDB();  
                   ResultSet rs = connnn.selectData("select * from sanpham where danhmuc='"+danhmuc+"'");  
        				%>
        		
                <div class="row">     
              
                  <%while(rs.next()){%> 
                
                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-3 col-item">
                 
                <div class="product-box">
                    <div class="product-thumbnail">
                    <div class="tag-item tag-sale sale-flash"> 
                     
                                         <%=rs.getInt(4)%>%
                          </div>
                    <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getInt(1)%>" title=" <%=rs.getString(2)%>"><img class="product-image" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>"> </a>
                    </div>
                    <div class="product-info">
                    <h3 class="product-name a-center">
                    <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getInt(1)%>" >
                    <%=rs.getString(2)%></a>
                    </h3>
                    <div class="price-box price-loop-style res-item">
                         <!-- chứng tỏ sản phẩm đã được giảm giá -->
                         <%if(rs.getInt(4)!=0){ %>
					                    <span class="special-price"><span class="price">
					                  	<fmt:formatNumber type = "number" groupingUsed = "true" 
					                  		value = "<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100%>" />VND
					                    		
					                    	</span></span>
										<span class="old-price"><span class="price">
											<fmt:formatNumber type = "number" groupingUsed = "true" 
										                  		value = "<%=rs.getInt(3)%>" />VND
											
										</span></span>
                    		<%}else{ %>
                    		<span class="special-price"><span class="price">
                    			 
                    			<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs.getInt(3)%>" />VND
                    		</span></span>
                    		<%} %>
                      
                    </div>

                    </div>
                </div>
               
                </div>
                 <%} %>
                 </div>
              
                <div style="float: right">
                    
                </div>
               
            </section>
            
            
        </div>
    </div>
    <!-- END SẢN PHẨM  -->

   
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