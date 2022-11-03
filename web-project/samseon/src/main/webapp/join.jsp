<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${contextPath}/css/reset.css">
  <link rel="stylesheet" href="${contextPath}/css/join.css">
  <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script defer src="${contextPath}/js/join.js"></script>
  <title>회원가입 창</title>
</head>

<body>
  <!-- 회원가입 section -->
  <div class="join_main_div">
    <header class="join_header">
      <h1 class="join_header_h1">
        <a href="${contextPath}/index.html" class="join_header_txt">SAMSEON UNIV</a>
      </h1>
    </header>
    <section class="join_section">
      <form class="join_form" action="${contextPath}/member/join.do" method="post">
        <div class="join_txt_area input_id_txt">
          <span class="inner_warning">학번</span>
          <input type="text" name="id" autocomplete="off" autocorrect="off" autocapitalize="none" title="학번입력"
            class="input_value id_change">
        </div>
        <div class="join_txt_area">
          <span class="inner_warning">비밀번호</span>
          <input type="text" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value pwd_change">
        </div>
        <div class="join_txt_area">
          <span class="inner_warning">비밀번호 확인</span>
          <input type="text" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value pwd_check_change">
        </div>
        <div class="join_txt_area">
          <span class="inner_warning">이름</span>
          <input type="text" name="name" autocomplete="off" autocorrect="off" autocapitalize="none" title="이름 입력"
            class="input_value name_change">
        </div>
        <div class="join_txt_area">
          <span class="inner_warning">휴대폰 번호 ('-'제외 11자리 입력)</span>
          <input type="text" name="phone" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value phone_change">
        </div>
        <div class="join_txt_area postal_wrap">
          <div class="join_txt_area postal_input postal_wrap_1st">
            <span class="inner_hidden_warning">우편번호</span>
            <input class="input_value_none" id="sample4_postcode" type="text" disabled>
          </div>
          <div class="postal_input">
            <span class="postal_span inner_warning btn_addr_txt">주소 찾기</span>
            <input type="button" onclick="sample4_execDaumPostcode()" class="input_value_none btn_addr">
          </div>
        </div>
        <div class="join_txt_area">
          <span class="inner_hidden_warning">도로명주소</span>
          <input class="input_value_none" id="sample4_roadAddress" type="text" disabled>
        </div>
        <div class="join_txt_area">
          <span class="inner_warning">상세주소</span>
          <input class="input_value postal_change" id="sample4_detailAddress" type="text">
        </div>
        <div class="optional_area">
          <p class="optianl_txt">선택입력</p>
          <div class="join_txt_area">
            <span class="inner_warning">이메일</span>
            <input id="email" class="input_value email_change" type="text" name="email" autocomplete="off"
              autocorrect="off" autocapitalize="none" title="이메일 입력" class="input_value" />
          </div>
        </div>
        <div class="join_txt_area">
          <span class="inner_warning btn_addr_txt">가입하기</span>
          <input type="submit" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value btn_addr" placeholder="">
        </div>
      </form>
      <!-- 
<span class="inner_hidden_warning hidden">부여받은 학번 8자리 입력</span>
<span class="inner_hidden_warning hidden">8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력</span>
<span class="inner_hidden_warning hidden">비밀번호 재입력</span>
<span class="inner_hidden_warning hidden">이름 입력</span>
<span class=" inner_warning hidden">우편번호</span>
<span class="inner_warning hidden">도로명주소</span>
<span class="inner_hidden_warning hidden">상세주소 입력</span>
<span class="inner_hidden_warning hidden">이메일 입력</span>
<span class="inner_hidden_warning hidden">휴대폰 번호 ('-'제외 11자리 입력)</span>
    -->
    </section>
  </div>
  <!-- 회원가입 section -->
</body>

</html>