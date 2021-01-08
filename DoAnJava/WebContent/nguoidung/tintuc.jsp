
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
		<title>Blogs-ATTT1</title>
		
    <meta name="keywords" content=""/>
		<link rel="icon" href="localhost:8080/DoAnJava/admin/images/brand.png" type="image/x-icon"/>
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
  <!--  id , name, title, content, image, trailer, view,ngaydang -->
    <section class="lib-section-5">
    	<% 
                    ConnectionToDB conn = new ConnectionToDB();  
                               ResultSet rs = conn.selectData("select * from tintuc ");
                                
                                
                                %>
                                <%while(rs.next()){%>    
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                               <article class="blog-loop">
                                <div class="blog-post row">
                                
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <a href="http://localhost:8080/DoAnJava/CTtintuc?id=<%=rs.getInt(1)%>" class="blog-post-thumbnail image-hover-2" title="" rel="nofollow">
                                            <img class="image-blogs" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(4)%>" alt="<%=rs.getString(2)%>">
                                            <%=rs.getInt(6)%> <i class="fa fa-eye" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                    <div class="col-md-8 col-xs-12 col-sm-8">
                                        <h3 class="blog-post-title custom-title">
                                            <a href="http://localhost:8080/DoAnJava/CTtintuc?id=<%=rs.getInt(1)%>" title="<%=rs.getString(2)%>"><%=rs.getString(2)%></a>
                                        </h3>
                                        <div class="blog-post-meta">
                                            <span class="author vcard">ATTT1</span>
                                            <span class="date" style="float: right"> Ngày đăng: <time><%=rs.getString(7)%></time></span>
                                        </div>
                                        
                                        <div class="entry-content">
                                          <div class="content-blog">
                          <span>
      <h1><span style="font-size:36px"><%=rs.getString(3)%>&nbsp;</span></h1>
						</span>
										</div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </article>
                       <font style="vertical-align: inherit;"></font>
                       </div>
                       <font style="vertical-align: inherit;"></font>
                       </div>
                       <font style="vertical-align: inherit;"> </font>
            </div>
            		<font style="vertical-align: inherit;"></font>
        </div>
        <%} %>
        <font style="vertical-align: inherit;"></font>
    </section>
    </div>
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
</body>
</html>