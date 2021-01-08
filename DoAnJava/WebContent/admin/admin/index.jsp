<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../decorators/header.jsp" %>
</head>
<body>
<%@include file="../header/header.jsp" %>
 <form  method="post"  id="form" enctype="multidata/form-data">
   <div class="form-group row">
                        <label  for="" >Tỉnh/ThànhPhố</label>
                        <select  id="province_id">
                            <option disabled="" selected="" value="">--Chọn Tỉnh--</option>
                             <%
                           
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from province");
                                while (rs.next()) {
                            %>
                             <option value="<%=rs.getString("id")%>"><%=rs.getString("province_name")%></option>
                            <%
                                }
                            %>
                            </select>
                        <label id="district_id" for="">Quận/Huyện</label>
                        <select name="district" >
                            <option value="">--Chọn Quận/Huyện--</option>
                        </select>
                        
                        <label id="ward_name" for="">Xã/Phường</label>
                        <select name="ward"  >
                            <option value="">--Xã/Phường--</option>  
                        </select>
                    </div>
                      

                    
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" id="submit" class="btn btn-primary">Thêm mới</button>

                     
                    </div>
                  </div>
 </form>
   <script type="text/javascript">
    $(document).ready(function() {
        $("#province_id").on("change", function() {
            var province_id = $("#province_id").val();
            	$.ajax({
            		url: "TEST",
            		data: {province_id: province_id},
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
            	$("#error").html("");
            	$.ajax({
            		url: "TESTCONTROLLER",
            		method : "POST",
            		data: {province_id:province_id , district_id:district_id,ward_name:ward_name},
            		success: function (data)
            		{
            			$("#success").html(data);
            			$("#form").trigger("reset");
            		}
            	}); 
            }
            	
        });
    });
</script>
</body>

</html>
