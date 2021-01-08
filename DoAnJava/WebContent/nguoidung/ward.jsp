<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>

<body>

						<div class="clearfix large_form ">
                                <label  id="ward_name" for="city" class="icon-field"><i class="icon-login icon-envelope "></i>Xã/Phường</label>
                               <select required  class="custom-select" name="ward"  >
                            <option >--Xã/Phường--</option>
                            <%
                           		int district_id = Integer.parseInt(request.getParameter("district_id"));
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from ward where district_id="+ district_id +"  ");
                                while (rs.next()) {
                            %>
                             <option ><%=rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                            </div>
                            
					 
</body>
</html>