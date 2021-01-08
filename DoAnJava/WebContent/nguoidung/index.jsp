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
		<title>Trang chủ</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>		
 
    <!-- ẢNH MÔ TẢ 1 -->
    <div id="app">
   <section class="lib-section-4">
    <div class="fw section_banner section_large_banner">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <a class="image-hover-line" title="mô tả ảnh 1"
                      href="javascript:;">
                        <img class="img-responsive image-line" src=""
                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/sildemota1.png"
                             alt="mô tả ảnh 1"/>
                        <span class="effect-line"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

</div>
    <!-- END ẢNH MÔ TẢ 1 -->

     <!-- SẢN PHẨM KHUYẾN MÃI -->

<section class="lib-section-5">
    <div class="fw section_collection_products">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="module-header">
                        <h2 class="title-head module-title module-index-title">
                            <a title="Sản phẩm nổi bật">
                                <span>Sản phẩm khuyến mãi</span>
                            </a>
                        </h2>
                    </div> <% 
                    ConnectionToDB conn = new ConnectionToDB();  
                               ResultSet rs = conn.selectData("select * from sanpham ");
                                
                                
                                %>
                    <div class="module-content">
                        <div class="owl-carousel owl-theme dots-enable dots-top-right" data-lg-items="5"
                             data-md-items="4" data-sm-items="3" data-xs-items="2" data-xxs-items="2" data-margin="10"
                             data-nav="true">
                                         <%while(rs.next()){%>  
                                         <%if(rs.getInt(4)!=0)
                            		   { %>         
                                    <div class="item"><!-- SẢN PHẨM -->
                               
                            		   
                                    <div class="product-box"> 
                                        <div class="product-thumbnail"> <!--  GIẢM GIÁ -->
                                            <div class="tag-item tag-sale sale-flash">
                                               <%=rs.getInt(4)%>%
                                         	</div>
                                            <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getInt(1)%>" 
                                               title="<%=rs.getString(2)%>">
                                             <img class="product-image"  src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>">
                                            </a>
                                        </div> <!-- END GIẢM GIÁ -->

                                        <div class="product-info"> <!-- INFO SẢN PHẨM -->
                                            <h3 class="product-name a-center">
                                                <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getInt(1)%>"
                                               title="<%=rs.getString(2)%>">
                                                   <%=rs.getString(2)%></a>
                                               
                                               <%=rs.getInt(7)%> <i class="fa fa-eye" aria-hidden="true"></i>
                                            </h3>
                                               <div class="price-box price-loop-style res-item">
                         <!-- chứng tỏ sản phẩm đã được giảm giá -->
                                               <span class="special-price"><span class="price">
	                                               	<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100%>" />VND
                                               		
                                               	</span></span>
                    							<span class="old-price"><span class="price">
	                    							<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs.getInt(3)%>" />VND
                    								
                    							</span></span>
                      
                    </div>
                                        </div>
                                    </div>
                                
                                </div>  <%} %> <% } %>
                            

                                <!-- END SẢN PHẨM -->
                                                           
                            

                                                             
                                             
                                                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
       <!--  END SẢN PHẨM KHUYẾN MÃI -->

       <!--  SẢN PHẨM BAN CHAY -->
<section class="lib-section-5">
    <div class="fw section_collection_products">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="module-header">
                        <h2 class="title-head module-title module-index-title">
                            <a title="Sản phẩm nổi bật">
                                <span>Sản phẩm bán chạy</span>
                            </a>
                        </h2>
                    </div>
                    <% 
                  				 ConnectionToDB conn1 = new ConnectionToDB();  
                   			 ResultSet rs1 = null; 
                  				String dataa ="select * from sanpham order by buyed DESC";
                               rs1 = conn1.selectData(dataa);
                                
                                
                                %>
                    <div class="module-content">
                        <div class="owl-carousel owl-theme dots-enable dots-top-right" data-lg-items="5"
                             data-md-items="4" data-sm-items="3" data-xs-items="2" data-xxs-items="2" data-margin="10"
                             data-nav="true">
                                     <%while(rs1.next()){%>  
                                            
                                    <div class="item"><!-- SẢN PHẨM -->
                               
                            		   
                                    <div class="product-box"> 
                                       <div class="product-thumbnail"> <!--  GIẢM GIÁ -->
                                            <div class="tag-item tag-sale sale-flash">
                                               <%=rs1.getInt(4)%>%
                                         
                                                                     </div>
                                            <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs1.getInt(1)%>" 
                                               title="<%=rs1.getString(2)%>">
                                             <img class="product-image"  src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs1.getString(6)%>">
                                            </a>
                                        </div> <!-- END GIẢM GIÁ -->

                                        <div class="product-info"> <!-- INFO SẢN PHẨM -->
                                            <h3 class="product-name a-center">
                                                <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs1.getInt(1)%>"
                                               title="<%=rs1.getString(2)%>">
                                                   <%=rs1.getString(2)%></a>
                                               
                                              <%=rs1.getInt(7)%> <i class="fa fa-eye" aria-hidden="true"></i>
                                            </h3>
                                <div class="price-box price-loop-style res-item">
                         <!-- chứng tỏ sản phẩm đã được giảm giá -->
                         				<%if(rs1.getInt(4)!=0){ %>
					                    <span class="special-price"><span class="price">
					                  	<fmt:formatNumber type = "number" groupingUsed = "true" 
					                  		value = "<%=rs1.getInt(3)-rs1.getInt(3)*rs1.getInt(4)/100%>" />VND
					                    		
					                    	</span></span>
										<span class="old-price"><span class="price">
											<fmt:formatNumber type = "number" groupingUsed = "true" 
										                  		value = "<%=rs1.getInt(3)%>" />VND
											
										</span></span>
                    		<%}else{ %>
                    		<span class="special-price"><span class="price">
                    			 
                    			<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs1.getInt(3)%>" />VND
                    		</span></span>
                    		<%} %>
                      
                    							</div>
                                        </div>
                                    </div>
                                
                                </div>
                                  <% } %>
                            

                                <!-- END SẢN PHẨM -->
                                                                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
   <!--  END SẢN PHẨM ban chay  -->

    <!-- SILDE MÔ TẢ 2 3 -->
    <section class="lib-section-6">
    <section class="fw section_banner section_medium_banners">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 banner_first">
                
                    <div class="item">
                        <a title="mô tả ảnh 2" class="image-hover-line"
                           href="javascript:;">
                            <img 
                                 data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/sildemota.png"
                                 alt="mô tả ảnh 2" class="img-responsive image-line">
                            <span class="effect-line"></span>
                        </a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
                    <div class="item">
                        <a title="mô tả ảnh 3" class="image-hover-line"
                           href="javascript:;"
                        >
                            <img
                                 data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/sildemota.jpg"
                                 alt="mô tả ảnh 3" class="img-responsive image-line">
                            <span class="effect-line"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<!-- END SILDE MÔ TẢ 2 3 -->

<!-- SAN PHAM NỔI BẬT -->
<section class="lib-section-7">
    <div class="fw section_collection_products">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="module-header">
                        <h2 class="title-head module-title module-index-title">
                            <a title="Sản phẩm nổi bật">
                                <span>Sản phẩm nổi bật</span>
                            </a>
                        </h2>
                    </div>
                    <div class="module-content">
                         <% 
                   				 ConnectionToDB conn2 = new ConnectionToDB();  
                         
                         ResultSet rs2 = null; 
           				String dataaa ="select * from sanpham order by luotxem DESC";
                        rs2 = conn2.selectData(dataaa);
                              
                                
                                
                                %>
                        <div class="owl-carousel owl-theme dots-enable dots-top-right" data-lg-items="5"
                             data-md-items="4" data-sm-items="3" data-xs-items="2" data-xxs-items="2"
                             data-margin="10" data-nav="true">
									<%while(rs2.next()){%>  
                                        <div class="item"><!-- SẢN PHẨM -->
                              
                            		   
                                    <div class="product-box"> 
                                        <div class="product-thumbnail"> <!--  GIẢM GIÁ -->
                                            <div class="tag-item tag-sale sale-flash">
                                               <%=rs2.getInt(4)%>%
                                         
                                                                     </div>
                                            <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs2.getInt(1)%>" 
                                               title="<%=rs2.getString(2)%>">
                                             <img class="product-image"  src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs2.getString(6)%>">
                                            </a>
                                        </div> <!-- END GIẢM GIÁ -->

                                        <div class="product-info"> <!-- INFO SẢN PHẨM -->
                                            <h3 class="product-name a-center">
                                                <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs2.getInt(1)%>"
                                               title="<%=rs2.getString(2)%>">
                                                   <%=rs2.getString(2)%></a>
                                               
                                               <%=rs2.getInt(7)%> <i class="fa fa-eye" aria-hidden="true"></i>
                                            </h3>
                                               <div class="price-box price-loop-style res-item">
                         <!-- chứng tỏ sản phẩm đã được giảm giá -->
                         				<%if(rs2.getInt(4)!=0){ %>
					                    <span class="special-price"><span class="price">
					                  	<fmt:formatNumber type = "number" groupingUsed = "true" 
					                  		value = "<%=rs2.getInt(3)-rs2.getInt(3)*rs2.getInt(4)/100%>" />VND
					                    		
					                    	</span></span>
										<span class="old-price"><span class="price">
											<fmt:formatNumber type = "number" groupingUsed = "true" 
										                  		value = "<%=rs2.getInt(3)%>" />VND
											
										</span></span>
                    		<%}else{ %>
                    		<span class="special-price"><span class="price">
                    			 
                    			<fmt:formatNumber type = "number" groupingUsed = "true" 
	                                               		value = "<%=rs2.getInt(3)%>" />VND
                    		</span></span>
                    		<%} %>
                      
                    							</div>
                                        </div>
                                    </div>
                               
                                </div>   <% } %>
                            

                                <!-- END SẢN PHẨM -->

                                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- END SẢN Pham nổi bật -->
    </div>   <!-- END PAGE BODY  -->

     <!-- ĐỐI TÁC -->
    <section class="lib-section-10">
    <section class="fw section_brands">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="module-header">
                        <h2 class="title-head module-title module-index-title">
                            <a href="javascript:;">
                                <span>Đối tác</span>
                            </a>
                        </h2>
                    </div>
                    <div class="module-content">
                        <div class="owl-brand owl-theme owl-carousel nav-enable nav-left-right" data-lg-items="7"
                             data-md-items="5" data-sm-items="4" data-xs-items="3" data-xxs-items="4"
                             data-margin="50" data-autoplay="true">
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac1.jpg"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac2.jpg"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac3.png"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac8.png"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac9.jpg"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac4.png"
                                         class="img-responsive">
                                </div>
                                                            <div class="item">
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/doitac5.jpg"
                                         class="img-responsive">
                                </div>
                                                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
    <!-- END ĐỐI TÁC -->
    

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