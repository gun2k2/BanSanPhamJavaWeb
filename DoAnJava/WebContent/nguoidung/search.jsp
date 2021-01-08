<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<title>San Pham</title>
<%@include file="decorators/head.jsp" %>
</head>
<style>
	section.lib-section-3, section.lib-section-4, section.lib-section-5, section.lib-section-6, section.lib-section-7, section.lib-section-8, section.lib-section-9{
		float: none;
		margin-left: 15%;
		
    	
	}
	
</style>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>


	    		<!--  SILDE  -->
    <section class="lib-section-1">
    <div class="section_slider fw">
        <div class="home-slider owl-carousel owl-theme dots-enable owl-loaded owl-drag" data-lg-items="1" data-md-items="1" data-sm-items="1" data-xs-items="1" data-margin="0" data-dot="true" data-loop="true">
                            
                    <div class="owl-stage-outer">
                <div class="owl-stage" style="transform: translate3d(-2376px, 0px, 0px); transition: all 0s ease 0s; width: 5940px;">
                        <!-- SILDE ĐẦU -->
                       <div class="owl-item cloned" style="width: 1188px;">
                    <div class="item image-item">
                    <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" target="_blank">
                        <img class="img-responsive" src="http://localhost:8080/DoAnJava/nguoidung/images/anh11.jpg" alt="slider-1">
                    </a>
                    </div>
                    </div>
                                      
                    
            </div>

            </div>

            <div class="owl-nav disabled"><span role="presentation" class="owl-prev"><i class="fa fa-angle-left"></i></span><span role="presentation" class="owl-next"><i class="fa fa-angle-right"></i></span></div><div class="owl-dots disabled"><button role="button" class="owl-dot active"><span></span></button></div>
        </div>
    </div>
    </section>
     <!-- END SILDE  -->
     
     <!-- DƯỚI SILDE  -->
    <section class="lib-section-3">

    <div class="flex-container container ">
        <div class="column-wrap active-ani " >
            <div class="support-inner" >
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/giaohangtoanquoc.png" alt="FREE_DELIVERY">
                </div>
                <div class="inner-content">
                    <h5><span><strong>GIAO HÀNG TOÀN QUỐC</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/baohanhcucnhanh.png" alt="FREE_CHANGE_RETURN">
                </div>
                <div class="inner-content">
                    <h5><span><strong>BẢO HÀNH CỰC NHANH</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/luoncouudai.png" alt="hotline">
                </div>
                <div class="inner-content">
                    <h5><span><strong>LUÔN CÓ ƯU ĐÃI</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/hotrohetminh.png" alt="SUPPORT">
                </div>
                <div class="inner-content">
                    <h5><span><strong>HỖ TRỢ HẾT MÌNH</strong></span></h5>
                </div>
            </div>
        </div>
    </div>
</section>

    <!--END DƯỚI SILDE  -->
    <section class="lib-section-5">
    <div class="fw section_collection_products">
        <div class="w-85p container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="module-header">
                        <h2 class="title-head module-title module-index-title">
                            <a title="Sản phẩm khuyến mãi">
                                <span>Sản phẩm tìm kiếm</span>
                            </a>
                        </h2>
                    </div>
                 
                    
                    <div class="module-content">
                     
                        <div class="owl-carousel owl-theme dots-enable dots-top-right owl-loaded owl-drag" data-lg-items="5" data-md-items="4" data-sm-items="3" data-xs-items="2" data-xxs-items="2" data-margin="10" data-nav="true">
							
							<div class="owl-stage-outer">
							
	               			 <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1782px;">
								<%
                    	request.setCharacterEncoding("UTF-8");
                    	String q = request.getParameter("q");
                    	ResultSet rs = con.selectData("select * from sanpham where name like N'%" + q +"%'");
                    	while (rs.next()){
                    %>
								<div class="owl-item active" style="width: 287px; margin-right: 10px;">
			           				
			           				<div class="item">
			           				 
				           				<div class="product-box">
				           				 
											<div class="product-thumbnail">
												<%if (rs.getInt("discount") > 0){ %>
													<div class="tag-item tag-sale sale-flash">
					        							<%=rs.getInt("discount")%>%
													</div>
												<%} %>
				                                <a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getString("maSanPham") %>" title="<%=rs.getString("name") %>">
				                                   <img class="product-image" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString("image_link") %>" >
												</a>
											</div>
										
											<div class="product-info">
												<h3 class="product-name a-center">
													<a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=rs.getString("maSanPham") %>" title="<%=rs.getString("name") %>">
														<%=rs.getString("name") %>
													</a>
												</h3>
												<div class="price-box price-loop-style res-item">
													<span class="special-price">
														<span class="price"><%=rs.getInt("price") - rs.getInt("price")*rs.getInt("discount")/100 %></span>
													</span>
													<span class="old-price">
														<span class="price"><%=rs.getInt("price") %></span>
													</span>
			 
												</div>
			                          		</div>
			                          		
										</div>
			                                                        
			                        </div>
			                       
								</div>
								<%} %> 
							</div>
						  
						</div>
						
						<div class="owl-nav"><span role="presentation" class="owl-prev"><i class="fa fa-angle-left"></i></span><span role="presentation" class="owl-next"><i class="fa fa-angle-right"></i></span></div><div class="owl-dots disabled"></div></div>
                   
                    </div>
                	
                </div>
            </div>
        </div>
    </div>
</section>

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