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
	<script src="${contextPath}/js/menu_second.js"></script>
	<script src="${contextPath}/js/table.js"></script>
    <title>삼선대학교</title>
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
                <h3>${cl_name} 공지사항</h3>
              </div>
            </div>
            <div id="board-list">
              <div class="container">
              <form action="${contextPath}/board/writeNotice.do" method="post">
              
                <table class="board-table write_table">
                  <thead>
                    <tr>
                      <th scope="col" class="th_title_02">제목</th>
                      <th scope="col" class="th_title_txt"><input type="text" class="title_input" name="title" placeholder="제목을 입력하세요" required>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td colspan="2" class="th_write" height="300px">
                        <textarea name="content" id="text_write" cols="30" rows="10"></textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
                
                <div class="section_sub">
                  <input type="submit" value="작성" class="btn_result">
                  <input type="reset" value="취소" class="btn_result">
                </div>
                
              </form>
              </div>
            </div>
          </section>
        </div>
      </div>


        <%-- <div id="middle_area">
            <div id="main_menu_back">
				<jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
            	<section class="contents_wrapper">
            		<div class="table_header">
            			<h3>수업 공지사항 등록</h3>
            		</div>
            		<div class="tbl_header">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<thead>
            					<tr>
            						<th>ID</th><td>(ID)</td>
            						<th>작성자</th><td>(작성자)</td>
            						<th>강의 이름</th><td>(강의 이름)</td>
            					</tr>
            				</thead>
            			</table>
            		</div>
            		<div class="tbl_content">
            			<table border="0" cellpadding="0" cellspacing="0">
            				<tbody>
   								<tr>
	           						<td>제목</td>
									<td><input type="text" name="nt_title"></td>
	           					</tr>
	           					<tr>
									<td><input type="text" name="nt_content"></td>
	           					</tr>
            				</tbody>
            			</table>
            		</div>
            		<input class="btn_submit button" type="submit" value="등록하기">
                    <a href="${contextPath}/prof/lecture_board.jsp" class="btn_cancle button">취소</a>
            	</section>
            </div>
        </div> --%>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>