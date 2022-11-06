<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <%
  request.setCharacterEncoding("UTF-8");
%>
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
        <title>삼선대학교</title>
      </head>

      <body>
        <jsp:include page="common/header.jsp" />
        <div id="middle_area">
          <div id="main_menu_back">
            <jsp:include page="common/menu.jsp" />
          </div>

          <div id="contents_area">
            <section class="notice contents_wrapper">
              <div class="page-title">
                <div class="container">
                  <h3>공지사항</h3>
                </div>
              </div>

              <!-- board seach area -->
              <!-- <div id="board-search">
                  <div class="container">
                    <div class="search-window">
                      <form action="">
                        <div class="search-wrap">
                          <label for="search" class="blind">공지사항 내용 검색</label>
                          <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                          <button type="submit" class="btn btn-dark">검색</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div> -->

              <!-- board list area -->
              <div id="board-list">
                <div class="container">
                  <table class="board-table">
                    <thead>
                      <tr>
                        <th scope="col" class="th-num">번호</th>
                        <th scope="col" class="th-title">제목</th>
                        <th scope="col" class="th-date">담당부서</th>
                        <th scope="col" class="th-date">등록일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>3</td>
                        <th>
                          <a href="#!">[공지사항] 2023학년도 여름계절학기 수요조사 안내</a>
                          <p>테스트</p>
                        </th>
                        <td>학사팀</td>
                        <td>2023.03.21</td>
                      </tr>

                      <tr>
                        <td>2</td>
                        <th><a href="#!">[연구지원팀] 2023년도 한국연구재단 과학기술정보통신부 소관 연구사업 공고 안내</a></th>
                        <td>연구지원팀</td>
                        <td>2023.03.15</td>
                      </tr>

                      <tr>
                        <td>1</td>
                        <th><a href="#!">[한국소프트웨어산업협회] 2023년 채용확정형 교육과정 상반기 1차 모집</a></th>
                        <td>커리어센터</td>
                        <td>2023.02.28</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>

            </section>
          </div>
        </div>

        <jsp:include page="common/footer.jsp" />
      </body>

      </html>