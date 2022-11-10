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
    <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
	<script src="${contextPath}/js/menu_third.js"></script>
	<script src="${contextPath}/js/table.js"></script>
	<script src="${contextPath}/js/pf_menu.js"></script>
    <title>삼선대학교</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

        <div id="middle_area">
            <div id="main_menu_back">
				<jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
            	<section class="contents_wrapper">
            		<div class="table_header">
            			<h3>&lt;${noticeInfo.cl_name}&gt; 수업 공지사항</h3>
            		</div>
            		<c:if test="${user_level == 'professor'}">
	              	 	<a href="${contextPath}/prof/add_article.jsp">글쓰기</a>                  
	                </c:if>
            		<div class="tbl_header">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<thead>
            					<tr>
            						<td>${noticeInfo.cl_name} 공지사항</td>
            					<tr>
            					<tr>
            						<th>번호</th>
			                        <th>제목</th>
			                        <th>작성자</th>
			                        <th>작성일</th>
            					</tr>
            				</thead>
            			</table>
            		</div>
            		<div class="tbl_content">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<tbody>
            					<c:choose>
            						<c:when test="${empty lessonNotice}">
            							<tr>
            								<td colspan="4">
            									공지사항이 없습니다.
            								</td>
            							</tr>
            						</c:when>
            						<c:when test="${!empty lessonNotice}">
            							<c:forEach var="notice" items="${lessonNotice}" varStatus="noticeNum">
            								<tr>
			            						<td>${noticeNum.count}</td>
			            						<td><a href="#">${notice.nt_title}</a></td>
			            						<td>${noticeInfo.pf_name}</td>
			            						<td>${notice.nt_date}</td>
			            					</tr>
            							</c:forEach>
            						</c:when>
            					</c:choose>
            				</tbody>
            			</table>
            			<%--페이징 기능 추가 --%>
            		</div>
            	</section>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>