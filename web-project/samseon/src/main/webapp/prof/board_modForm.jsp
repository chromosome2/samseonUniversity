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
    <%-- <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css"> --%>
    <link rel="stylesheet" href="${contextPath}/css/table.css">
    <link rel="stylesheet" href="${contextPath}/css/board.css">
    <link rel="stylesheet" href="${contextPath}/css/board_detail.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
	<script src="${contextPath}/js/menu_third.js"></script>
	<script src="${contextPath}/js/table.js"></script>
	<script src="${contextPath}/js/mypage_second.js"></script>
    <title>삼선대학교</title>
    <script type="text/javascript">
		  	function toList() {
		  		location.href="${contextPath}/professor/lecture_board_list.do?cl_id=${notice.cl_id}";
		  	}
		  </script>
    <c:if test="${msg == 'modified'}">
    	<script type="text/javascript">
    		alert('공지가 수정되었습니다.');
    	</script>
    </c:if>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

	<div id="middle_area">
		<div id="main_menu_back">
	  		<jsp:include page="../common/menu.jsp" />
		</div>

	<div id="contents_area">
          <section class="notice contents_wrapper">
            <div class="page-title">
              <div class="container">
                <h3>&lt;${notice.cl_name}&gt; 공지사항</h3>
              </div>
            </div>
            <div id="board-list">
              <div class="container">
              <form action="${contextPath}/professor/modNotice.do" method="post">
              
                <table class="board-table write_table">
                  <thead>
                    <tr>
                      <th scope="col" class="th_title_02">제목</th>
                      <th scope="col" class="th_title_txt"><input type="text" class="title_input" name="title" value="${notice.nt_title }" required>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td colspan="2" class="th_write" height="300px">
                        <textarea name="content" id="text_write" cols="30" rows="10">${notice.nt_content}</textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
                
                <div class="section_sub">
                	<input type="hidden" name="nt_id" value="${notice.nt_id}">
                  <input type="submit" value="작성" class="btn_result">
                  <input type="reset" value="초기화" class="btn_result">
                  <input type="button" value="글 목록" class="btn_result" onclick="toList()">
                </div>
                
              </form>
              </div>
            </div>
          </section>
        </div>
      </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>