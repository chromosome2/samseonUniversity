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
          <script>
          	function toList() {  //공지사항 목록 보기
          		location.href="${contextPath}/board/listArticles.do";
          	}
          	function fn_modify(url, articleNo) {  //공지사항 수정
          		let form=document.createElement("form");
          		form.setAttribute("method","post");
          		form.setAttribute("action",url);
          		let articleNoInput=document.createElement("input");
          		articleNoInput.setAttribute("type","hidden");
          		articleNoInput.setAttribute("name","articleNo");
          		articleNoInput.setAttribute("value",articleNo);
          		form.appendChild(articleNoInput);
          		document.body.appendChild(form);
          		form.submit();
          	}
          	function fn_removeNotice(url, articleNo) {  //공지사항 삭제
          		let form=document.createElement("form");
          		form.setAttribute("method","post");
          		form.setAttribute("action",url);
          		let articleNoInput=document.createElement("input");
          		articleNoInput.setAttribute("type","hidden");
          		articleNoInput.setAttribute("name","articleNo");
          		articleNoInput.setAttribute("value",articleNo);
          		form.appendChild(articleNoInput);
          		document.body.appendChild(form);
          		form.submit();
          	}
          </script>

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
                          <th scope="col" class="th_title_txt">${article.title}
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="th_title_02">작성일</td>
                          <td class="th_title_txt">${article.writeDate}</td>
                        </tr>
                        <tr>
                          <td class="th_title_02">공지부서</td>
                          <td class="th_title_txt">${article.adminDepartment}</td>
                        </tr>
                        <tr>
                          <td colspan="2" class="th_write" height="300px">
                            <div style="white-space: pre-wrap; text-align: justify !important; width: 800px; padding: 22px;">${article.content}</div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                      <input type="button" value="글 목록" class="btn_result" onclick="toList()">
                      <c:if test="${user_level == 'admin'}">
                      <input type="button" value="수정" class="btn_result" onclick="fn_modify('${contextPath}/board/modNoticeForm.do', ${article.articleNo})">
                      <input type="button" value="삭제" class="btn_result" onclick="fn_removeNotice('${contextPath}/board/removeNotice.do', ${article.articleNo})">
                      </c:if>
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