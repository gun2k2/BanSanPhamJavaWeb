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
		<title>Đơn hàng của tôi</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>


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
                                        <i class="fa fa-info-circle" aria-hidden="true"></i> <span><strong>Thông tin đơn hàng</strong></span>
                                    </a>
                                </h4>
                            </div>
                      
                          
                   <!--  NỘI DUNG don hang -->
                   
                            <div id="collapse-1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-1" aria-expanded="true">
                            <div class="panel-body rte">
						<table >
								<thead>
									<tr>
										<th>Mã đơn hàng</th>
										<th>Ngày mua</th>
										<th>Sản phẩm</th>
										<th>Số Lượng</th>
										<th>Tổng tiền</th>
										<th>Trạng thái đơn hàng</th>
									</tr>
								</thead>
								<tbody>
								<% 
                          ConnectionToDB ketnoi = new ConnectionToDB();
                          ResultSet rs = ketnoi.selectData("select * from ct_donhang " );
    					while(rs.next()){ 
    						if(kh==null )
    						{%>
    							
    							
    					<% 	}if(kh!=null){%> 
    					
    					<% if(rs.getString("email").equals(kh.getEmail()) ){
    						
    					
                                %>  
									<tr>
										<td><a  class="text-danger" >DH_<%=rs.getInt("id") %></a></td>
										<td><%=rs.getDate("ngaymua") %></td>
										<td>
										 <% 
										 ResultSet temp = con.selectData("select name from sanpham where masanpham = " + rs.getInt("masanpham"));
                                     	temp.next();
                                     	String tenSP = temp.getString("name");                                 
				                               ResultSet sp = con.selectData("select * from sanpham where masanpham =" +rs.getString("masanpham") );			                                
				                                while(sp.next()){%>
							                     <div class="image_thumb"> 
							                        
							                         <a target="_blank" title="" class="tipS" href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=sp.getInt(1)%>">
							                        <b><%=tenSP%></b>
							                    </a>
							                        <div class="clear"></div>
							                    </div>
							                    
							                   
							                    <%} %>	
										
										</td>
										<td><%=rs.getInt("soLuong") %></td>
										<td><%int thanhtien =  rs.getInt("thanhtien");%>
                                                	<fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=thanhtien%>" /></td>
										<td>
										
										 <%if(rs.getInt("trangthai")==1){ %> 
										Chờ xác nhận
										 <%}else if(rs.getInt("trangthai")==2){ %>
										 Đang giao hàng
										  <%} else{ %>
										  Đã nhận hàng
										  <%} %>
										
										</td>
									</tr>
									    <%}%>
    					
    					 <%} %> <% if(khfb==null){%>
    						
    					<% }if(khfb!=null)
   						{
    							if( rs.getString("email").equals(khfb.getEmail()) ){
    					
    					
                                %>  
									<tr>
										<td><a  class="text-danger" >DH_<%=rs.getInt("id") %></a></td>
										<td><%=rs.getDate("ngaymua") %></td>
										<td>
										 <% 
										 ResultSet temp = con.selectData("select name from sanpham where masanpham = " + rs.getInt("masanpham"));
                                     	temp.next();
                                     	String tenSP = temp.getString("name");                                 
				                               ResultSet sp = con.selectData("select * from sanpham where masanpham =" +rs.getString("masanpham") );			                                
				                                while(sp.next()){%>
							                     <div class="image_thumb"> 
							                        
							                         <a target="_blank" title="" class="tipS" href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%=sp.getInt(1)%>">
							                        <b><%=tenSP%></b>
							                    </a>
							                        <div class="clear"></div>
							                    </div>
							                    
							                   
							                    <%} %>	
										
										</td>
										<td><%=rs.getInt("soLuong") %></td>
										<td><%int thanhtien =  rs.getInt("thanhtien");%>
                                                	<fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=thanhtien%>" /></td>
										<td>
										
										 <%if(rs.getInt("trangthai")==1){ %> 
										Chờ xác nhận
										 <%}else{ %>
										 Đang giao hàng
										  <%} %>
										
										</td>
									</tr>
									    <%}%>
									    
									    <%  }%>
    					 
                        	
                        <% 	  
                          }%>
							
								</tbody>
						</table>
                                </div>
                            </div>
                      
                    <!-- END NỘI DUNG don hang -->
                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
							<p class="text-center"><a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">
							<i class="fa fa-reply"></i> Tiếp tục mua hàng</a>
							</p>

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