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
		  <script type="text/javascript">
		  	function toList() {
		  		location.href="${contextPath}/board/listArticles.do";
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
                  <form action="${contextPath}/board/modNotice.do" method="post">
                  
                    <table class="board-table write_table">
                      <thead>
                        <tr>
                          <th scope="col" class="th_title_02">제목</th>
                          <th scope="col" class="th_title_txt"><input type="text" name="title" value="${notice.title}" required>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="2" class="th_write" height="300px">
                            <textarea name="content" id="text_write" cols="30" rows="10">${notice.content}</textarea>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <input type="hidden" name="articleNo" value="${notice.articleNo}">
                    <div class="section_sub">
                      <input type="submit" value="수정" class="btn_result">
                      <input type="reset" value="취소" class="btn_result">
                      <input type="button" value="글 목록" class="btn_result" onclick="toList()">
                    </div>
                    
                  </form>
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