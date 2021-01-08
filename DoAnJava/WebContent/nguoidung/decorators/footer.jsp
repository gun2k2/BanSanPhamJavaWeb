<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="com.model.ConnectionToDB"%>
<%@page import="java.sql.PreparedStatement"%>
<!-- Bootstrap core JavaScript -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/email-decode.min.js"></script>
	<script src="js/option-selectors.js"></script>
	<script src="js/plugin.js"></script>
	<script src="js/jquery.mmenu.all.js"></script>
	<script src="js/cs.script.js"></script>
	<script src="js/main.js"></script>
	<script src="js/HTT-team.js"></script>
	<script>
    var month = new Array();
    month[0] = "1";
    month[1] = "2";
    month[2] = "3";
    month[3] = "4";
    month[4] = "5";
    month[5] = "6"; 
    month[6] = "7";
    month[7] = "8";
    month[8] = "9";
    month[9] = "10";
    month[10] = "11";
    month[11] = "12";
  
    var d = new Date();
    var n = month[d.getMonth()];
    var screenMsg = document.getElementById('screen-msg');
    var bodyMsg = document.getElementById('body-screen-msg');
    var enterMsg = document.getElementById('enter-msg');
    var Admin = document.getElementById('msg-admin');
    var closeScreen = document.getElementById('close-msg-admin');
    var Datenew = new Date(); 
    document.getElementById('time__now').innerHTML = Datenew.getHours() + ":" + Datenew.getMinutes();
    enterMsg.addEventListener ("keyup", function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            const Daten = new Date();
            const timenow = Daten.getHours() + ":" + Daten.getMinutes();
            function newMsg(){
                const main = document.getElementById('body-screen-msg');
                if (main) {
                    const newMsg = document.createElement('div');
                        newMsg.classList.add('user-chat');
                        newMsg.innerHTML = `
                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/userchat.png" alt="User">
                        <span></span> <p>`+enterMsg.value +` </p>
                        <small>`+timenow+`</small>
                        `;
                    main.appendChild(newMsg);
                }
            }
            newMsg();
            
                const mainadmin = document.getElementById('body-screen-msg');
                
                if (enterMsg.value.includes('')){
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <b class="text-danger"> P'tit Duo</b> xin chào các bạn !
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
                
                
                if (enterMsg.value.includes('sản phẩm') || enterMsg.value.includes('Sản phẩm') || enterMsg.value.includes('Sản Phẩm')|| enterMsg.value.includes('san pham')){
                    function newMsg() {
                    	
                        if (mainadmin) { 
                        	
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `; 
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <% ConnectionToDB con4 = new ConnectionToDB();
                                    ResultSet dm4 = con4.selectData("select * from danhmuc"); 
                                   %>
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    Hiện tại trên <b class="text-danger">P'tit Duo</b>
                                    có <b>rất nhiều sản phẩm đang được sale với giá sốc</b> vào phần<%while(dm4.next()){ %> <a href="http://localhost:8080/DoAnJava/Danhmuc?id=<%=dm4.getInt(1)%>"> <%=dm4.getString(2) %></a> <% }%> để bắt đầu mua sắm nào.
                                    <small>`+timenow+`</small>
                                  ` ;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
				
                
            
                
                if (enterMsg.value.includes('tình yêu') ||enterMsg.value.includes('tinh yeu')  || enterMsg.value.includes('Tinh yeu') || enterMsg.value.includes('Tình yêu')){
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <b class="text-danger">"Ta về ta tắm ao ta, dù trong dù đục ao nhà vẫn hơn"</b>!
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }

                if (enterMsg.value.includes('tin tức') || enterMsg.value.includes('Tin tức') || enterMsg.value.includes('Tin Tức')|| enterMsg.value.includes('tin tuc')){
                    function newMsg() {
                    	
                        if (mainadmin) { 
                        	
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `; 
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <% 
                                    ResultSet news = con4.selectData("select * from tintuc"); 
                                   %>
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    Hiện tại trên <b class="text-danger">P'tit Duo</b>
                                    có <b>rất nhiều tin tức nóng hỏi những ngày qua</b> vào phần<%while(news.next()){ %> <a href="http://localhost:8080/DoAnJava/CTtintuc?id=<%=news.getInt(1)%>"> <%=news.getString(2) %></a> <% }%> để hóng hớt cùng  <b class="text-danger">P'tit Duo</b>
                                    <small>`+timenow+`</small>
                                  ` ;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
                
                if (enterMsg.value.includes('Ptit Duo') || enterMsg.value.includes('ptit duo') ){
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <b class="text-danger">P'tit Duo</b> viết nên bằng HTML-CSS, Javascript - phía front-end và 
                                    với JAVA - phía back-end.
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                } 

                if (enterMsg.value.includes('JAVA') || enterMsg.value.includes('java')){
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <b>JAVA</b> là một ngôn ngữ lập trình hướng đối tượng và dựa trên các lớp. Khác với phần lớn ngôn ngữ lập trình thông thường, thay vì biên dịch mã nguồn thành mã máy hoặc thông dịch mã nguồn khi chạy, Java được thiết kế để biên dịch mã nguồn thành bytecode, bytecode sau đó sẽ được môi trường thực thi chạy.
                                    Wikipedia nói thế đấy <i class="bg-warning rounded-circle far fa-grin-beam"></i>
                                    tham gia lớp <a href="#">D18CQAT01</a> để học ngay nào!
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }

                if (enterMsg.value.includes('ngày sinh')&&enterMsg.value.includes('bạn')||enterMsg.value.includes('sinh nhật') ||enterMsg.value.includes('ngay sinh') ||enterMsg.value.includes('sinh nhat')){
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <b>P'tit Duo</b> ra đời vào giữa tháng 11 năm 2020 với những người đồng sáng lập
                                    <b class="text-danger">Phương Phan, Trần Khang, Ngọc Tịnh</b>  
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                } 

                if (enterMsg.value.includes('người tạo ra ptit duo')||enterMsg.value.includes('ai')&&enterMsg.value.includes('tạo ra bạn')|| enterMsg.value.includes('nguoi sang lap') || enterMsg.value.includes('BOSS')) {
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    Người tạo ra tôi cũng như <b class="text-danger">P'tit Duo</b> là Phương Phan!
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }

                if (enterMsg.value.includes('mấy giờ')||enterMsg.value==='time') {
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    Bây giờ là `+Daten.getHours()+` giờ `+ Daten.getMinutes()+` phút.
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }

                if (enterMsg.value.includes('hôm nay')&&enterMsg.value.includes('ngày')||enterMsg.value==='date') {
                    function newMsg() {
                        if (mainadmin) {
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                setTimeout(()=>{
                                    newMsg2.innerHTML = `
                                    <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    Hôm nay là ngày `+ Daten.getDate() +` tháng `+ n +` năm `+ Daten.getFullYear() +`.
                                    <small>`+timenow+`</small>
                                    `;
                                }, 1500)
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }

                
                if (enterMsg.value.includes('Vu la ai ?')||enterMsg.value.includes('Vũ') || enterMsg.value.includes('Huỳnh Đình Vũ ?') || enterMsg.value.includes('thang em ?')||enterMsg.value.includes('Vu?') ) {
                    function newMsg() {
                        if (mainadmin) {
                            var randomAnw =  Math.round(Math.random()*2);
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                if (randomAnw == 0){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Người con của biển Phan Thiết, sinh ra trong gia đình khá giả, vì thế <a target="blank" href="https://www.facebook.com/profile.php?id=100004169627134">Vũ</a> đã được gia đình nuông chiều từ nhỏ...!
                                        <small>`+timenow+`</small>
                                        `; 
                                    }, 1500)
                                }
                                else if (randomAnw == 1){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Tệ lắm, yêu một lúc 2 người !!!
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                else {
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
             Đẹp trai, học giỏi, từng đi thi đấu CTF giải quốc tế nhưng <a target="blank" href="https://www.facebook.com/profile.php?id=100004169627134">Vũ</a> vẫn không có được Tâm.
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
          
                if (enterMsg.value.includes('Bac la ai ?')||enterMsg.value.includes('Bắc') || enterMsg.value.includes('Lê Tú Bắc?') || enterMsg.value.includes('bac ?')||enterMsg.value.includes('Bac?') ) {
                    function newMsg() {
                        if (mainadmin) {
                            var randomAnw =  Math.round(Math.random()*2);
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                if (randomAnw == 0){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
             Đại gia phố Vinh, dù sinh ra ở vạch đích nhưng <a target="blank" href="https://www.facebook.com/Letubac99/">Bắc</a> vẫn luôn tử tế và sống hòa đồng với mọi người.ích                           

                                        <small>`+timenow+`</small>
                                        `; 
                                    }, 1500)
                                }
                                else if (randomAnw == 1){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
          Tay to, vợ đẹp, sở thích là <a target="blank" href="https://www.apple.com/">Apple</a> và <a target="blank" href="https://shopee.vn/">Shoppe</a>.
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                else {
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Bàn tay vàng trong làng móc..... bóng <3 
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
                
                if (enterMsg.value.includes('i love you')||enterMsg.value.includes('yêu bạn')) {
                    function newMsg() {
                        if (mainadmin) {
                            var randomAnw =  Math.round(Math.random()*2);
                            const newMsg2 = document.createElement('div');
                                newMsg2.classList.add('admin-feed');
                                newMsg2.innerHTML = `
                                <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                    <span></span>
                                    <div class="loading"></div>
                                `;
                                if (randomAnw == 0){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Me too! Hihi!
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                else if (randomAnw == 1){
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Ối trời ơi xạo hoài!
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                else {
                                    setTimeout(()=>{
                                        newMsg2.innerHTML = `
                                        <img src="http://localhost:8080/DoAnJava/nguoidung/images/bot.jpg" alt="HeHe">
                                        <span></span>
                                        Tình yêu là gì? Có ăn được không?
                                        <small>`+timenow+`</small>
                                        `;
                                    }, 1500)
                                }
                                
                            mainadmin.appendChild(newMsg2);
                        }
                    }
                    newMsg();
                }
            setTimeout(()=>{
                bodyMsg.scrollTo(0,10000000000000);
            }, 1500)
            bodyMsg.scrollTo(0,10000000000000);
            enterMsg.value = ""; 
        }
    });

    Admin.onclick = function (){
        screenMsg.classList.remove('screen-msg-none');
        Admin.classList.add('msg-admin-2');
    }

    closeScreen.onclick = function (){
        screenMsg.classList.add('screen-msg-none');
        Admin.classList.remove('msg-admin-2');
        Admin.classList.add('msg-admin-3');
        setTimeout(()=>{
            Admin.classList.remove('msg-admin-3');
        }, 400)
    }
</script>