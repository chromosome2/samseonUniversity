<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${contextPath}/images/logo.png">
  <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard-dynamic-subset.css" />
  <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
  <link rel="stylesheet" href="${contextPath}/css/reset.css">
  <link rel="stylesheet" href="${contextPath}/css/index.css">
  <title>삼선대학교 포털</title>
	<c:if test="${msg=='login_failed'}">
		<script type="text/javascript">
			window.onload=function() {
				alert("로그인 정보가 틀립니다.");
			}
		</script>
	</c:if>
</head>

<body>
  <div class="overall_wrapper">
    <div class="main_container">

      <div class="container_login">
        <div class="wrap_login">
          <div class="login_pic">
            <!-- <h1>환영합니다.</h1> -->
            <img src="${contextPath}/images/logo.png" alt="삼선대학교 로고">
          </div>

          <form class="login_form" name="frmLogin" method="post" action="${contextPath}/member/login.do">
            <span class="login_form_title">로그인</span>
            <div class="wrap_input">
              <input type="text" class="input" name="id" placeholder="아이디" required>
              <span class="focus_input"></span>
              <span class="symbol_input">
                <i class="fa fa_envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap_input">
              <input type="password" class="input" name="pwd" placeholder="비밀번호" required>
              <span class="focus_input"></span>
              <span class="symbol_input">
                <i class="fa fa_lock" aria-hidden="true"></i>
              </span>
            </div>

            <div class="login_form_btn_container">
              <button class="login_form_btn">로그인</button>
            </div>

            <div class="text_center p_t_1">
              <!-- <span class="txt1">Forgot</span> -->
              <a href="#" class="txt2"> 아이디/비밀번호 찾기&nbsp;&nbsp; </a>
              <a class="dummy_txt">|&nbsp;&nbsp;</a><a href="${contextPath}/join.jsp" class="txt2">회원가입<i class="fa fa_long_arrow_right "
                  aria-hidden="true"></i></a>
            </div>
            <div class="text_center p_t_2">

            </div>

          </form>

          <div class="login_title">
            <h1>삼선대학교 포털에 오신 것을 환영합니다.</h1>
          </div>
        </div>
      </div>
      <div>
      </div>
    </div>
    <div class="footer">
      <div class="footer_section">
        <p>© 2012 SAMSEON UNIVERSITY ALL RIGHTS RESERVED.</p>
        <ul>
          <li class="footer_bar">
            <a href="#" class="footer_txt">
              <b>개인정보처리방침</b>
            </a>
          </li>
          <li>
            <a href="#">이메일무단수집거부</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</body>

</html>

</html>