<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
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
		<title>Thêm mới sản phẩm</title>
<%@include file="../decorators/header.jsp" %>
</head>

<body>
<%@include file="../header/header.jsp" %>	
<div style="color: red; font-weight: bold; text-align: center;">   </div>
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
                                Thêm mới dữ liệu 
                            </div>
						<form  method="post" action="http://localhost:8080/DoAnJava/SanPhamController?chucNang=Them" enctype="multipart/form-data">
	                 		<div class="widget">
	                 			<div class="tab_container">
	                 			
	                        		<div class="form-group row">
	                   				<label for="param_username" class="col-sm-2 col-form-label">Tên sản phẩm</label>
	                  					<div class="col-sm-5">
	          								<input type="text" autocheck="true" name="name"  class="form-control" id="tenNhanVien"  placeholder="Name..." required>
	                  					</div>
	                 				</div> 
	                 				
	
			                    <div class="form-group row">
	                        		<label class="col-sm-2 col-form-label">Hình ảnh:<span class="req">*</span></label>
			                        <div class="col-sm-5">
			                            <input  required type="file" name="image_link" id="image" size="25">
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
			                                <input type="number" min="1"_autocheck="true" class="format_number" id="param_price" style="width:100px" name="price" required>
			                                <img src="" style="margin-bottom:-8px" class="tipS" original-title="Giá bán sử dụng để giao dịch">
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
			                                <input required type="number" min=0 max=100 class="format_number" id="param_discount" style="width:100px" name="discount" >
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
			                                <input type="text" _autocheck="true" class="format_number" id="param_price" style="width:100px" name="hangsx" required>
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
			                                <input type="number" min=0 id="param_price" style="width:100px" name="baohanh" required>
			                                <img src="" style="margin-bottom:-8px" class="tipS" original-title="thời gian bảo hành sản phẩm">
			                            </span>
			                        </div>
			                    </div>
			                    <% ConnectionToDB con = new ConnectionToDB();
                                
                               ResultSet rs = con.selectData("select * from danhmuc");        
                                %>
                                
								<div class="form-group row">
									<label for="param_gioitinh" class="col-sm-2 col-form-label" >Lực chọn danh mục</label>
										<select autocheck="true" id="param_id" name="danhmuc">
										<%while(rs.next()){%>
			                                <option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
			                                <%} %>
										</select>
		                  		</div>
		                  		
						
		
		
			                    <div class="form-group row">
			                        <label for="param_sale" class="col-sm-2 col-form-label">Nội dung:</label>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content1"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content2"></textarea></span>			                       
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content3"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content4"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content5"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content6"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content7"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content8"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content9"></textarea></span>		                           
			                        </div>
			                        <div class="col-sm-1">
			                            <span class="oneTwo"><textarea cols="4" rows="4" id="param_gifts" name="content10"></textarea></span>		                           
			                        </div>
			                    </div>                           
	               			</div><!-- End tab_container-->
	                   	</div>
	                                        
	
							<div class="clear"></div>
							
							<!--********* Buttonnn -->      
							<div class="form-group row">
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">Thêm mới</button>							
									
								</div>
							</div>
						</form> <!-- Endform -->
				</div>
			</div>
		</main>
	<%@ include file="../footer/footer.jsp" %>
	</div>
	
</div>

	<%@ include file="../decorators/footer.jsp" %>
</body>
</html>