<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
              <a href="${contextPath}/index.jsp" class="join_header_txt">SAMSEON UNIV</a>
            </h1>
          </header>
          <section class="join_section">
            <form class="join_form" action="${contextPath}/member/join.do" method="post">
              <div class="join_txt_area input_id_txt">
                <span class="inner_warning">학번</span>
                <input type="text" name="id" autocomplete="off" autocorrect="off" autocapitalize="none" title="학번입력"
                  class="input_value id_change" id="id">
              </div>
              <div class="warningTxtDiv idWarning">
                <svg viewBox="0 0 49 49" xmlns="http://www.w3.org/2000/svg" class="warningSvg idWarning">
                  <path
                    d="M24.1.9C10.9.9.1 11.7.1 24.9s10.8 24 24 24 24-10.8 24-24-10.8-24-24-24zm0 40.5c-2.1 0-3.8-1.7-3.8-3.8 0-2.1 1.7-3.8 3.8-3.8 2.1 0 3.8 1.7 3.8 3.8 0 2-1.7 3.8-3.8 3.8zm3.8-16.5c0 2.1-1.7 3.8-3.8 3.8-2.1 0-3.8-1.7-3.8-3.8V12.3c0-2.1 1.7-3.8 3.8-3.8 2.1 0 3.8 1.7 3.8 3.8v12.6z">
                  </path>
                </svg>
                <p class="warningTxt">학번을 입력해주세요</p>
              </div>
              <div class="join_txt_area">
                <span class="inner_warning">비밀번호</span>
                <input type="text" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
                  class="input_value pwd_change" id="pwd">
              </div>
              <div class="join_txt_area">
                <span class="inner_warning">비밀번호 확인</span>
                <input type="text" name="pwd1" autocomplete="off" autocorrect="off" autocapitalize="none"
                  title="비밀번호 입력" class="input_value pwd_check_change" id="pwd_check">
              </div>
              <div class="join_txt_area">
                <span class="inner_warning">이름</span>
                <input type="text" name="name" autocomplete="off" autocorrect="off" autocapitalize="none" title="이름 입력"
                  class="input_value name_change">
              </div>
              <div class="join_txt_area">
                <span class="inner_warning">휴대폰 번호 ('-'제외 11자리 입력)</span>
                <input type="text" name="phone" autocomplete="off" autocorrect="off" autocapitalize="none"
                  title="휴대폰 번호 입력" class="input_value">
              </div>
              <div class="join_txt_area postal_wrap">
                <div class="join_txt_area postal_input postal_wrap_1st">
                  <span class="inner_hidden_warning">우편번호</span>
                  <input class="input_value_none" name="addr" id="sample4_postcode" type="text">
                </div>
                <div class="postal_input">
                  <span class="postal_span inner_warning btn_addr_txt">주소 찾기</span>
                  <input type="button" onclick="sample4_execDaumPostcode()" class="input_value_none btn_addr">
                </div>
              </div>
              <div class="join_txt_area">
                <span class="inner_hidden_warning">도로명주소</span>
                <input class="input_value_none" name="addr" id="sample4_roadAddress" type="text">
              </div>
              <div class="join_txt_area">
                <span class="inner_warning">상세주소</span>
                <input class="input_value postal_change" name="addr" id="sample4_detailAddress" type="text">
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
                <input type="submit" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none"
                  title="비밀번호 입력" class="input_value_none btn_addr" placeholder="">
              </div>
            </form>
          </section>
        </div>
        <!-- 회원가입 section -->
      </body>

      </html>