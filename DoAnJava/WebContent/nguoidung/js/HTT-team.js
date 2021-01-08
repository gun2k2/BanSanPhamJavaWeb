/*begin::magamenu*/
/* scroll */
var height = $(window).height();
var max_height_section3 = height;
var footer_top = $('footer').offset().top;
var section1_height = $('.lib-section-1').height();
var distance_footer_1 = footer_top - section1_height;

if(height <= distance_footer_1) {
    $('.megamenu-wrapper').css("max-height",height - 70);
}
else{
    max_height_section3 = distance_footer_1;
    $('.megamenu-wrapper').css("max-height",distance_footer_1 - 70);
}
var is_height_top_menu = false;
$(window).scroll(function () {
    /* scroll header */
    if ($(window).width() > 1200) {
        if($('.mega-menu').length > 0) {
            var distance_bottom = $('footer').offset().top - $('.mega-menu').offset().top;
            var distance_top = $('.lib-section-3').offset().top;
            var height_header = $('.lib-section-1').height() + $('.header').height();
            var scroll_top = $(window).scrollTop();
            if (scroll_top >= height_header) {
                $('.mega-menu').addClass('affix-mobile');
                var apearfooter = $('.lib-section-10').offset().top;
                if($(window).scrollTop() >= apearfooter - max_height_section3 - 70) {
                    $('.mega-menu').css('top', $('.mega-menu').offset().top);
                    $('.mega-menu').css('position','absolute');
                }
                else {
                    $('.mega-menu').removeAttr('style');
                }
            } else {
                $('.mega-menu').removeClass('affix-mobile');
            }
        }
    }
});

/*end::magamenu*/