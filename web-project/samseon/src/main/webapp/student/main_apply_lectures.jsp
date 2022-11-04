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
  <link rel="stylesheet" href="${contextPath}/css/main_apply_lectures.css">
  <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
  <script src="${contextPath}/js/common.js"></script>
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
                  <select name="lt_options" id="lt_options">
                    <option value="1">1학기</option>
                    <option value="1">2학기</option>
                  </select>
                </div>
              </div>
              <div class="lt_select">
                <label class="lt_label">교과구분</label>
                <div class="lt_inner">
                  <select name="lt_options" id="lt_options">
                    <option value="1">선택</option>
                    <option value="2">전공과목</option>
                    <option value="3">교양과목</option>
                  </select>
                </div>
              </div>
              <div class="lt_select">
                <label class="lt_label">전공</label>
                <div class="lt_inner">
                  <select name="lt_options" id="lt_options">
                    <option value="1">컴퓨터공학과</option>
                    <option value="2">전기전자공학과</option>
                    <option value="3">기계공학과</option>
                  </select>
                </div>
              </div>
              <div class="lt_input_text">
                <label class="lt_label">과목명</label>
                <div>
                  <input type="text">
                </div>
              </div>
              <div class="lt_search_submit lt_select">
                <button class="search_btn">검색</button> <!-- ajax : input type button -->
              </div>
            </div>
          </div>

          <div class="st_lecture_list">
            <table border="1">
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
              <tr>
                <td><input type="checkbox" name="xxx" checked></td>
                <td>전공</td>
                <td>컴퓨터공학과</td>
                <td>컴퓨터개론및실습</td>
                <td>3</td>
                <td>27</td>
                <td>김선생</td>
                <td>IT 203호</td>
                <td>수,금 9시~10시 30분</td>
              </tr>
              <tr>
                <td><input type="checkbox" name="xxx"></td>
                <td>전공</td>
                <td>컴퓨터공학과</td>
                <td>C++ 기초</td>
                <td>3</td>
                <td>32</td>
                <td>이이젠</td>
                <td>IT 304호</td>
                <td>월,화 9시~10시 30분</td>
              </tr>
              <tr>
                <td><input type="checkbox" name="xxx"></td>
                <td>전공</td>
                <td>컴퓨터공학과</td>
                <td>보안 관리 및 실습</td>
                <td>2</td>
                <td>18</td>
                <td>나교수</td>
                <td>IT 101호</td>
                <td>금 15시~18시</td>
              </tr>
              <tr>
                <td><input type="checkbox" name="xxx"></td>
                <td>교양</td>
                <td>인문학부</td>
                <td>서양미술의 이해</td>
                <td>2</td>
                <td>18</td>
                <td>박화실</td>
                <td>컨퍼런스 202호</td>
                <td>목 11시~12시 30분</td>
              </tr>
            </table>
          </div>
          <div class="st_lecture_list lt_apply">
            <button class="apply_btn">신청하기</button>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
  </div>
</body>

</html>