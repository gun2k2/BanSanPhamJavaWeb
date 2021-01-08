	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Sua");
    	ServletContext contextID = getServletContext(); // ngoài gửi về chức năng cần gửi kèm cái id
    	contextID.setAttribute("maSanPham", request.getParameter("maSanPham"));
    %>
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Chỉnh sửa sản phẩm</title>
<%@include file="../decorators/header.jsp" %>
</head>
<body>
	<%@include file="../header/header.jsp" %>
	 <div style="color: red; font-weight: bold; text-align: center;">   </div>
           <!--   -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="http://localhost:8080/DoAnJava/admin/index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Thêm mới</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                Đây là danh sách quản lý quản trị viên, nếu có thắc mắc gì,vui lòng truy cập
                                <a target="_blank" href="https://www.facebook.com/phuongnenenha">Facebook của Admin</a>
                                .
                            </div>
                        </div>
                       <div class="wrapper">
      
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Chỉnh sửa dữ liệu 
                            </div>
                            
         <% int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
  		ResultSet rs = new ConnectionToDB().selectData("select * from SanPham where maSanPham='"+maSanPham+"'"); // lấy dữ liệu từ database lên
  		while(rs.next()){
  		%>
           <form  method="post" action="http://localhost:8080/DoAnJava/SanPhamController?chucNang=Sua" enctype="multipart/form-data">
	                 		<div class="widget">
	                 			<div class="tab_container">
	                 			
	                        		<div class="form-group row">
	                   				<label for="param_username" class="col-sm-2 col-form-label">Tên sản phẩm</label>
	                  					<div class="col-sm-5">
	                  				
	          								<input value="<%out.print(rs.getString(2)); %>" type="text" autocheck="true" name="name"  class="form-control" id="tenNhanVien"  placeholder="Name..." required>
	                  					</div>
	                 				</div> 
	                 				
	
			                    <div class="form-group row">
			                    
	                        		<label class="col-sm-2 col-form-label">Hình ảnh:<span class="req">*</span></label>
	                        		<img height="100" src="http://localhost:8080/DoAnJava/nguoidung/images/<%=rs.getString(6)%>">
	                        		<%=rs.getString(6)%>
			                        <div class="col-sm-5"> 
			                                                 
			                            <input required value="<%=rs.getString(6)%>" type="file" name="image_link" id="image" size="25">
			                        </div>
			                        
			                        
			                    </div>
	
			             
	
			                    <!-- Price -->
			                    <div class="form-group row">
			                        <label for="param_price" class="col-sm-2 col-form-label">
			                            Giá :
			                            <span class="req">*</span>
			                        </label>
			                        <div class="col-sm-5">
			                            <span class="oneTwo">
			                                <input value="<%out.print(rs.getInt(3)); %>" type="number" min="1"_autocheck="true" class="format_number" id="param_price" style="width:100px" name="price" required>
			                                <img  src="" style="margin-bottom:-8px" class="tipS" original-title="Giá bán sử dụng để giao dịch">
			                            </span>
			                            <span class="autocheck" name="price_autocheck"></span>
			                        </div>
			                    </div>
		
			                    <!-- Price -->
			                    <div class="form-group row">
			                        <label for="param_discount" class="col-sm-2 col-form-label">
			                            Giảm giá (VND) 
			                            <span></span>:
			                        </label>
			                        <div class="col-sm-5">
			                            <span>
			                                <input required value="<%out.print(rs.getInt(4)); %>" type="number" min=0 max=100 class="format_number" id="param_discount" style="width:100px" name="discount" >
			                                <img src="" style="margin-bottom:-8px" class="tipS" original-title="Số tiền giảm giảm giá">
			                            </span>
			                            <span class="autocheck" name="discount_autocheck"></span>
			                        </div>
			                    </div>
		
			                    <div class="form-group row">
			                        <label for="param_price" class="col-sm-2 col-form-label">
			                            Hãng sản xuất :
			                            <span class="req">*</span>
			                        </label>
			                        <div class="col-sm-5">
			                            <span class="oneTwo">
			                                <input value="<%out.print(rs.getString(9)); %>" type="text" _autocheck="true" class="format_number" id="param_price" style="width:100px" name="hangsx" required>
			                                <img src="" style="margin-bottom:-8px" class="tipS" original-title="hãng sản phẩm">
			                            </span>
			                        </div>
			                    </div>
	
			                    <div class="form-group row">
			                        <label for="param_price" class="col-sm-2 col-form-label">
			                            Bảo hành :
			                            <span class="req">*</span>
			                        </label>
			                        <div class="col-sm-5">
			                            <span class="oneTwo">
			                                <input value="<%out.print(rs.getInt(10)); %>" type="number"  min=0 id="param_price" style="width:100px" name="baohanh" required>
			                                <img src="" style="margin-bottom:-8px" class="tipS" original-title="thời gian bảo hành sản phẩm">
			                            </span>
			                        </div>
			                    </div>
			                    <%
			                    ConnectionToDB con = new ConnectionToDB();
                               ResultSet rs1 = con.selectData("select * from danhmuc where id = "+rs.getInt("danhmuc"));  
                               ResultSet rs2 = con.selectData("select * from danhmuc"); 
                                %>
                                
								<div class="form-group row">
									<label for="param_gioitinh" class="col-sm-2 col-form-label" >Lực chọn danh mục</label>
										<select autocheck="true" id="param_id" name="danhmuc">
										
											
											<%while(rs1.next()){%>
			                                <option value="<%=rs1.getInt(1) %>"><%=rs1.getString(2) %></option>
			                                <%} %>
			                                <%while(rs2.next()){%>
			                                <option value="<%=rs2.getInt(1) %>"><%=rs2.getString(2) %></option>
			                                  <%} %>
										</select>
		                  		</div>
		                  		
						
		
		
			                    <div class="form-group row">
			                        <label for="param_sale" class="col-sm-2 col-form-label">Nội dung:</label>
			                        <div class="col-sm-1">
			                            <spa class="oneTwo"><textarea   cols="4" rows="4" id="param_gifts" name="content1"   >  <%=rs.getString(13) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content2">  <%=rs.getString(14)%></textarea></span>			                       
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content3">  <%=rs.getString(15) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content4">  <%=rs.getString(16) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content5">  <%=rs.getString(17) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content6">  <%=rs.getString(18) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content7">  <%=rs.getString(19) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content8">  <%=rs.getString(20) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content9">  <%=rs.getString(21) %></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content10">  <%=rs.getString(22) %></textarea></span>		                           
			                        </div>
			                    </div>                           
	               			</div><!-- End tab_container-->
	                   	</div>
	                                        
	
							<div class="clear"></div>
			    
							<div class="form-group row">
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">Chinh Sua</button>							
									
								</div>
							</div>
						</form> <!-- Endform -->
						<%} %>
                 </div>
                     
                    </div>
                </div>
                </main>
                <%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
	<%@ include file="../decorators/footer.jsp" %>

</body>
</html>