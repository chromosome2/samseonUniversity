<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
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
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <title>삼선대학교</title>
   	<!-- 로그인하지 않았을 경우 index.jsp로 이동 -->
    <%-- <c:if test="${isLogin != true && empty studentInfo && empty professorInfo && empty adminInfo}">
		 <script>
	 		alert("로그인되지 않았습니다.");
		 	location.href="${contextPath}/index.jsp";
		 </script>    
	</c:if> --%>
</head>
<body>
	<div id="wrapper">
        <header>
            <div class="head1">
                <div class="black_head1">
                	<h2 class="hidden">대학교 로고</h2>
                    <a href="${contextPath}/board/listArticles.do">
                        <img src="${contextPath}/images/logo_white.png" alt="삼선대학교 로고">
                        <span>삼선대학교</span>
                    </a>
                </div>
                <div class="header_contents">
                    <div class="white_head1">
	                   	<c:choose>
	                      	<c:when test="${user_level == 'student'}">
			                    <span class="st_name">${studentInfo.m_name} ${studentInfo.name}님</span>						
							</c:when>
							<c:when test="${user_level == 'professor'}">
			                    <span class="st_name">${professorInfo.m_name} ${professorInfo.name} 교수님</span>						
							</c:when>
							<c:when test="${user_level == 'admin'}">
								<span class="st_name">관리자 ${adminInfo.name}님</span>
							</c:when>
							<c:otherwise><span class="st_name">컴퓨터공학과 홍길동님</span>
							</c:otherwise>
	                    </c:choose>
                    </div>
                    <ul class="mini_menu">
                        <li><a href="#">학교 서비스</a>
                            <ul class="service_menu">
                                <li><a href="#">대학홈페이지</a></li>
                                <li><a href="#">도서관</a></li>
                                <li><a href="#">총학생회</a></li>
                                <li><a href="#">학생생활상담소</a></li>
                                <li><a href="#">취업정보센터</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:choose>
			          <c:when test="${isLogin == true && (!empty studentInfo || !empty professorInfo || !empty adminInfo)}">
				      	<a href="${contextPath}/member/logout.do" class="btn_logout">로그아웃</a>     
			          </c:when>
			          <c:otherwise>
			          	<a href="${contextPath}/index.jsp" class="btn_logout">로그인</a>
			          </c:otherwise>
		         	 </c:choose>
                </div>
            </div>
            <div class="head2">
            </div>
            <div class="head3">
            </div>
        </header>
</body>
</html>