<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.model.ThanhVienModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" charset="UTF-8" >
<title>Insert title here</title>
</head>
<body>
<% 
	ConnectionToDB con = new ConnectionToDB();
	ResultSet rs = null;
	int tongtien = 0;
	String doituongTimKiem = request.getParameter("doituongTimKiem");
	String ngaybatdau = request.getParameter("ngaybatdau");
    String ngayketthuc = request.getParameter("ngayketthuc");
	if (ngaybatdau != null && ngayketthuc != null && doituongTimKiem != null){
%>
	<table>
	<%
	if (doituongTimKiem.equals("donhang")) {
		ResultSet donhang = con.selectData("select DISTINCT id from ct_donhang where ngaymua between '" + ngaybatdau 
				+ "' and '" + ngayketthuc + "' and trangthai = 0");
	
	%>
		<thead>
			<tr> 
			 	<th>MaDH</th>
			    <th>Số điện thoại</th> 
			    <th>Ngày mua</th> 
			    <th>Thành tiền</th>
			</tr>
		</thead>
	
	
  	<%
			while(donhang.next()){
				rs = con.selectData("select ThanhTien from ct_donhang where id = "+donhang.getInt("id"));
				int thanhtien = 0;
				while (rs.next()) {
					tongtien += rs.getInt("thanhtien");
					thanhtien +=rs.getInt("thanhtien");
				}
				rs = con.selectData("select top (1) * from ct_donhang where id = "+donhang.getInt("id"));
		
           		if (rs != null) 
           		while (rs.next() ){
                          			
	%>
					
					<tbody>
						<tr> 
							<th><%=rs.getString("id")%></th> 
							<th><%=rs.getString("sdt")%></th>   
							<th><%=rs.getString("ngaymua")%></th>
							<th><%=thanhtien%></th>
						 </tr>
					</tbody>
				
	<%
				}
            	
			}              	
			}else{
				String sql = "select sanpham.maSanPham, SoLuong=sum(soluong), ThanhTien=sum(thanhtien) "
						+ "from sanpham left join (select * from CT_DonHang where ngaymua between '" 
						+ ngaybatdau + "' and '"+ ngayketthuc+"') ct_dh" 
						+ " on sanpham.maSanPham = ct_dh.maSanPham"
						+ " group by sanpham.maSanPham"
						+ " order by ThanhTien desc";
				rs = con.selectData(sql);
			%>
			<thead>
				<tr> 
				 	<th>Mã Sản Phẩm</th>
				    <th>Tên Sản Phẩm</th> 
				    <th>Đã bán (cái)</th> 
				    <th>Doanh thu</th> 
				</tr>
			</thead>
	           	<%
	           		if (rs != null) 
	           		while (rs.next() ){
	           			tongtien += rs.getInt("thanhtien");
	           			String soluong =  rs.getString("soluong");
	           			if (soluong == null) soluong = "0";
	           			
	           			String thanhtien = rs.getString("thanhtien");
	           			if (thanhtien == null) thanhtien = "0";
	           			
	           			ResultSet ds_tensp = con.selectData("select name from sanpham where masanpham = " 
	           								+ rs.getString("maSanPham"));
	           			ds_tensp.next();
				%>
					
						<tbody>
						<tr> 
							<th><%=rs.getString("maSanPham")%></th> 
							<th><%=ds_tensp.getString("name") %></th>
							<th><%=soluong%></th>   
							<th><%=thanhtien%></th>
						 </tr>
					</tbody>
				
					<%}%>
				<%}%>
		<tfoot>
		<tr>
			<td>Tổng tiền: <%=tongtien %></td>
				</tr>
			</tfoot>	                               		
	                          
	</table>
<% }
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment; filename=Thong_ke_"+LocalDate.now()+".xls");
	
%>
</body>
</html>