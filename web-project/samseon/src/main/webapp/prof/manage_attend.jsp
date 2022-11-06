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
		<link rel="stylesheet" href="${contextPath}/css/manage_attend.css">
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
      <div class="table_header">
        <h3>출석 관리</h3>
      </div>
      <section class="contents_wrapper">
				<div class="tbl_area">

					<div class="tbl_header">
						<table border="0" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th colspan="7">출석</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl_content">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<%--<c:choose>
									<c:when test="${empty}">
										<form action="">
											<tr>
												<td>n주차</td> 
												<td>월<input type="checkbox" name="day" value="1"></td>
												<td>화<input type="checkbox" name="day" value="1"></td>
												<td>수<input type="checkbox" name="day" value="1"></td>
												<td>목<input type="checkbox" name="day" value="1"></td>
												<td>금<input type="checkbox" name="day" value="1"></td>
												<td><button class="apply_btn">제출</button></td>
											</tr>
										</form>
									</c:when>
									<c:when test="${!empty  }">
										<form action="">
											<c:forEach var="" items="${}"> --%>
												<tr>
													<td>n주차</td> 
													<td>월<input type="checkbox" name="day" value="1"></td>
													<td>화<input type="checkbox" name="day" value="1"></td>
													<td>수<input type="checkbox" name="day" value="1"></td>
													<td>목<input type="checkbox" name="day" value="1"></td>
													<td>금<input type="checkbox" name="day" value="1"></td>
												</tr>
									<%--</c:forEach>
											<tr>
												<td>n주차</td> 
												<td>월<input type="checkbox" name="day" value="1"></td>
												<td>화<input type="checkbox" name="day" value="1"></td>
												<td>수<input type="checkbox" name="day" value="1"></td>
												<td>목<input type="checkbox" name="day" value="1"></td>
												<td>금<input type="checkbox" name="day" value="1"></td>
												<td><button class="apply_btn">제출</button></td>
											</tr>
										</form>
											
											<!-- 체크시 1 증가 총 수업날짜 ex) 5/30 이런식으로 표기? 수업 기간2달 60일 수업날짜 45일 이런식? -->
									</c:when>
								</c:choose> --%>
							</tbody>
						</table>
						<br>
					
					</div>
				</div>
      </section>
    </div>
  </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>