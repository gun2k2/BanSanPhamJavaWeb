 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <div class="msg-admin-main">
    <div id="msg-admin" class="msg-admin">
        <h4 id="title-admin" class="title-admin">I'm P'tit Duo!</h4>
    </div>
    <div id="screen-msg" class="screen-msg screen-msg-none">
        <div class="header-screen-msg">
            <span class="text-light" id="tags-title"><b>Bot chat </b></span>
            <span class="text-light" title="Đónng cửa sổ chat" id="close-msg-admin"><h1>&times;</h1></span>
        </div>
        <div id="body-screen-msg" class="body-screen-msg">
            <div class="admin-feed">
                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                <span></span>
                Chào mừng đã tới với <b class="text-danger">P'tit Duo</b>.
                Tôi là Bot-D18CQAT01, tôi có thể giúp bạn tìm hiểu về:
                Sản phẩm, tin tức, tình yêu, người sáng lập và các ngôn ngữ xây dựng nên <b class="text-danger">P'tit Duo</b>,...
                <small id="time__now"></small>
            </div>
        </div>
        <div class="foot-screen-msg">
            <input id="enter-msg" type="text" placeholder="Nhập nội dung..." autocomplete = "off">
           <!--   <div  class="laugh">
                <span ><i class="fas fa-paperclip"></i><span>Tệp đính kèm</span></span>
                <span><i class="far fa-laugh"></i><span>Biểu cảm</span></span>
                -->
            </div>
        </div>
    </div>
  <!--  FOOTER -->
    <footer class="footer">

    <div class="container"><!--  FOOTER TRÁI -->
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 footer-info">
                <div class="footer-widget">
                    <h4 class="footer-title">
                        <span>phuongphan.vn</span>
                    </h4>
                    <div class="footer-details">
                        <div class="footer-detail rte">
                            Phương Phan cung cấp tất cả các sản phẩm công nghệ tin học 
Pc Gaming - Phụ Kiện Trang Trí - Laptop - Bàn Ghế.
                        </div>
                        <div class="footer-detail rte">
                            <label class="contact-info-title">
                                Địa chỉ :
                            </label>
                            <div class="contact-info">
                                35/14 đường số 10, phường Linh Trung, Quận Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam
                            </div>
                        </div>
                        <div class="footer-detail">
                            <label class="contact-info-title">
                                Điện thoại :
                            </label>
                            <div class="contact-info">
                                <a href="tel: 0799854546"> 0799854546</a>
                            </div>
                        </div>
                        <div class="footer-detail">
                            <label class="contact-info-title">
                                Email :
                            </label>
                            <div class="contact-info">
                                <a target="_blank" href=""> <span data-cfemail="contact.gaming@gmail.com">contact.gaming@gmail.com</span></a>
                            </div>
                        </div>
                        <div class="footer-detail">
                            <a href="">
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/brand.png" >
                            </a>
                        </div>
                    </div>
                </div>
            </div><!-- END FOOTER TRÁI -->
            <!--  FOOTER MAIN -->
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                <div class="row">
                    <div class="top-footer">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 foo-col">
                            <div class="footer-widget">
                                <h4 class="footer-title">
                                    <span>Hỗ trợ</span>
                                </h4>
                                <ul class="list-menu">
                                    <li><a href="/" title="Giới thiệu">Giới
                                            thiệu</a></li>
                                    <li><a href="/"
                                           title="Chính sách đổi trả">Chính sách
                                            đổi trả</a></li>
                                    <li><a href="/"
                                           title="Chính sách bảo mật">Chính sách
                                            bảo mật</a></li>
                                    <li><a href="/"
                                           title="Điều khoản dịch vụ">Điều khoản
                                            dịch vụ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 foo-col">
                            <div class="footer-widget">
                                <h4 class="footer-title">
                                    <span>Hướng dẫn</span>
                                </h4>
                                <ul class="list-menu">
                                    <li><a href="/" title="Tìm kiếm">Tìm kiếm</a></li>
                                    <li><a href="/" title="Giới thiệu">Giới thiệu</a></li>
                                    <li><a href="/" title="Chính sách đổi trả">Chính sách
                                            đổi trả</a></li>
                                    <li><a href="/" title="Chính sách bảo mật">Chính sách
                                            bảo mật</a></li>
                                    <li><a href="/" title="Điều khoản dịch vụ">Điều khoản
                                            dịch vụ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 foo-col">
                            <div class="footer-widget">
                                <h4 class="footer-title">
                                    <span>Chính sách</span>
                                </h4>
                                <ul class="list-menu">
                                    <li><a href="/" title="Tìm kiếm">Tìm kiếm</a></li>
                                    <li><a href="/" title="Giới thiệu">Giới thiệu</a></li>
                                    <li><a href="/" title="Chính sách đổi trả">Chính sách
                                            đổi trả</a></li>
                                    <li><a href="/" title="Chính sách bảo mật">Chính sách
                                            bảo mật</a></li>
                                    <li><a href="/" title="Điều khoản dịch vụ">Điều khoản
                                            dịch vụ</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="site-footer">
                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 payment_methods">
                            <div class="footer-widget">
                                <h4 class="footer-title">
                                    <span>Chấp nhận thanh toán</span>
                                </h4>
                                <div class="fw">
                                    <div class="item">
                                        <img class="img-responsive" src=""
                                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/momo.png"
                                             alt="method-title-visa"
                                             title="Thanh toán qua VISA"/>
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive" src=""
                                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/visa.png"
                                             alt="method-title-master-card" title="Thanh toán qua MASTER CARD"/>
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive" src=""
                                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/paypay.png"
                                             alt="method-title-paypal" title="Thanh toán qua PAYPAL"/>
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive" src=""
                                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/jcp.png"
                                             alt="method-title-jcb"
                                             title="Thanh toán qua JCB"/>
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive" src=""
                                             data-lazyload="http://localhost:8080/DoAnJava/nguoidung/images/bitcoin.png"
                                             alt="method-title-bitcoin" title="Thanh toán qua BITCOIN"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 customer-care">
                            <div class="footer-widget">
                                <h4 class="footer-title">
                                    <span>Chăm sóc khách hàng</span>
                                </h4>
                                <div class="customer-care-info">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1"
                                         x="0px" y="0px" viewBox="0 0 32.667 32.667"
                                         style="enable-background:new 0 0 32.667 32.667;" xml:space="preserve">
                                                    <g>
                                                        <path d="M16.333,0C7.327,0,0,7.327,0,16.334c0,9.006,7.326,16.333,16.333,16.333c0.557,0,1.007-0.451,1.007-1.006   c0-0.556-0.45-1.007-1.007-1.007c-7.896,0-14.318-6.424-14.318-14.319c0-7.896,6.422-14.32,14.318-14.32   c7.896,0,14.317,6.424,14.317,14.32c0,3.299-1.756,6.571-4.269,7.955c-0.913,0.502-1.903,0.751-2.959,0.761   c0.634-0.378,1.183-0.887,1.591-1.531c0.08-0.121,0.186-0.226,0.238-0.359c0.328-0.789,0.357-1.684,0.555-2.516   c0.243-1.066-4.658-3.143-5.084-1.815c-0.154,0.493-0.39,2.048-0.699,2.458c-0.275,0.365-0.953,0.193-1.377-0.168   c-1.117-0.952-2.364-2.352-3.458-3.457l0.002-0.001c-0.028-0.029-0.062-0.062-0.092-0.091c-0.031-0.03-0.062-0.062-0.093-0.092l0,0   c-1.106-1.093-2.506-2.338-3.457-3.458c-0.36-0.424-0.534-1.1-0.168-1.376c0.41-0.31,1.966-0.543,2.458-0.698   c1.326-0.425-0.75-5.329-1.816-5.084c-0.832,0.195-1.727,0.225-2.516,0.552c-0.134,0.056-0.238,0.16-0.359,0.24   c-2.799,1.775-3.16,6.083-0.428,9.292c1.041,1.228,2.127,2.416,3.245,3.576l-0.006,0.004c0.031,0.031,0.063,0.06,0.095,0.09   c0.03,0.031,0.059,0.062,0.088,0.095l0.006-0.006c1.16,1.118,2.535,2.764,4.769,4.255c4.703,3.141,8.312,2.264,10.438,1.098   c3.67-2.021,5.312-6.338,5.312-9.719C32.667,7.327,25.339,0,16.333,0z"
                                                              fill="#FFFFFF"/>
                                                    </g>
                                                </svg>
                                    <div class="customer-care-detail">
                                        <a href="tel: 0799854546"> 0799854546</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="back-to-top"><i class="fa fa-arrow-circle-up"></i></div>
</footer>
