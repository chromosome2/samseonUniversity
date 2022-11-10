//기존에 있던 point 클래스를 삭제하고 자신 페이지에 맞는 n번째 메뉴에 point를 넣는 방식.
//클릭시 발동하는 방식이 아니라 페이지를 열자마자 발동하는 방식이라 합치면 안될것같음.(해보진않음)
//클릭시 발동하는 방식으로 만드려고 했지만 클릭과 동시에 href로 페이지가 이동하면서 js가 리셋되는 바람에 결국 이렇게 만듦.
$(function () {
	$('.point').removeClass('point');
	$('.first_menu_title').addClass('point');
});