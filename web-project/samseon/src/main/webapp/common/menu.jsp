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
</head>
<body>
                <nav>
                    <h2 class="hidden">메인메뉴</h2>
                    <ul class="main_menu">
                    	<c:choose>
							<c:when test="${user_level == 'student'}">
		                        <li class="first_menu_title"><a href="${contextPath}/board/listArticles.do" class="menu_title">공지사항</a></li>
		                        <li class="second_menu_title"><a href="${contextPath}/student/main_apply_lectures.jsp" class="menu_title">수강신청</a></li>
		                        <li class="third_menu_title my_page">
		                        	<div class="my_page_click_area"><a href="#" class="menu_title">마이페이지</a></div>
		                            <ul class="my_page_menu">
		                                <li><a href="${contextPath}/student/viewScores.jsp"  class="first_my_page_title">전체성적 조회</a></li>
		                                <li><a href="${contextPath}/student/viewMyLectures_ST.jsp" class="second_my_page_title">수강중인 과목 조회</a></li>
		                                <li><a href="${contextPath}/student/privacy_check.jsp" class="third_my_page_title">개인정보</a></li>
		                            </ul>
		                        </li>		
							</c:when>
							<c:when test="${user_level == 'professor'}">
			                    <li class="first_menu_title"><a href="${contextPath}/board/listArticles.do" class="menu_title">공지사항</a></li>
		                        <li class="second_menu_title"><a href="#" class="menu_title">수업 등록</a></li>
		                        <li class="third_menu_title my_page"><div class="my_page_click_area"><a href="#" class="menu_title">나의 수업</a></div>
		                            <ul class="my_page_menu">
		                                <li><a href="#" class="first_my_page_title">학생 관리</a></li>
		                                <li><a href="#" class="second_my_page_title">과목 공지사항</a></li>
		                            </ul>
		                        </li>						
							</c:when>
							<c:when test="${user_level == 'admin'}">
			                    <li class="first_menu_title"><a href="#" class="menu_title">공지사항 관리</a></li>
		                        <li class="second_menu_title"><a href="#" class="menu_title">학생, 교수 관리</a></li>					
							</c:when>
							<c:otherwise><%-- 이 부분은 로그인 안했을때 css 수정하기 위해서 넣어놨습니다! 나중에 작업 마치면 삭제하셔도 됩니다. --%>
								<li class="first_menu_title"><a href="${contextPath}/board/listArticles.do" class="menu_title">공지사항</a></li>
		                        <li class="second_menu_title"><a href="${contextPath}/student/main_apply_lectures.jsp" class="menu_title">수강신청</a></li>
		                        <li class="third_menu_title my_page">
		                        	<div class="my_page_click_area"><a href="#" class="menu_title">마이페이지</a></div>
		                            <ul class="my_page_menu">
		                                <li><a href="${contextPath}/student/viewScores.jsp"  class="first_my_page_title">전체성적 조회</a></li>
		                                <li><a href="${contextPath}/student/viewMyLectures_ST.jsp" class="second_my_page_title">수강중인 과목 조회</a></li>
		                                <li><a href="${contextPath}/student/privacy_check.jsp" class="third_my_page_title">개인정보</a></li>
		                            </ul>
		                        </li>
							</c:otherwise>
	                    </c:choose>
                        
                    </ul>
                </nav>
</body>
</html>