<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
        <link rel="stylesheet" href="${contextPath}/css/table.css">
        <link rel="stylesheet" href="${contextPath}/css/board_detail.css">
        <link rel="stylesheet" href="${contextPath}/css/viewScores.css">
        <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${contextPath}/js/common.js"></script>
        <script src="${contextPath}/js/menu_second.js"></script>
        <title>삼선대학교</title>
      </head>

      <body>
        <jsp:include page="../common/header.jsp" />

        <div id="middle_area">
          <div id="main_menu_back">
            <jsp:include page="../common/menu.jsp" />
          </div>

          <div id="contents_area">
            <div class="contents_wrapper">
              <h3>수강 신청 및 조회</h3>
              <div class="st_lecture_area">
                <div class="lt_search_form">
                  <!-- <div class="lt_select">
                <label class="lt_label">학년</label>
                <div class="lt_inner">
                  <select name="lt_options" id="lt_options">
                    <option value="1">1학년</option>
                    <option value="1">2학년</option>
                    <option value="1">3학년</option>
                    <option value="1">3학년</option>
                  </select>
                </div>
              </div> -->
                  <div class="lt_select">
                    <label class="lt_label">학기</label>
                    <div class="lt_inner">
                      <select name="semester" id="lt_options" disabled>
                        <option value="1" selected>1학기</option>
                        <option value="2">2학기</option>
                      </select>
                    </div>
                  </div>
                  <div class="lt_select">
                    <label class="lt_label">교과구분</label>
                    <div class="lt_inner">
                      <select name="cl_mj_t" id="lt_options">
                        <option value="none">선택</option>
                        <option value="major">전공과목</option>
                        <option value="elective">교양과목</option>
                      </select>
                    </div>
                  </div>
                  <div class="lt_select">
                    <label class="lt_label">전공</label>
                    <div class="lt_inner">
                      <select name="m_name" id="lt_options">
                        <c:forEach var="major" items="${majors}">
	                  		<option value="${major}">${major}</option>
	                  	</c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="lt_input_text">
                    <label class="lt_label">과목명</label>
                    <div>
                      <input type="text" name="cl_name">
                    </div>
                  </div>
                  <div class="lt_search_submit lt_select">
                    <button class="search_btn">검색</button> <!-- ajax : input type button -->
                  </div>
                </div>
              </div>

              <div class="tbl_content">
                <div class="st_lecture_list tbl_header">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <thead>
                      <tr>
                        <th>선택</th>
                        <th>구분</th>
                        <th>학과</th>
                        <th>강좌명</th>
                        <th>학점</th>
                        <th>정원</th>
                        <th>담당 교수</th>
                        <th>강의실</th>
                        <th>강의 시간</th>
                      </tr>
                    </thead>
                  </table>
                </div>
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <c:choose>
	            		<c:when test="${lectures == null}">
	            			<tr colsapn="9"><td colspan="9">수강 신청할 수 있는 강의가 아직 등록되지 않았습니다.</td></tr>
	            		</c:when>
	            		<c:otherwise>
	            			<tr>
	            				<td><input type="checkbox" name="xxx"></td>
	            				<td>${lectures.cl_mj_t}</td>
	            				<td>${lectures.m_name}</td>
	            				<td>${lectures.cl_name}</td>
	            				<td>${lectures.cl_pt}</td>
	            				<td>${lectures.cl_size}</td>
	            				<td>${lectures.pf_name}</td>
	            				<td>${lectures.cl_room}</td>
	            				<td>${lectures.cl_time}</td>
	            			</tr>
	            		</c:otherwise>
	            	</c:choose>
                  </tbody>
                </table>
              </div>
              <div class="st_lecture_list lt_apply">
                <button class="apply_btn">신청하기</button>
              </div>
            </div>
          </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
        </div>
      </body>

      </html>