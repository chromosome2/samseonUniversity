<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html lang="ko">

<<<<<<< HEAD
    <div id="contents_area">
      <section class="contents_wrapper">
				<div class="table_header">
        	<h3>등록된 수업 목록</h3>
        </div>
				<div class="addClass_btn_area">
          <button class="btn_move"><a href="${contextPath}/prof/add_lecture.jsp">수업 등록</a></button>
				</div>
				<div class="tbl_area">
					<div class="tbl_header">
									
						<table border="0" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th>NO</th>
									<th>과목 코드</th>
									<th>강의 이름</th>
									<th>교수 이름</th>
									<th>학기</th>
									<th>학점</th>
									<th>강의 시간</th>
									<th>강의실</th>
									<th>전공 / 교양</th>
									<th>단과 대학</th>
									<th class="th_btn">수정</th>
									<th class="th_btn">삭제</th>
								</tr>
							</thead>
						</table>
=======
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
				<script src="${contextPath}/js/menu_second.js"></script>
				<script src="${contextPath}/js/table.js"></script>
				<title>삼선대학교</title>
				<c:choose>
					<c:when test='${lect_msg=="addLect" }'>
						<script>
							window.onload = function () {
								alert("강의를 등록하였습니다.");
							}
						</script>
					</c:when>
					<c:when test='${lect_msg=="modLect" }'>
						<script>
							window.onload = function () {
								alert("강의를 수정하였습니다.");
							}
						</script>
					</c:when>
					<c:when test='${lect_msg=="delLect" }'>
						<script>
							window.onload = function () {
								alert("강의를 삭제하였습니다.");
							}
						</script>
					</c:when>
				</c:choose>
			</head>

			<body>
				<jsp:include page="../common/header.jsp" />
				<div id="middle_area">
					<div id="main_menu_back">
						<jsp:include page="../common/menu.jsp" />
>>>>>>> e357fbfa86207005d98d666bae70bf03679f78fa
					</div>

					<div id="contents_area">
						<div class="table_header">
							<h3>등록된 수업 목록</h3>
						</div>
						<section class="contents_wrapper">
							<div class="tbl_area">
								<div class="tbl_header">

									<table border="0" cellpadding="0" cellspacing="0">
										<thead>
											<tr>
<<<<<<< HEAD
												<td>${lectNum.count }</td>
												<td>${lect.cl_id }</td>
												<td>${lect.cl_name}</td>
												<td>${lect.pf_name}</td>
												<td>${lect.cl_sem}</td>
												<td>${lect.cl_pt}</td>
												<td>${lect.cl_time}</td>
												<td>${lect.cl_room}</td>
												<td>${lect.cl_mj_t}</td>
												<td>${lect.dan}</td>
												<td class="th_btn"><button class="btn_move"><a href="${contextPath}/prof/add_lecture.jsp">수정</a></button></td>
												<td class="th_btn"><button class="btn_move"><a href="${contextPath}/prof/">삭제</a></button></td>
=======
												<th>NO</th>
												<th>과목 코드</th>
												<th>강의 이름</th>
												<th>교수 이름</th>
												<th>학기</th>
												<th>학점</th>
												<th>강의 시간</th>
												<th>강의실</th>
												<th>전공 / 교양</th>
												<th>단과 대학</th>
												<th>수정</th>
												<th>삭제</th>
>>>>>>> e357fbfa86207005d98d666bae70bf03679f78fa
											</tr>
										</thead>
									</table>
								</div>
								<div class="tbl_content">
									<table border="0" cellpadding="0" cellspacing="0">
										<tbody>
											<c:choose>
												<c:when test="${empty pf_LectureList}">
													<tr>
														<td colspan="11">
															<p align="center">등록된 수업이 없습니다.</p>
														</td>
													</tr>
												</c:when>
												<c:when test="${!empty pf_LectureList}">
													<c:forEach var="lect" items="${pf_LectureList}" varStatus="lectNum">
														<tr>
															<td>${lectNum.count }</td>
															<td>${lect.cl_id }</td>
															<td>${lect.cl_name}</td>
															<td>${lect.pf_name}</td>
															<td>${lect.cl_sem}</td>
															<td>${lect.cl_pt}</td>
															<td>${lect.cl_time}</td>
															<td>${lect.cl_room}</td>
															<td>${lect.cl_mj_t}</td>
															<td>${lect.dan}</td>
															<td><button class="btn_move"><a
																		href="${contextPath}/view/mod_lecture_form.do?cl_id=${lect.cl_id}">수정</a></button>
															</td>
															<td><button class="btn_move"><a
																		href="${contextPath}/view/del_lecture.do?cl_id=${lect.cl_id}">삭제</a></button></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							<div class="addClass_btn_area">
								<button class="apply_btn"><a href="${contextPath}/prof/add_lecture.jsp">수업 등록</a></button>
							</div>
						</section>
					</div>
				</div>
				<jsp:include page="../common/footer.jsp" />
			</body>

			</html>