$(window)
  .on('load resize ', function () {
    var scrollWidth =
      $('.tbl_content').width() - $('.tbl_content table').width();
    $('.tbl_header').css({ 'padding-right': scrollWidth });
  })
  .resize();
