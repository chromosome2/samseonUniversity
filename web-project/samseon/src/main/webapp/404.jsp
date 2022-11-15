<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
  <link rel="stylesheet" href="${contextPath}/css/common.css">
  <link rel="stylesheet" href="${contextPath}/css/404.css">
  <title>404 오류. 페이지를 찾을수 없습니다.</title>
</head>
<body>

  <div class="content">

    <div class="logo_area">
        <a href="${contextPath}/board/listArticles.do"><img src="images/logo.png" alt="대학교 이미지"></a>
    </div>
    <div class="text_area">
      <div class="text1">
        <h3> 죄송합니다. 페이지를 찾을수 없습니다.</h3>
        <p>This page is missing.</p>
      </div>
      <div class="text2">
        <p ><a href="${contextPath}/board/listArticles.do"> 홈으로 돌아가기 </a></p> 
      </div>
    </div>
  </div>
  
</body>
</html>