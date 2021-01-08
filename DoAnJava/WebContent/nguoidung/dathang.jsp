<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.model.KhachHangModel"%>
<%	KhachHangModel  kh1 = (KhachHangModel)session.getAttribute("userloginadmin");
	KhachHangModel  khfb1 = (KhachHangModel)session.getAttribute("userfb");
	KhachHangModel  khgg1 = (KhachHangModel)session.getAttribute("usergg");
	
	
							if(kh1==null){
								
								if(khfb1==null){
									
									if(khgg1==null){
										
										System.out.println("bi quay ve fb");
										response.sendRedirect("dangnhap.jsp");
									}
									
								}
							}
					
							if (request.getAttribute("check") != null) {
  		RequestDispatcher rd = request.getRequestDispatcher("nguoidung/index.jsp");
  		rd.forward(request, response);
  	}
							
  					%>
  					

  				
  					
  						
<html>
<head>

		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Thanh Toan</title>
<%@include file="decorators/head.jsp" %>
</head>
<body>
 
	<div class="page-body">
    <div class="hidden-md hidden-lg opacity_menu"></div>
    <div class="opacity_filter"></div>
<%@include file="header/header.jsp" %>
<%@include file="left/left.jsp" %>
		
		 <!-- ĐẶT HÀNG -->
		  
    <div id="app">
            <section class="lib-section-5">
        <div class="fw section_collection_products">
            <div class="container">
                <div class="row">
                    <div style="margin: 20px;padding-left: 20px;padding-right: 20px;">
                        <ol class="breadcrumb breadcrumb-arrows" itemscope="" itemtype="http://schema.org/BreadcrumbList">
                            <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                                <a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp" target="_self" itemprop="item"><span itemprop="name">Trang chủ</span></a>
                                <meta itemprop="position" content="1">
                            </li>
                            <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                                <a href="http://localhost:8080/DoAnJava/nguoidung/giohang.jsp" target="_self" itemprop="item"><span itemprop="name">Giỏ hàng</span></a>
                                <meta itemprop="position" content="2">
                            </li>
                            <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                                <span itemprop="name">
                                   Thông tin đơn hàng
                                </span>
                                <meta itemprop="position" content="3">
                            </li>
                        </ol>
                       
                   <% if(gioHang.size()==0){ %>
                   <div id="layout-page-first" class="col-md-12">								
					<p class="text-center">
					Không có sản phẩm nào trong giỏ hàng!</p>
                   <p class="text-center"><a href="http://localhost:8080/DoAnJava/nguoidung/index.jsp">
					<i class="fa fa-reply"></i> Tiếp tục mua hàng</a>
					</p>
					</div>
                   <%}else{ %>
                        <form id="form"  action="http://localhost:8080/DoAnJava/ThanhToan"    method="post"  enctype="multidata/form-data">
                         <% for(int i = 0;i<gioHang.size();i++){ %>  
                            
                             <input hidden="true" name="maSanPham[]" value="<%out.print(gioHang.get(i).getMaSanPham()); %>">
                             <input hidden="true"  name="masp[]" value="<%out.print(gioHang.get(i).getMaSanPham()); %>">
                             <input hidden="true" name="sanpham[]" value="<%out.print(gioHang.get(i).getName()); %>">
                             <input hidden="true" name="soluong[]" value="<%out.print(gioHang.get(i).getSoLuongMua()); %>">
                             <%if(gioHang.get(i).getDiscount()==0){ %>
                             <input hidden="true" name="tongtien[]" value="<%out.print(gioHang.get(i).getPrice()*Integer.parseInt(gioHang.get(i).getSoLuongMua())); %>">
                             <%}else{ %>
                             <input hidden="true" name="tongtien[]" value="<%out.print((gioHang.get(i).getPrice()-gioHang.get(i).getPrice()*gioHang.get(i).getDiscount()/100)*Integer.parseInt(gioHang.get(i).getSoLuongMua())); %>">
                             <%} %>
							<%} %>
							
							
                            <div class="clearfix large_form ">
                                <label for="name" class="icon-field">
                   <i class="icon-login icon-envelope ">
                   </i>Tên của bạn:<%if(kh1!=null){ %>  <%=kh1.getName()%> <%} %> <%if(khfb!=null){ %><%=khfb.getName()%>  <%} %></label>  
                                <input type="hidden" name="name" required id="name"<%if(kh1 != null){ %>   value="<%=kh1.getName()%>" <%} %> <%if(khfb1 != null){ %>   value="<%=khfb1.getName()%>" <%} %> <%if(khgg1 != null){ %>   value="<%=khgg1.getName()%>" <%} %>placeholder="Nhập tên của bạn" class="text form-control">
                            </div>
                        
                            <div class="clearfix large_form ">
                                <label for="email" class="icon-field"><i class="icon-login icon-envelope "></i>Email của bạn</label>
                                <input type="text"  name="email" 
                                <%if(kh1 != null){ %>    value="<%=kh1.getEmail()%>" <%} %> 
                                <%if(khfb1 != null){ %>   value="<%=khfb1.getEmail()%>" <%} %>  
                                 <%if(khgg1 != null){ %>   value="<%=khgg1.getEmail()%>" <%} %> placeholder="Nhập email của bạn" class="text form-control">
                            </div>
                            
                            <div class="clearfix large_form ">
                                <label for="phone" class="icon-field"><i class="icon-login icon-envelope "></i>Số điện thoại</label>
                                <input type="text" name="sdt" id="phone" <%if(kh1 != null){ %>   value="<%=kh1.getSdt()%>" <%} %>  required placeholder="Nhập số điện thoại của bạn" class="text form-control">
                            </div>
                         
                                      
                            <div class="clearfix large_form ">
                                <label for="district"   class="icon-field"><i class="icon-login icon-envelope "></i>Tỉnh/Thành Phố:</label>
                                <select class="custom-select" id="province_id" name="province_id" required>
                                <option value="0">--Chọn Tỉnh--</option>
                       		 <%
                           
                        		Connection con11 = ConnectionToDB.getConnect();
                                Statement st = con11.createStatement();
                                ResultSet rs = st.executeQuery("select * from province");
                                while (rs.next()) {
                            %>
                             <option value="<%=rs.getInt(1)%>"><%=rs.getString("province_name")%></option>
                            <%
                                }
                            %>
                                </select>
                            </div>
                            
                            <div class="clearfix large_form ">
                                <label   id="district_id" class="icon-field"><i class="icon-login icon-envelope "></i>Quận/Huyện</label>
                               <select   hidden="true" class="custom-select" name="district"  >
                            <option value="">--Chọn Quận/Huyện--</option>
                       			 </select>
                        	</div>

                            <div class="clearfix large_form ">
                                <label  id="ward_name" for="city" class="icon-field"><i class="icon-login icon-envelope "></i>Xã/Phường</label>
                               <select   hidden="true" class="custom-select" name="ward"  >
                            <option value="">--Xã/Phường--</option>
                        </select>
                            </div>
                          
                            <div class="clearfix large_form ">
                                <label for="note" class="icon-field"><i class="icon-login icon-envelope "></i>Ghi Chu:(địa chỉ cụ thể)</label>
                                <textarea required  name="ghichu" rows="4" cols="50" placeholder="Nhập yêu cầu của bạn"></textarea>
                            </div>
                              <div class="clearfix action_account_custommer">
                                <div class="action_bottom button dark">
                        <input id="submit" class="btn btn-buy btn-transition add_to_cart button-hover-3" type="submit" value="Hoàn tất">
                                </div>
                                <br>
                                <div class="req_pass">
                                    <a  href="http://localhost:8080/DoAnJava/nguoidung/giohang.jsp"> &lt;&lt; Quay về giỏ hàng</a>
                                </div>
                            </div>
                        </form>
  	<%} %>
                    </div>

                </div>
            </div>
        </div>
    </section>
    </div>
    <!-- END ĐẶT HÀNG  -->

   
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
 <script type="text/javascript">
    $(document).ready(function() {
        $("#province_id").on("change", function() {
            var province_id = $("#province_id").val();
            
            	$.ajax({
            		url: "http://localhost:8080/DoAnJava/nguoidung/district.jsp",
            		data: {province_id:province_id},
            		method: "POST",
            		
            		success: function (data)
            		{
            			$("#district_id").html(data);
            		} 
            	});
        });
    });
</script>
 
 <script type="text/javascript">
    $(document).ready(function() {
        $("#submit").on("click", function() {
            var province_id = $("#province_id").val();
            var district_id = $("#district").val();
            var ward_name = $("#ward").val();
            if(province_id == "" || province_id == null)
            	{
            	$("#error").html("All fields are madatory. ");
            	} 
            else{
            	
            	$.ajax({
            		url: "",
            		method : "POST",
            		data: {province_id: province_id , district_id: district_id,ward_name: ward_name},
            		success: function (data)
            		{
            			
            		$("#form").trigger("click");
            		}
            	}); 
            }
            	
        });
    });
</script>

</body>
</html>