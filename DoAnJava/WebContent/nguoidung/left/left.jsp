<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.model.KhachHangModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%ConnectionToDB con1 = new ConnectionToDB();      %>
            	
	<%    
         ResultSet dm1 = con1.selectData("select * from danhmuc");   
      %>
	    		<!--  SILDE  -->
    <section class="lib-section-1">
    <div class="section_slider fw">
        <div class="home-slider owl-carousel owl-theme dots-enable owl-loaded owl-drag" data-lg-items="1" data-md-items="1" data-sm-items="1" data-xs-items="1" data-margin="0" data-dot="true" data-loop="true">
                            
                    <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-2376px, 0px, 0px); transition: all 0s ease 0s; width: 5940px;">
                        <!-- SILDE ĐẦU -->
                       <div class="owl-item cloned" style="width: 1188px;">
                    <div class="item image-item">
                    <a href="javascript:;" >
                        <img class="img-responsive" src="http://localhost:8080/DoAnJava/nguoidung/images/anh11.jpg" alt="slider-1">
                    </a>
                    </div>
                    </div>
                                      
                    
            </div>

            </div>

            <div class="owl-nav disabled"><span role="presentation" class="owl-prev"><i class="fa fa-angle-left"></i></span><span role="presentation" class="owl-next"><i class="fa fa-angle-right"></i></span></div><div class="owl-dots disabled"><button role="button" class="owl-dot active"><span></span></button></div>
        </div>
    </div>
    </section>
     <!-- END SILDE  -->
    <section class="mega-menu gearvn-header-menu">
   
    <!-- LEFT DANH MỤC SẢN PHẨM -->
    <div class="sidebar-item sidebar-menu sidebar-collection-menu">
        <div class="module-header">
            <h2 class="title-head module-title sidebar-title">
                <a href="javascript:;">
                    <span>Danh mục sản phẩm</span>
                </a>
            </h2>
        </div>
        <div class="sidebar-menu-content module-content">
            <div class="sidebar-linklists">
                 <ul> <%while(dm1.next())
            	
            			{%>
            			<%  if(dm1.getInt(3)==0) 
                            {%>
                        <li class="sidebar-menu-list collection-sidebar-menu">      
                             <a class="nav-link"  href="http://localhost:8080/DoAnJava/Danhmuc?id=<%=dm1.getInt(1) %>" title="<%=dm1.getString(2) %>">
                               <b> <span><%=dm1.getString(2) %></span> </b>
                            </a>
                            
                        </li>
                        <%} %>
                       <%} %> 
                </ul>
                         
           </div>
        </div>
    </div>

    </section>

    <!-- END LEFT DANH MỤC SẢN PHẨM -->


    <!-- DƯỚI SILDE  -->
    <section class="lib-section-3">

    <div class="flex-container container">
        <div class="column-wrap active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/giaohangtoanquoc.png" alt="FREE_DELIVERY">
                </div>
                <div class="inner-content">
                    <h5><span><strong>GIAO HÀNG TOÀN QUỐC</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/baohanhcucnhanh.png" alt="FREE_CHANGE_RETURN">
                </div>
                <div class="inner-content">
                    <h5><span><strong>BẢO HÀNH CỰC NHANH</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/luoncouudai.png" alt="hotline">
                </div>
                <div class="inner-content">
                    <h5><span><strong>LUÔN CÓ ƯU ĐÃI</strong></span></h5>
                </div>
            </div>
        </div>
        <div class="column-wrap  active-ani">
            <div class="support-inner">
                <div class="inner-icon">
                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/hotrohetminh.png" alt="SUPPORT">
                </div>
                <div class="inner-content">
                    <h5><span><strong>HỖ TRỢ HẾT MÌNH</strong></span></h5>
                </div>
            </div>
        </div>
    </div>
</section>
<style>
    @media (max-width: 767px) {
        .lib-section-3 .flex-container .column-wrap {
             width: 25% !important;
        }
    }
</style>
    <!--END DƯỚI SILDE  -->