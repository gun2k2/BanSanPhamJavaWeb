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
	.fb-comments{
	margin-left: 30%;
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
   	 <% ConnectionToDB conn = new ConnectionToDB();
		 int id = Integer.parseInt(request.getParameter("id"));
        ResultSet rs = conn.selectData("select * from tintuc where id ='" + id + "'") ; //cái mục chi tiết đâu
        %>
		<section class="lib-section-5">
			<% while(rs.next()){ %>
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <ol class="breadcrumb breadcrumb-arrows" itemscope="" itemtype="http://schema.org/BreadcrumbList">
    <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
        <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" target="_self" itemprop="item"><span itemprop="name"><strong>Trang chủ</strong></span></a>
        <meta itemprop="position" content="1">
    </li>
    <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
        <a href="http://localhost:8080/DoAnJava/nguoidung/tintuc.jsp" target="_self" itemprop="item">
                <span itemprop="name">
                   <strong>Blog</strong>
                </span>
        </a>
        <meta itemprop="position" content="2">
    </li>
</ol>
                        <br>
                          <br>
                            <h2 style="text-align: justify;font-weight: bold;"><%=rs.getString(2)%></h2>
                            <div class="blog-post-meta">
                                <span class="author vcard"><a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">ATTT1</a></span>
                                <span class="date" style="float: right">
                                    Ngày đăng: <time><%=rs.getString(7)%></time></span>
                            </div>
                            <hr>
                            <div class="detail_content rte" style="text-align: justify;">
                                <h1><span style="font-size:36px"><%=rs.getString(3)%></span></h1>

<p><img alt="" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(17)%>" style="height:508px; width:1024px"></p>

<p><span style="font-size:22px"><%=rs.getString(8)%></span></p>

<p><span style="font-size:22px"><%=rs.getString(9)%>.</span></p>

<p><span style="font-size:22px"><%=rs.getString(10)%></span></p>

<p><span style="font-size:22px"><%=rs.getString(11)%>.</span></p>


<p><iframe frameborder="0" scrolling="no" src="<%=rs.getString(5)%>"></iframe></p>

<p><span style="font-size:22px"><%=rs.getString(12)%>.</span></p>

<p><span style="font-size:22px"><%=rs.getString(13)%>.</span></p>

<p><span style="font-size:22px"><%=rs.getString(14)%>.</span></p>

<p><span style="font-size:22px"><%=rs.getString(15)%>.</span></p>

<p><span style="font-size:22px"><%=rs.getString(16)%>.</span></p>

                            </div>
                                            </div>
                </div>
            </div>
        </div>
        <%} %>
    </section>
<% ConnectionToDB connn = new ConnectionToDB();
		 int idd = Integer.parseInt(request.getParameter("id"));
        ResultSet rss = conn.selectData("select * from tintuc where id ='" + idd + "'") ; //cái mục chi tiết đâu
        %>
        <% while(rss.next()){ %>

</div>
<div id="fb-root"></div>
<div class="fb-comments" data-href="http://localhost:8080/DoAnJava/CTtintuc?id=<%=rss.getInt(1)%>" data-width="" data-numposts="3"></div>
<%} %>
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
	<div id="fb-root"></div>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0&appId=207476110975683&autoLogAppEvents=1" nonce="C6p50rmQ"></script>
</body>
</html>