	<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Them");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here    </title>
                                                                         
</head>
<body>


					 <label  for="" >Quận/Huyện</label>
                        <select name="district"  id="district">
                            <option  value="">--Chọn Quận/Huyện--</option>
                             <%
                         	int province_id = Integer.parseInt(request.getParameter("province_id"));
                           	
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from district where province_id="+ province_id +"  ");
                                while (rs.next()) {
                            %>
                             <option value="<%=rs.getString("id")%>"><%=rs.getString("district")%></option>
                            <%
                                }
                            %>
                            </select>
                            	  <script type="text/javascript">
    $(document).ready(function() {
        $("#district").on("change", function() {
            var district = $("#district").val();
            	$.ajax({
            		url: "ward.jsp",
            		method: "POST",
            		data: {district_id: district_id},
            		
            		success: function (data)
            		{
            			$("#ward_name").html(data);
            		}
            	});
        });
    });
</script>
</body>
</html>
