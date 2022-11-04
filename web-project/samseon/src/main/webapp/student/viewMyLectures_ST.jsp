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
    <link rel="stylesheet" href="${contextPath}/css/table.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
	<script src="${contextPath}/js/menu_third.js"></script>
	<script src="${contextPath}/js/mypage_second.js"></script>
    <title>삼선대학교</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

        <div id="middle_area">
            <div id="main_menu_back">
                <jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
                <div class="contents_wrapper">
                    <h3>수강중인 과목 조회</h3>
                    <div class="st_lecture_list">
                        <table border="1">
                            <tr>
                                <th>NO</th>
                                <th>과목 코드</th>
                                <th>과목 이름</th>
                                <th>교수 이름</th>
                                <th>학점</th>
                                <th>중간 점수</th>
                                <th>기말 점수</th>
                                <th>강의 시간</th>
                                <th>강의실</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>555555</td>
                                <td>컴퓨터개론및실습</td>
                                <td>김선생</td>
                                <td>3</td>
                                <td>27</td>
                                <td></td>
                                <td>수,금 9시~10시 30분</td>
                                <td>IT 203호</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>