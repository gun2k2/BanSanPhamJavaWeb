<%@page import="com.dao.giohang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.model.KhachHangModel"%>
<%@page import="com.dao.giohang"%>
<%@page import="com.dao.giohang"%>
<%@page import="com.model.SanPhamModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<!DOCTYPE html>
<%
					ServletContext context = getServletContext(); 
					String error = (String) getServletContext().getAttribute("error");
					String f5 = (String) getServletContext().getAttribute("f5");
					String thanhtoan = null;
					
					if (error == null) error = "false";	
					if (f5 == null) f5 = "false";
					if (error.equals("true") & f5.equals("false")) {
						thanhtoan = (String) context.getAttribute("thanhtoan");
						getServletContext().setAttribute("f5", "true");	
					}
					%>
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Gio Hang</title>
<%@include file="decorators/head.jsp" %>
<style>

<b:tag name='style'>
.buttons_added {
    opacity:1;
    display:inline-block;
    display:-ms-inline-flexbox;
    display:inline-flex;
    white-space:nowrap;
    vertical-align:top;
}
.is-form {
    overflow:hidden;
    position:relative;
    background-color:#f9f9f9;
    height:2.2rem;
    width:1.9rem;
    padding:0;
    text-shadow:1px 1px 1px #fff;
    border:1px solid #ddd;
}
.is-form:focus,.input-text:focus {
    outline:none;
}
.is-form.minus {
    border-radius:4px 0 0 4px;
    background-color: lightsalmon;
}
.is-form.plus {
background-color: lightsalmon;
    border-radius:0 4px 4px 0;
}
.input-qty {
    background-color:#fff;
    height:50%;
    text-align:center;
    font-size:30px;
    display:inline-block;
    vertical-align:top;
    margin:0;
    border-top:1px solid #ddd;
    border-bottom:1px solid #ddd;
    border-left:0;
    border-right:0;
    padding:0;
}
.input-qty::-webkit-outer-spin-button,.input-qty::-webkit-inner-spin-button {
    -webkit-appearance:none;
    margin:0;
}
/* ]]> */</b:tag> 
</style>
</head>
<body>
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>

		 <!-- GIỎ HÀNG  -->
   <section class="lib-section-5 main-cart-page main-container col1-layout">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                     <!-- có sản phẩm trong giỏ hàng -->
                     <%if(thanhtoan!=null)
                			{%> <div class="alert alert-success text-left">
                                    <button class="close" data-dismiss="alert"><i class="pci-cross pci-circle"></i>
                                    </button>
                                   Đã tiếp nhận đơn hàng. Xin cảm ơn quý khác đã mua sắm tại website.
                                </div> <% }	 %>
                    
                 <div id="cart_info" style="margin: 10px; padding-left: 20px; padding-right: 20px;"><ol itemscope="itemscope" itemtype="http://schema.org/BreadcrumbList" class="breadcrumb breadcrumb-arrows"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" target="_self" itemprop="item"><span itemprop="name">Trang chủ</span></a> <meta itemprop="position" content="1"></li> <li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">
                         Giỏ hàng của bạn
                          <%
				KhachHangModel k = (KhachHangModel)session.getAttribute("userloginadmin");
                KhachHangModel  khfb1 = (KhachHangModel)session.getAttribute("userfb");
                KhachHangModel  khgg1 = (KhachHangModel)session.getAttribute("usergg");
				if(k!=null){
					out.print(k.getName());
				}
				if(khfb1 !=null){
					out.print(khfb1.getName());
				}
				if(khgg1 !=null){
					out.print(khgg1.getName());
				}
				
				%> 
				</span> <meta itemprop="position" content="2"></li></ol> 
						
                            <div class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th scope="col">STT</th> 
                                        	<th scope="col">Mã sản phẩm</th>
                                            <th scope="col">Hình ảnh</th> 
                                            <th scope="col">Tên sản phẩm</th> 
                                            <th scope="col">Số lượng</th> 
                                            <th scope="col">Thành tiền</th> 
                                            <th scope="col">Xóa</th>
                                        </tr>
                                    </thead> 
                                   
                                    <tbody>
                                              <%
                            
                                              int count=0;for(int i = 0;i<gioHang.size();i++){ count++;%>       
                                                                                                                                          
                                              <tr>
                                       
	                                            <td scope="row"><% out.print(count);%></td>
	                                            <td>TEAMATTT_<%out.print(gioHang.get(i).getMaSanPham()); %></td>
	                                            <td class="wrapper-img" style="width: 100px;"><a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%out.print(gioHang.get(i).getMaSanPham()); %>"><img src="http://localhost:8080/DoAnJava/nguoidung/images/<%out.print(gioHang.get(i).getImage_link()); %>" alt="<%out.print(gioHang.get(i).getName()); %>"></a>
	                                            </td>
	                                            <td style="width: 150px;"><a href="http://localhost:8080/DoAnJava/CTSanPham?maSanPham=<%out.print(gioHang.get(i).getMaSanPham()); %>"><%out.print(gioHang.get(i).getName()); %></a> <br> 
	                                          <%if(gioHang.get(i).getDiscount()>0){ %>
	                                          
	                                           <strong>
	                                            <fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=gioHang.get(i).getPrice()-gioHang.get(i).getPrice()*gioHang.get(i).getDiscount()/100%>" />VND
	                                          
	                                           </strong> 
	                                           <% }else{%>
	                                           <strong>
	                                    	<fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=gioHang.get(i).getPrice()%>" />VND
	                                           </strong> 
	                                           
	                                           <%} %>
	                                            </td> 
	                                         
	                                            <td class="buttons_added" > 
	                          <div class="buttons_added">
							  <a class="minus is-form" id="giamsoluong"  type="button" href="http://localhost:8080/DoAnJava/XuLyMuaHang?maSanPham=<%=gioHang.get(i).getMaSanPham()%>&action=giam">-</a>
							  
						<form action="http://localhost:8080/DoAnJava/XuLyMuaHang?maSanPham=<%=gioHang.get(i).getMaSanPham()%>&action=update" method="post">
						<input type="number" size="10%" aria-label="quantity" name="sl" id="sl" class="input-qty" max="50" min="1"  value="<%out.print(gioHang.get(i).getSoLuongMua()); %>">
							 </form>
							  <a class="plus is-form" type="button" href="http://localhost:8080/DoAnJava/XuLyMuaHang?maSanPham=<%=gioHang.get(i).getMaSanPham()%>&action=them">+</a>
							</div>
							</td> 
	                                               <%if(gioHang.get(i).getDiscount()==0){ %>
	                                            <td class="price" style="width: 100px;">
		                                            <strong>
		                                           	<fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=gioHang.get(i).getPrice() * Integer.parseInt(gioHang.get(i).getSoLuongMua()) %>" />VND
		                                           </strong>
	                                            
	                                            </td> 
	                                            <%}else{ %>
	                                            <td class="price" style="width: 100px;">
	                                            <strong>
		                                           	<fmt:formatNumber type = "number" groupingUsed = "true" 
		                                           	value = "<%=(gioHang.get(i).getPrice() - gioHang.get(i).getPrice()*gioHang.get(i).getDiscount()/100) 
		                                           					* Integer.parseInt(gioHang.get(i).getSoLuongMua()) %>" />VND
		                                           </strong>
	                                            	
	                                            </td> 
	                                            <%} %>
	                                            <td  style="width: 30px;"><a onclick="myFunction()" href="http://localhost:8080/DoAnJava/XuLyXoaSP?maSanPham=<%=gioHang.get(i).getMaSanPham()%>" class="cart"><i aria-hidden="true" class="fa fa-trash" style="font-size: 20px;"></i></a></td>
	                                        
                                        	</tr><%} %>
                                                                            
									</tbody>
									
                                </table>
                                       
                                             <div id="layout-page-first" class="col-md-12">
									
											
												 <% 
                                              if(gioHang.size() !=  0  ){ %>
											<p class="text-center"><a href="http://localhost:8080/DoAnJava/nguoidung/theodoidonhang.jsp">
												<i class="fa fa-reply"></i> Xem Đơn Hàng của bạn</a>
											</p>
												<%}else{%> 
												<p class="text-center">Không có sản phẩm nào trong giỏ hàng!</p>
												<p class="text-center"><a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">
												<i class="fa fa-reply"></i> Mua sắm thôi nào !</a>
												&ensp;&ensp;&ensp; hoặc 
											<a href="http://localhost:8080/DoAnJava/nguoidung/theodoidonhang.jsp">
												<i class="fa fa-reply"></i> Xem Đơn Hàng của bạn</a>
											</p>
											<%} %>
										</div>
										
                            </div> 
                           
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><span style="float: right; color: red;"></span>
                            </div> 
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">&lt;&lt; Trang chủ</a> 
                         
                                <%if(gioHang.size()>0){ %>
                                <a href="http://localhost:8080/DoAnJava/nguoidung/dathang.jsp" type="button" class="btn btn-buy btn-transition add_to_cart button-hover-3" style="float: right;">Tiến hành đặt hàng</a>
                                <%} %>
                            </div>
                </div>
               
                </div>
            </div>
        </div>
    </section>
    <!-- END GIỎ HÀNG -->
		


    <%@ include file="footer/footer.jsp" %>
	<%@ include file="decorators/footer.jsp" %>

	<script>
function myFunction() {
	alert("Xóa sản phẩm thành công .!!!");
}
</script>

</body>
</html>