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
    <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script src="${contextPath}/js/menu_third.js"></script>
	<script src="${contextPath}/js/pf_menu.js"></script>
	<script src="${contextPath}/js/table.js"></script>
    <title>삼선대학교</title>
    <style>
    	input{
    		width : 50px;
    	}
    </style>
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
        		    <h3>컴퓨터개론 및 실습</h3>
       	   </div>
           <div>
            <button class="move_attend"><a href="${contextPath}/prof/manage_attend.jsp">출석등록</a>
           </div>
       	   <form action="${contextPath}/" method="post" id="frm_add_score" name="frm_add_score">
            <div class="tbl_header">
              <table border="0" cellpadding="0" cellspacing="0">
                <thead>
                  <tr class="tr_header">
                    <td colspan="9" class="3">수업 관리(학생, 출석, 성적 관리)</td>
                  </tr>
                  <tr>
                    <th>NO</th>
                    <th>학생 이름</th>
                    <th>학생 학번</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>출석률</th>
                    <th>중간 점수</th>
                    <th>기말 점수</th>
                    <th>최종 성적</th>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="tbl_content">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
	            					<%--<c:choose>
	            						<c:when test="${empty}">
	            							<tr class="td_none">
	            								<td colspan="9">
	            									수업을 듣는 학생이 없습니다.
	            								</td>
	            							</tr>
	            						</c:when>
	            						<c:when test="${!empty  }">
	            							<c:forEach var="" items="${}"> --%>
	            								<tr>
				            						<td>1</td>
				            						<td>홍길동</td>
				            						<td>1111</td>
				            						<td>01011112222</td>
				            						<td>hong@naver.com</td>
				            						<td>55%</button></td>
				            						<td><input type="number" value="" name="s_first"></td><%-- value값 = 기존 성적값 --%>
				            						<td><input type="number" value="" name="s_second"></td>
				            						<td>A+</td><%--최종 성적(s_final)을 사용하여 알바펫점수를 매김. --%>
				            					</tr>
	            							<%--</c:forEach>
	            						</c:when>
	            					</c:choose> --%>
	            				</tbody>
          				    </table>
         				   </div>
         				   <div class="class_submit">
          					    <input class="btn_submit button" type="submit" value="등록하기">
          					    <button class="btn_submit"><a href="${contextPath} /prof/my_lecture.jsp" class="btn_cancle button">취소</a></button>
           				 </div>
         			 </form>
            		
            	</section>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>