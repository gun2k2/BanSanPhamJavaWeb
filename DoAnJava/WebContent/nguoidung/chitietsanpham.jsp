<%@page import="com.model.SanPhamModel"%>
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
		<title>Sản Phẩm </title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>
		
		 <!-- END CHI TIẾT SẢN PHẨM  -->
		 <% ConnectionToDB conn = new ConnectionToDB();
		 String maSP  = request.getParameter("maSanPham");
         ResultSet rs = conn.selectData("select * from sanpham where maSanPham ='" + maSP + "'") ; //cái mục chi tiết đâu
			if (!rs.next()) out.print("Sản phẩm không tồn tại !!!");
			else{
        %>
   <section class="lib-section-5">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    
    <ol class="breadcrumb breadcrumb-arrows" itemscope="" itemtype="http://schema.org/BreadcrumbList">
    <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
        <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" target="_self" itemprop="item"><span itemprop="name"><strong>Trang chủ</strong></span></a>
        <meta itemprop="position" content="1">
    </li>
    
    <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
       	
            <a target="_self" itemprop="item">
                                <span itemprop="name">
                     
                   <strong><%=rs.getString(2)%></strong>
                  
                </span>
                
                             </a>
            <meta itemprop="position" content="2">
           

    </li>
     </ol>
     

    <section class="product product-template">
   
     <div class="row details-product">
        <!--  ẢNH -->
         
                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 product_images_list">
                       <!--  ẢNH CHÍNH -->
                        	
                       
                        <div class="large-image">
                            <a>
                            <img id="img_01" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>" alt="<%=rs.getString(2)%>">
                      </a>
                        </div>
                       
                                  
            <div id="gallery_01" class="owl-carousel owl-theme thumbnail-product owl-loaded owl-drag" data-lg-items="6" data-md-items="4" data-sm-items="3" data-xs-items="4" data-xxs-items="3" data-margin="5" data-nav="true">
                                                            
                                            
                                    
        <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 228px;">
            <div class="owl-item active" style="width: 108.667px; margin-right: 5px;"><div class="item">
             
                  <a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: 'http://localhost:8080/DoAnJava/nguoidung/images/product/case.jpg',largeimage: 'http://localhost:8080/DoAnJava/nguoidung/images/product/case.jpg'}">
                           <img class="changeimg" src='http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>'> 
                  </a>   
                    
                           </div>
             </div>
                                          
                    </div>
            </div><div class="owl-nav disabled"><span role="presentation" class="owl-prev"><i class="fa fa-angle-left"></i></span><span role="presentation" class="owl-next"><i class="fa fa-angle-right"></i></span></div><div class="owl-dots disabled"></div>
            </div>
        		</div>
        	
            <!-- END ẢNH -->
    
    <!-- TỔNG INFO SẢN PHẨM -->
           <div id="product_detail_vue">
          
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 details-pro">
                <!-- INFO SẢN PHẨM -->
                <h1 class="title-head product-title" itemprop="name"><%=rs.getString(2)%></h1>
                <ul class="product-info">
                    <li class="product_sku">
                        <span>Mã sản phẩm: TEAMATTT_</span><span class="normal-text"><%=rs.getString(1)%></span>
                    </li>

                    <li class="product-vendor" itemprop="brand">
                        <span>Hãng sản xuất: </span><span class="normal-text"><%=rs.getString(9)%></span>
                    </li>
                    <li class="product-vendor" itemprop="brand">
                         <span>Thời gian bảo hành: </span><span class="normal-text"><%=rs.getInt(10)%> Tháng</span>
                    </li>
                    <li class="product-vendor" itemprop="brand">
                    	<%if(rs.getInt(11)==1){ %>
                        <span>Tình trạng:</span><span
                         class="normal-text"> Còn Hàng</span>
                         <%}else{ %>
                         <span>Tình trạng:</span><span
                         class="normal-text"> Hết Hàng</span>
                         <%} %>
                    </li>
                </ul>
                 <!-- END INFO SẢN PHẨM -->
                 <!-- GIÁ TIỀN SẢN PHẨM -->
                 
                <div class="price-box price-box-product">
                    <span class="special-price">
                    <%if(rs.getInt(4)!=0){ %>
					                    <span class="special-price"><span class="price">Giá: 
					                  	<fmt:formatNumber type = "number" groupingUsed = "true" 
					                  		value = "<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100%>" /> VND
					                    		
					                    	</span></span>
										<span class="old-price"><span class="price">Giá cũ: 
											<fmt:formatNumber type = "number" groupingUsed = "true" 
										                  		value = "<%=rs.getInt(3)%>" /> VND
											
										</span></span>
                    		<%}else{ %>
                    		<span class="special-price"><span class="price">Giá: 
                    			 
                    			<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs.getInt(3)%>" /> VND
                    		</span></span>
                    		<%} %>            
                    </span>
                </div> 
                <!-- END GIÁ TIỀN SẢN PHẨM -->           
               <!--  THÊM VÀO GIỎ HÀNG -->
                <div class="form-product">
                
                    <div class="button_actions col-md-6 col-12 col-lg-6 col-sm-12" v-show="product.status === 1">         
                      <%if(rs.getInt(11)==1){ %>
                   <a class="btn btn-buy btn-transition add_to_cart button-hover-3"  href="http://localhost:8080/DoAnJava/XuLyMuaHang?maSanPham=<%=rs.getInt(1)%>&action=them" title='Mua ngay'><span>Thêm vào giỏ hàng</span></a>
                     <%}else{ %>
                    <button class="btn btn-primary" type="button" title='San Pham da het'> <span>San Pham Da Het</span></button>
                     <%} %>
                     
                     </div> 
                </div>
                <!-- END THÊM VÀO GIỎ HÀNG -->       
            </div>
         
        </div>
         
    </div>
    <!-- END TỔNG INFO SẢN PHẨM -->
    
    <!--   NỘI DUNG CHI TIẾT SẢN PHẨM -->
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
                                        <i class="fa fa-info-circle" aria-hidden="true"></i> <span><strong>Thông tin sản phẩm</strong></span>
                                    </a>
                                </h4>
                            </div>
                   <!--  NỘI DUNG SẢN PHẨM -->
                            <div id="collapse-1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-1" aria-expanded="true">
                            <div class="panel-body rte">
 <p></p><p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"> <%=rs.getString(13)%></span></span></p>

<p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"><%=rs.getString(16)%> </span></span></p>

<p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"><%=rs.getString(17)%></span></span></p>

<p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"><%=rs.getString(18)%></span></span></p>

<p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"><%=rs.getString(19)%></span></span></p>

<p><span style="font-size:26px"><span style="font-family:Times New Roman,Times,serif"><%=rs.getString(20)%></span></span></p><p></p>
                                </div>
                            </div>
                    <!-- END NỘI DUNG SẢN PHẨM -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- END NỘI DUNG CHI TIẾT SẢN PHẨM -->
</section>
    <!-- END SẢN PHẨM -->
                
                </div>
            </div>
        </div>
    </section>
   <%} %>
    <!-- END CHI TIẾT SẢN PHẨM  -->

   
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