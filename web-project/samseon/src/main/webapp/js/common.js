$(function(){
	//footer
    let white_x=$('.white_head1').offset().left;
    $('.black_head1').css('width',white_x+40);
    $( window ).resize(function() {
        let white_x=$('.white_head1').offset().left;
        $('.black_head1').css('width',white_x+40);
    });

    //마이페이지
    let sw=false;
    $('.my_page_click_area').click(function(){
        if(sw==false){
            $('.my_page_menu').slideDown();
            $(this).addClass('my_page_click');
        }else{
            $('.my_page_menu').slideUp();
            $(this).removeClass('my_page_click');
        }
        sw=!sw;
    });
    
    //side_menu
    let footer_y=$('#footer').offset().top;
    //alert(footer_y);
    $('#main_menu_back').css('height',footer_y);
    $(window).resize(function(){
		let footer_y=$('#footer').offset().top;
    	$('#main_menu_back').css('height',footer_y); 
	});
});