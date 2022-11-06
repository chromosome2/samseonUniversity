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
	<script src="${contextPath}/js/pf_menu.js"></script>
	<script src="${contextPath}/js/table.js"></script>
    <title>삼선대학교</title>
    <style>
    	input{
    		width : 50px;
    	}
    </style>
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
            			<h3>컴퓨터개론 및 실습</h3>
            		</div>
            		<form action="${contextPath}/" method="post" id="frm_add_score" name="frm_add_score">
            			<div class="tbl_header">
	            			<table border="0" cellpadding="0" cellspacing="0">
	            				<thead>
	            					<tr>
	            						<td colspan="9" class="sub_name">출석 관리</td>
	            					</tr>
	            					<tr>
	            						<th>주차</th>
	            						<th>학생 이름</th><td>홍길동</td>
	            						<th>학생 학번</th><td>1111</td>
	            					</tr>
	            				</thead>
	            			</table>
	            		</div>
	            		<div class="tbl_content">
	            			<table border="0" cellpadding="0" cellspacing="0">
	            				<tbody>
	            				</tbody>
	            			</table>
	            			<input class="btn_submit button" type="submit" value="등록하기">
                        	<a href="${contextPath}/prof/my_lecture.jsp" class="btn_cancle button">취소</a>
	            		</div>
            		</form>
            		
            	</section>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>