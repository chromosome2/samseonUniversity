<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<c:set var="cnt" value="${total}" />
			<c:set var="pageSize" value="5" />
			<c:set var="currentPage" value="${pageNum}" />
			<% int currentPage=(int)request.getAttribute("pageNum"); %>
				<c:set var="section" value="${section}" />
				<c:set var="pageNum" value="${pageNum}" />
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
					<link rel="stylesheet" href="${contextPath}/css/board.css">
					<script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
					<script src="${contextPath}/js/common.js"></script>
					<script src="${contextPath}/js/menu_third.js"></script>
					<title>삼선대학교</title>
					<c:if test="${msg == 'deleted'}">
						<script type="text/javascript">
							alert('공지가 삭제되었습니다.');
						</script>
					</c:if>
				</head>

				<body>
					<jsp:include page="../common/header.jsp" />

					<div id="middle_area">
						<div id="main_menu_back">
							<jsp:include page="../common/menu.jsp" />
						</div>

						<div id="contents_area">
							<section class="notice contents_wrapper">
								<div class="page-title">
									<div class="container">
										<h3>&lt;${noticeInfo.cl_name}&gt; 수업 공지사항</h3>
									</div>
								</div>



								<!-- board list area -->
								<div id="board-list">
									<div class="container">
										<table class="board-table">
											<thead>
												<tr>
													<td>${noticeInfo.cl_name} 공지사항</td>
												<tr>
												<tr>
													<th scope="col" class="th-num">번호</th>
													<th scope="col" class="th-title">제목</th>
													<th scope="col" class="th-date">작성자</th>
													<th scope="col" class="th-date">작성일</th>
												</tr>
											</thead>
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
																<th><a
																		href="${contextPath}/professor/viewNotice.do?nt_id=${notice.nt_id}">${notice.nt_title}</a>
																</th>
																<td>${noticeInfo.pf_name}</td>
																<td>${notice.nt_date}</td>
															</tr>
														</c:forEach>
													</c:when>
												</c:choose>
											</tbody>
										</table>


										<!-- 새 글 작성 : 교수에게만 보임 -->
										<div id="board-search">
											<div class="container">
												<div class="search-window">
													<form name="searchForm" class="search-form">
														<c:if test="${user_level == 'professor'}">
															<div class="section_write">
																<a
																	href="${contextPath}/professor/noticeForm.do?cl_id=${noticeInfo.cl_id}&cl_name=${noticeInfo.cl_name}"><input
																		class="btn btn-dark btn-write" type="button" value="글쓰기"></a>
															</div>
														</c:if>
													</form>
												</div>
											</div>
										</div>
										<%--페이징 기능 추가 --%>
											<div class="pagination">
												<ul class="pagination_modal">
													<c:if test="${cnt != 0}">
														<c:set var="pageCount" value="${cnt / pageSize + (cnt % pageSize == 0 ? 0:1)}" />
														<c:set var="pageBlock" value="5" />
														<% int startPage=(currentPage-1)/5*5 + 1; %>
															<c:set var="startPage" value="<%=startPage%>" />
															<c:set var="endPage" value="${startPage + pageBlock - 1}" />
															<c:if test="${endPage > pageCount}">
																<c:set var="endPage" value="${pageCount}" />
															</c:if>
															<c:if test="${startPage > pageBlock}">
																<li class="paging_first"><a class="paging_arrow"
																		href="${contextPath}/professor/lecture_board_list.do?section=${section-1}&pageNum=${startPage-pageBlock}&cl_id=${noticeInfo.cl_id}">
																		<< </a>
																</li>
															</c:if>
															<c:forEach var="page" begin="${startPage}" end="${endPage}" step="1">
																<c:if test="${page == currentPage}">
																	<li class="paging_num paging_active"><a class="num_active"
																			href="${contextPath}/professor/lecture_board_list.do?section=${section}&pageNum=${page}&cl_id=${noticeInfo.cl_id}">${page}</a>
																	</li>
																</c:if>
																<c:if test="${page != currentPage}">
																	<li class="paging_num"><a
																			href="${contextPath}/professor/lecture_board_list.do?section=${section}&pageNum=${page}&cl_id=${noticeInfo.cl_id}">${page}</a>
																	</li>
																</c:if>
															</c:forEach>
															<c:if test="${endPage < pageCount}">
																<li class="paging_last"><a class="paging_arrow"
																		href="${contextPath}/professor/lecture_board_list.do?section=${section+1}&pageNum=${startPage+pageBlock}&cl_id=${noticeInfo.cl_id}">>></a>
																</li>
															</c:if>
													</c:if>
												</ul>
											</div>
									</div>
								</div>

						</div>
					</div>

					</section>
					</div>
					</div>



					<jsp:include page="../common/footer.jsp" />
				</body>

				</html>