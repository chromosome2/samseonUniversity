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
    <!-- css -->
    <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard-dynamic-subset.css" />
    <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="${contextPath}/css/common.css">
    <link rel="stylesheet" href="${contextPath}/css/viewScores.css">
    <!-- JavaScript -->
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script defer src="${contextPath}js/table.js"></script>
    <script src="${contextPath}/js/menu_third.js"></script>
    <script src="${contextPath}/js/mypage_first.js"></script>
    <title>삼선대학교</title>
    <script>
    	function search_seme(){
    		let select=document.getElementById('search_scores');
    		let value=select.options[select.selectedIndex].value;
    		$('.btn_search').click(function(){
    			if(value== '2'){
    	    		alert('2학기 정보가 없습니다.');
    	    	}else{
    	    		$('.btn_search').attr('onclick',"location.href='${contextPath}/view/viewScores.do'");
    	    	}
    		});
    	}
    </script>
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
                                    <div>
                                        <h3>전체 성적 조회</h3>
                                    </div>

                                </div>

                                <div class="my_info tbl_header">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>이름</th>
                                                <th>학번</th>
                                                <th>학과명</th>
                                                <th>단과대학</th>
                                                <th>총 취득학점/졸업학점</th>
                                                <th>학적 상태</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="tbl_content">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <c:choose>
                                           		<c:when test="${empty student_info }">
                                           			<tr>
                                           				<td colspan="8">
                                           					<p align="center">등록된 학생정보가 없습니다.</p>
                                           				</td>
                                           			</tr>
                                           		</c:when>
                                           		<c:when test="${!empty student_info }">
                                           			<tr>
                                       					<td>${student_info.st_name }</td>
                                       					<td>${student_info.st_id }</td>
                                       					<td>${student_info.m_name}</td>
                                       					<td>${student_info.dan }</td>
	                                                    <td>${student_info.t_pt }/128</td>
	                                                    <td>${student_info.st_cnd }</td>
                                       				</tr>
                                           		</c:when>
                                           	</c:choose>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="my_scores_list">
                                    <div class="my_info tbl_header">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>NO</th>
                                                    <th>학기</th>
                                                    <th>과목코드</th>
                                                    <th>과목명</th>
                                                    <th>출석률</th>
                                                    <th>학점</th>
                                                    <th>성적</th>
                                                    <th>수료여부</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="tbl_content">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            	<c:choose>
                                            		<c:when test="${empty scoresList }">
                                            			<tr>
                                            				<td colspan="8">
                                            					<p align="center">수강한 수업이 없습니다.</p>
                                            				</td>
                                            			</tr>
                                            		</c:when>
                                            		<c:when test="${!empty scoresList }">
                                            			<c:forEach var="score" items="${scoresList }" varStatus="scoreNum">
                                            				<tr>
                                            					<td>${scoreNum.count }</td>
                                            					<td>2022.${score.cl_sem }</td>
                                            					<td>${score.cl_id}</td>
                                            					<td>${score.cl_name }</td>
			                                                    <td><fmt:formatNumber value="${score.cl_check/30}" pattern="0.0%"/></td>
			                                                    <td>${score.cl_pt}</td>
			                                                    <td>${score.s_final }</td>
			                                                    <td>${score.comp_subject}</td>
                                            				</tr>
                                            			</c:forEach>
                                            		</c:when>
                                            	</c:choose>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="table_under">
                                    <div class="result_area">
                                        <h3>총 학점: </h3>
                                        <h3><span>${student_info.t_pt}/128</span></h3>
                                    </div>
                                    <div class="search_area">
                                        <select id="search_scores" name="search_scores" onchange="search_seme();">
                                            <option value="total">전체</option>
                                            <option value="1">2022년도 1학기</option>
                                            <option value="2">2022년도 2학기</option>
                                        </select>
                                        <input type="button" value="보기" class="btn_result btn_search">
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
