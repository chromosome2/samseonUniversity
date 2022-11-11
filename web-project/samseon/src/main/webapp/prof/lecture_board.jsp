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
		<link rel="stylesheet" href="${contextPath}/css/apply_header.css">
    <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
		<link rel="stylesheet" href="${contextPath}/css/lecture_list.css">
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
          <h3>(강의이름) (수업) 공지사항</h3>
				</div>

				<c:if test="${user_level == 'professor'}">
				<div class="addClass_btn_area">
					<button class="btn_move"><a href="${contextPath}/prof/add_article.jsp">글쓰기</a></button> 
				</div>
				</c:if>

				<div id="tbl_area">
					<div class="tbl_header">

						<table>
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">담당부서</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
						</table>

					</div>
							
					<div class="tbl_content">

						<table>
							<tbody>
					<%--<c:choose>
								<c:when test="${empty }">
								<tr>
									<td colspan="4">공지사항이 없습니다.</td>
								</tr>
								</c:when>
								<c:when test="${!empty }">
									<c:forEach var="" items="${}"> --%>
									<tr>
										<td>1</td>
										<td><a href="#">공지사항입니다.</a></td>
										<td>김선생</td>
										<td>2020-02-02</td>
									</tr>
							<%--</c:forEach>
								</c:when>
							</c:choose> --%>
							</tbody>
						</table>

					</div>

				</div>
			</section>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>