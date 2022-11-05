<%@page import="java.util.Map" %>
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
          <link rel="stylesheet" href="${contextPath}/css/table.css">
          <link rel="stylesheet" href="${contextPath}/css/board.css">
          <link rel="stylesheet" href="${contextPath}/css/board_detail.css">
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
                <div id="board-list">
                  <div class="container">
                    <table class="board-table">
                      <thead>
                        <tr>
                          <th scope="col" class="th_title_02">제목</th>
                          <th scope="col" class="th_title_txt">[고용노동부] 원데이실무톡 4기_콘텐츠 마케팅 직무편
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="th_title_02">작성일</td>
                          <td class="th_title_txt">2023-03-21 16:54:32</td>
                        </tr>
                        <tr>
                          <td class="th_title_02">공지부서</td>
                          <td class="th_title_txt">커리어개발센터</td>
                        </tr>
                        <tr>
                          <td class="th_title_02">글쓴이</td>
                          <td class="th_title_txt">최정은</td>
                        </tr>
                        <tr>
                          <td colspan="2" class="th_write" height="300px">
                            <p>▷ 주최사/ 활동명
                              (주)오픈놀 / 원데이실무톡 4기 (콘텐츠 마케팅 편)
                              <br>
                              <br>
                              ▷활동내용
                              1) 콘텐츠 마케팅 파헤치기
                              - 직무 강연과 Q&A를 통한 현직자와 실시간 라이브 톡
                              <br>
                              <br>
                              2) 기획안 작성법
                              - 학교, 회사 어디서나 활용할 수 있는 기획안 작성법
                              <br>
                              <br>
                              3) 우수 중소기업 소개 (기업명:(주)크리에이터노믹, 서비스명: 디지털 명함 '슬라이스')

                              - 기업 소개 및 실무 프로젝트 수행을 위한 과제 소개 (Q&A포함)
                              <br>
                              <br>
                              4) 기업 실무 프로젝트
                              - '콘텐츠 마케팅' 직무 실무 프로젝트 (온라인)
                              ※프로젝트명: 디지털 명함 '슬라이스'의 신규 고객 유치를 위한 마케팅 방안

                              <br>
                              <br>
                              5) 청년 고용 정책 안내
                              - 청년을 위한 꿀팁! 청년 고용 정책 소개


                              ▷모집기간
                              모집 마감 : ~ 2022.11.10.(목) 23:59까지
                              합격자 발표 : 2022.11.11.(금) <합격자에 한하여 개별 MMS연락>
                                <br>


                                ▷모집대상
                                콘텐츠 마케팅 직무에 관심 있는 대학생 및 취업 준비생 40명 이내

                                <br>
                                ▷참가비용
                                무료
                                <br>

                                ▷교육장소
                                - 온라인 진행 (Zoom활용)

                                <br>
                                ▷교육일시
                                2022.11.14.(월) <1일 교육>

                                  <br>
                                  ▷활동혜택
                                  - 고용노동부 수료증(1일 교육 수료자 대상)
                                  - 참가 기업 수료증(실무 프로젝트 수료자)
                                  - 콘텐츠 마케팅 실무 프로젝트 경험
                                  - 청년 지원 사업 안내 및 연계
                                  - 소정의 기념품
                                  <br>
                                  <br>
                                  ▷ 문의처
                                  - 전화 : 010-4670-3056
                                  - 메일 : help@miniintern.com
                            </p>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <footer id="footer">
            <div id="footerInner">
              <a href="#" class="privacy_policy">개인정보 처리방침</a>
              <address>
                <span>서울시 종로구 종로동 11-1 삼선대학교</span>
                <span>Tel : 02)333-1234</span>
              </address>
            </div>
          </footer>
          </div>
        </body>

        </html>