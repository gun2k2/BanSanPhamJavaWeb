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

<body>
					 <label id="ward_name" >Xã/Phường</label>
                        <select name="ward" >
                            <option  value="">--Chọn Xã/Phường--</option>
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
</body>
</html>