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
	<script src="${contextPath}/js/mypage_second.js"></script>
	<script src="${contextPath}/js/table.js"></script>
    <title>삼선대학교</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <div id="middle_area">
        <div id="main_menu_back">
            <jsp:include page="../common/menu.jsp" />
        </div>

        <div id="contents_area">
            <section class="contents_wrapper">
                <div class="table_header">
                    <h3>수강중인 과목 조회</h3>
                </div>
                <div class="my_info tbl_header">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <thead>
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
                        </thead>
                    </table>
                </div>
                <div class="tbl_content">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <c:choose>
                          		<c:when test="${empty lectureList }">
                          			<tr>
                          				<td colspan="8">
                          					<p align="center">수강한 수업이 없습니다.</p>
                          				</td>
                          			</tr>
                          		</c:when>
                          		<c:when test="${!empty lectureList }">
                          			<c:forEach var="lect" items="${lectureList }" varStatus="listNum">
                          				<tr>
											<td>${listNum.count }</td>
											<td>${lect.cl_id }</td>
											<td>${lect.cl_name}</td>
											<td>${lect.pf_name }</td>
											<td>${lect.cl_pt }</td>
											<td>${lect.s_first}</td>
											<td>${lect.s_second }</td>
											<td>${lect.cl_time}</td>
											<td>${lect.cl_room}</td>
                          				</tr>
                          			</c:forEach>
                          		</c:when>
                          	</c:choose>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>

</html>