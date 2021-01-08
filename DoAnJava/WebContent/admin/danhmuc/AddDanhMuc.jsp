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
		<title>Thêm mới danh mục</title>
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
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Thêm mới dữ liệu 
                            </div>
                     <form  method="post" action="http://localhost:8080/DoAnJava/DanhMucController?chucNang=Them" enctype="multidata/form-data">

                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Tên danh mục</label>
                    <div class="col-sm-5">
                      <input type="text" name="name" value="" class="form-control" id="tenNhanVien"  placeholder="Name..." required>
                    </div>
                  </div> 
                   
 						<% ConnectionToDB con = new ConnectionToDB();
                    		ResultSet rs = con.selectData("Select * from danhmuc");
                    		%>
                  <div class="form-group row">
                    <label for="param_gioitinh" class="col-sm-2 col-form-label" >Danh mục cha</label>
                    
                    <select autocheck="true" id="param_id" name="parent_id">
                        <option value="0">Là danh mục cha</option>
                       	<%while(rs.next()) {
                       if(rs.getInt(3)==0){%>
             <option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
								<% }} %>   
                       </select>
                  </div>

     
              
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary">Thêm mới</button>

                      <a title="Trở về" class="tipS"  href="http://localhost/it/admin/quanlydanhmuc_controller">
   
   </a>
                    </div>
                  </div>
                </form>
                <!-- end form -->
                        </div>
                    </div>
                </main>

	<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
	<%@ include file="../decorators/footer.jsp" %>
</body>
</html>