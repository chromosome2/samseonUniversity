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
            			<h3>나의 수업</h3>
            		</div>
            		<div class="tbl_header">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<thead>
            					<tr>
            						<th>NO</th>
            						<th>과목 코드</th>
            						<th>강의 이름</th>
            						<th>학기</th>
            						<th>학점</th>
            						<th>강의 시간</th>
            						<th>강의실</th>
            						<th>전공 / 교양</th>
            						<th><a href="#">학생관리</a></th>
            						<th><a href="#">공지사항</a>
            					</tr>
            				</thead>
            			</table>
            		</div>
            		<div class="tbl_content">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<tbody>
            					<c:choose>
            						<c:when test="${empty lectureList}">
            							<tr>
            								<td class="no_class" colspan="11">
            									진행중인 수업이 없습니다.
            								</td>
            							</tr>
            						</c:when>
            						<c:when test="${!empty lectureList}">
            							<c:forEach var="lecture" items="${lectureList}" varStatus="lecNum">
            								<tr>
			            						<td>${lecNum.count}</td>
			            						<td>${lecture.cl_id}</td>
			            						<td class="td_notice"><a href="${contextPath}/professor/lecture_board_list.do?cl_id=${lecture.cl_id}">${lecture.cl_name}</a></td>
			            						<td>${lecture.cl_sem}</td>
			            						<td>${lecture.cl_pt}</td>
			            						<td>${lecture.cl_time}</td>
			            						<td>${lecture.cl_room}</td>
			            						<td>${lecture.cl_mj_t}</td>
			            						<td class="btn_td"><button class="btn_move_b"><a href="${contextPath}/professor/lectureManageForm.do?cl_name=${lecture.cl_name}">이동</a></button></td>
			            						<td class="btn_td"><button class="btn_move_b"><a href="${contextPath}/professor/lecture_board_list.do?cl_id=${lecture.cl_id}">이동</a></button></td>
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

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>