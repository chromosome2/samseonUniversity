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
  <script defer src="${contextPath}/js/join.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <title>회원가입 창</title>
  <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
  <!-- <script type="text/javascript">
  	function fn_hakbunCk() {
  		let hakbun=$('#hakbun').val();
  		$.ajax({
  			type:"post",
  			async:"true",
  			dataType:"text",
  			url:"${contextPath}/member/hakbunCheck.do",
  			data:{id:hakbun},
  			success: function (data, textStatus) {
  				if(data == 'usable') {
  					alert("가입할 수 있는 학번입니다.");
  				}else {
  					alert("가입할 수 없는 학번입니다.");
  					$('#hakbun').val('');
  				}
  			},
  			error: function (data, textStatus) {
  				alert("에러가 발생했습니다.");
  			}
  		});
  	}
  </script> -->
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
      <form action="${contextPath}/member/join.do" method="post">
        <div class="join_txt_area">
          <span class="join_txt_span">학번</span>
          <input type="text" name="id" autocomplete="off" autocorrect="off" autocapitalize="none" title="학번입력"
            class="input_value">
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">비밀번호</span>
          <input type="text" name="pwd" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value">
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">비밀번호 확인</span>
          <input type="text" name="pwd1" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value">
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">이름</span>
          <input type="text" name="name" autocomplete="off" autocorrect="off" autocapitalize="none" title="이름 입력"
            class="input_value">
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">휴대폰 번호 ('-'제외 11자리 입력)</span>
          <input type="text" name="phone" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value">
        </div>
        <div class="join_txt_area postal_wrap">
          <div class="postal_input postal_wrap_1st">
            <span class=" join_txt_span">우편번호</span>
            <input class="input_value" name="addr_1st" id="sample4_postcode" type="text">
          </div>
          <div class="postal_input">
            <span class="postal_span join_txt_span btn_addr_txt">주소 찾기</span>
            <input type="button" onclick="sample4_execDaumPostcode()" class="input_value btn_addr">
          </div>
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">도로명주소</span>
          <input class="input_value" name="addr_2nd" id="sample4_roadAddress" type="text">
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span">상세주소</span>
          <input class="input_value" name="addr_3rd" id="sample4_detailAddress" type="text">
        </div>
        <div class="optional_area">
          <p class="optianl_txt">선택입력</p>
          <div class="join_txt_area">
            <span class="join_txt_span">이메일</span>
            <input class="input_value" type="text" name="email" autocomplete="off" autocorrect="off"
              autocapitalize="none" title="이메일 입력" class="input_value" />
          </div>
        </div>
        <div class="join_txt_area">
          <span class="join_txt_span btn_addr_txt">가입하기</span>
          <input type="submit" autocomplete="off" autocorrect="off" autocapitalize="none" title="비밀번호 입력"
            class="input_value btn_addr" placeholder="">
        </div>
      </form>
    </section>
  </div>
  <!-- 회원가입 section -->
</body>

</html>