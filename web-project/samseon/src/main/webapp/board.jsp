<%@page import="java.util.Map" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <c:set var="contextPath" value="${pageContext.request.contextPath}" />
        <c:set var="articleList" value="${articleMap.articleList}" />
        <c:set var="cnt" value="${articleMap.totalArticles}" />
        <c:set var="pageSize" value="10" />
        <c:set var="currentPage" value="${articleMap.pageNum}" />
        <% Map articleMap=(Map)request.getAttribute("articleMap"); int
          currentPage=Integer.parseInt(articleMap.get("pageNum").toString()); %>
          <c:set var="section" value="${articleMap.section}" />
          <c:set var="pageNum" value="${articleMap.pageNum}" />
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
            <script src="${contextPath}/js/menu_first.js"></script>
            <title>삼선대학교</title>
            <!-- <script type="text/javascript">
            	window.onload = function() {
            		const search_btn=document.querySelector("#search-btn");
                    search_btn.addEventListener("click", search);
                    function search() {
                        let search_key=document.searchForm.search.value;
                        if(search_key != null || search_key != '' || search_key.length != 0) {
                            $.ajax({
                                type:"post",
                                async:"true",
                                url:"${contextPath}/board/search.do",
                                data:{search:search_key},
                                dataType:"json",
                                success:function(data) {
                                    if(data.searchNotice.length != 0) {
                                        
                                    }else {
                                        alert("검색결과가 없습니다.");
                                    }
                                },
                                error:function(data) {
                                    alert("에러가 발생했습니다.");
                                }
                            });
                        }
                    }
            	}
            </script> -->
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

                          <c:if test="${empty articleList}">
                            <tr>
                              <td colspan="4">공지사항이 없습니다.</td>
                            </tr>
                          </c:if>
                          <c:if test="${!empty articleList}">
                            <c:forEach var="article" items="${articleList}" varStatus="articleNum">
                              <tr>
                                <td>${articleNum.count}</td>
                                <th><a
                                    href="${contextPath}/board/viewArticle.do?articleNo=${article.articleNo}">${article.title}</a>
                                </th>
                                <td>${article.adminDepartment}</td>
                                <td>${article.writeDate}</td>
                              </tr>
                            </c:forEach>
                          </c:if>

                        </tbody>
                      </table>
                      <!-- board search area -->
                      <div id="board-search">
                        <div class="container">
                          <div class="search-window">
                            <form action="${contextPath}/board/search.do" name="searchForm" class="search-form">
                              <div class="search-wrap">
                                <label for="search" class="blind">공지사항 내용 검색</label>
                                <input id="search" type="search" name="search" placeholder="검색어를 입력해주세요."
                                  value="${articleMap.searchKey}">
                                <button type="submit" class="btn btn-dark btn-search" id="search-btn">검색</button>
                              </div>
                              <!-- 새 글 작성 : 관리자에게만 보임 -->
                              <c:if test="${user_level == 'admin'}">
                                <div class="section_write">
                                  <a href="${contextPath}/board/articleForm.do"><input class="btn btn-dark btn-write"
                                      type="button" value="글쓰기"></a>
                                </div>
                              </c:if>
                              <!-- 검색 후 전체글 목록으로 돌아가기 -->
                            </form>
                              <!-- 목록 버튼 form 밖에 위치해야 search.do가 아닌 listArticles.do가 수행됨 -->
                              <a href="${contextPath}/board/listArticles.do"><button type="submit"
                                  class="btn btn-dark btn-list">목록</button></a>
                          </div>
                        </div>
                      </div>

                      <div class="pagination">
                        <ul class="pagination_modal">




                          <!-- 페이징 -->
                          <c:if test="${cnt != 0}">
                            <c:set var="pageCount" value="${cnt / pageSize + (cnt%pageSize==0?0:1)}" />
                            <c:set var="pageBlock" value="10" />
                            <% int startPage=(currentPage-1)/10*10 + 1; %>
                              <c:set var="startPage" value="<%=startPage%>" />
                              <c:set var="endPage" value="${startPage + pageBlock - 1}" />
                              <c:if test="${endPage > pageCount}">
                                <c:set var="endPage" value="${pageCount}" />
                              </c:if>
                              <c:if test="${startPage > pageBlock}">
                                <li class="paging_first"><a class="paging_arrow"
                                    href="${contextPath}/board/listArticles.do?section=${section-1}&pageNum=${startPage-pageBlock}&search=${articleMap.searchKey}">
                                    << </a>
                                </li>
                              </c:if>

                              <c:forEach var="page" begin="${startPage}" end="${endPage}" step="1">
                                <c:if test="${page == currentPage}">
                                  <li class="paging_num paging_active"><a class="num_active"
                                      href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}&search=${articleMap.searchKey}">${page}</a>
                                  </li>
                                </c:if>
                                <c:if test="${page != currentPage}">
                                  <li class="paging_num"><a
                                      href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}&search=${articleMap.searchKey}">${page}</a>
                                  </li>
                                </c:if>
                              </c:forEach>

                              <c:if test="${endPage < pageCount}">
                                <li class="paging_last"><a class="paging_arrow"
                                    href="${contextPath}/board/listArticles.do?section=${section+1}&pageNum=${startPage+pageBlock}&search=${articleMap.searchKey}">>></a>
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

            <jsp:include page="common/footer.jsp" />
          </body>

          </html>