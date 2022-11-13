<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="cnt" value="${total}"/>
<c:set var="pageSize" value="5"/>
<c:set var="currentPage" value="${pageNum}"/>
<%
	int currentPage = (int)request.getAttribute("pageNum");
%>
<c:set var="section" value="${section}"/>
<c:set var="pageNum" value="${pageNum}"/>
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
    <title>삼선대학교</title>
    <c:if test="${msg == 'deleted'}">
		<script type="text/javascript">
			alert('공지가 삭제되었습니다.');
		</script>
	</c:if>
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
            <div id="contents_area">
            	<section class="contents_wrapper">
            		<div class="table_header">
            			<h3>&lt;${noticeInfo.cl_name}&gt; 수업 공지사항</h3>
            		</div>
            		
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
			            						<td><a href="${contextPath}/professor/viewNotice.do?nt_id=${notice.nt_id}">${notice.nt_title}</a></td>
			            						<td>${noticeInfo.pf_name}</td>
			            						<td>${notice.nt_date}</td>
			            					</tr>
            							</c:forEach>
            						</c:when>
            					</c:choose>
            				</tbody>
            			</table>
            			<%--페이징 기능 추가 --%>
            			<div style="text-align:center;">
	            			<c:if test="${cnt != 0}">
	            				<c:set var="pageCount" value="${cnt / pageSize + (cnt % pageSize == 0 ? 0:1)}"/>
	            				<c:set var="pageBlock" value="5"/>
	            				<%
			                 		int startPage = (currentPage-1)/10*10 + 1;
			                 	%>
			                 	<c:set var="startPage" value="<%=startPage%>"/>
	            				<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
	            				<c:if test="${endPage > pageCount}">
	            					<c:set var="endPage" value="${pageCount}"/>
	            				</c:if>
		            			<c:if test="${startPage > pageBlock}">
		            				<a href="${contextPath}/professor/lecture_board_list.do?section=${section-1}&pageNum=${startPage-pageBlock}&cl_id=${noticeInfo.cl_id}">prev</a>
		            			</c:if>
		            			<c:forEach var="page" begin="${startPage}" end="${endPage}" step="1">
		            				<c:if test="${page == currentPage}">
		            					<a style="color:orangered;" href="${contextPath}/professor/lecture_board_list.do?section=${section}&pageNum=${page}&cl_id=${noticeInfo.cl_id}">${page}</a>
		            				</c:if>
		            				<c:if test="${page != currentPage}">
		            					<a href="${contextPath}/professor/lecture_board_list.do?section=${section}&pageNum=${page}&cl_id=${noticeInfo.cl_id}">${page}</a>
		            				</c:if>
		            			</c:forEach>
		            			<c:if test="${endPage < pageCount}">
		            				<a href="${contextPath}/professor/lecture_board_list.do?section=${section+1}&pageNum=${startPage+pageBlock}&cl_id=${noticeInfo.cl_id}">next</a>
		            			</c:if>
	            			</c:if>
            			</div>
            			
            		</div>
            	</section>
        		<!-- 새 글 작성 : 교수에게만 보임 -->
        		<c:if test="${user_level == 'professor'}">
        			<div style="text-align:center;">
	            	 	<a href="${contextPath}/professor/noticeForm.do?cl_id=${noticeInfo.cl_id}&cl_name=${noticeInfo.cl_name}">글쓰기</a>                  
        			</div>
                </c:if>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>