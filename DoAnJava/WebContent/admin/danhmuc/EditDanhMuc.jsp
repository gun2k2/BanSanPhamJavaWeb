<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Sua");
    	ServletContext contextID = getServletContext(); // ngoài gửi về chức năng cần gửi kèm cái id
    	contextID.setAttribute("id", request.getParameter("id"));
    %>
<!DOCTYPE html>

<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<title>Chỉnh sửa danh mục</title>
<%@include file="../decorators/header.jsp" %>
<style>
	.card-header:hover{
		color: black;
		background-color: lime;
	}

</style>
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
                            <div  class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Chỉnh sửa dữ liệu 
                            </div> 
                                  <% String id = request.getParameter("id");
  		ResultSet rs = new ConnectionToDB().selectData("select * from DanhMuc where id='"+id+"'"); // lấy dữ liệu từ database lên
  		while(rs.next()){
  		%>
            <form  action="http://localhost:8080/DoAnJava/DanhMucController?chucNang=Sua" method="post"  enctype="multidata/form-data">
                    
                 


                  <div class="form-group row">
                    <label for="param_username" class="col-sm-2 col-form-label">Tên danh mục</label>
                    <div class="col-sm-5">
                      <input type="text" name="name" value="<%out.print(rs.getString(2)); %>"  class="form-control" id="tenNhanVien"  required>
                    </div>
                  </div> 

 						<% ConnectionToDB con = new ConnectionToDB();
                    		ResultSet dm = con.selectData("Select * from danhmuc");
                    		%>
                    		<%
                    		ResultSet dm1 = con.selectData("Select * from danhmuc where id = " + rs.getInt("parent_id"));
                    		%>
                  <div class="form-group row">
                    <label for="param_gioitinh" class="col-sm-2 col-form-label" >Danh mục</label>
                    <select  id="param_id" name="parent_id">
                    	<%if(rs.getInt(3)==0){ %>
                    	  <option value="0">Là danh mục cha</option>
                    	  <%}else{ 
                    		  dm1.next();%>
                       <option value="<%=dm1.getInt(1)%>"><%=dm1.getString(2) %></option>
                       		<%} %> 	
                        	<%while(dm.next()) {
                       if(dm.getInt(3)==0){%>
             <option value="<%=dm.getInt(1)%>"><%=dm.getString(2) %></option>
								<% }} %>   							              
                    </select>
                  </div>

                   
                 
              
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn_red danger">Chinh Sua</button>

                      <a href=""><i class="fa fa-eye"></i>Làm mới</a>
                    </div>
                  </div>
                </form>
                <!-- end form --><%} %>
                                        </div>
                    </div>
                </main>
	 	
	 	
	 	
   	<%@ include file="../footer/footer.jsp" %>
	</div>
	</div>
	<%@ include file="../decorators/footer.jsp" %>

</body>
</html>