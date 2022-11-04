$(function () {
  let white_x = $('.white_head1').offset().left;
  $('.black_head1').css('width', white_x + 40);
  $(window).resize(function () {
    let white_x = $('.white_head1').offset().left;
    $('.black_head1').css('width', white_x + 40);
  });

  //마이페이지
  let sw = false;
  $('.my_page_click_area').click(function () {
    if (sw == false) {
      $('.my_page_menu').slideDown();
      $(this).addClass('my_page_click');
    } else {
      $('.my_page_menu').slideUp();
      $(this).removeClass('my_page_click');
    }
    sw = !sw;
  });
});
