<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
                <link rel="stylesheet" href="${contextPath}/css/manage.css">
                <link rel="stylesheet" href="${contextPath}/css/table.css">
                <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
                <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
                <script src="${contextPath}/js/common.js"></script>
                <script src="${contextPath}/js/menu_second.js"></script>
                <script src="${contextPath}/js/mypage_first.js"></script>
                <script>
                    $(function () {
                        $('.my_page_menu').css('display', 'inline-block');
                    });
                </script>
                <title>삼선대학교</title>
            </head>

            <body>
                <jsp:include page="../common/header.jsp" />

                <div id="middle_area">
                    <div id="main_menu_back">
                        <jsp:include page="../common/menu.jsp" />
                    </div>

                    <div id="contents_area">
                        <div class="contents_wrapper">
                            <h3>교수 등록 및 관리</h3>
                            <div class="st_lecture_area">
                                <div class="lt_search_form">
                                    <div class="lt_select">
                                        <label class="lt_label">단과</label>
                                        <div class="lt_inner">
                                            <select name="lt_options" id="lt_options">
                                                <option value="1">문과대학</option>
                                                <option value="2">경영대학</option>
                                                <option value="3">공학대학</option>
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
                                                <option value="4">사회학과</option>
                                                <option value="5">경영학과</option>
                                                <option value="6">신문방송학과</option>
                                                <option value="7">미디어학과</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_input_text">
                                        <div class="lt_select">
                                            <div class="lt_inner search_select">
                                                <select name="lt_options" id="lt_options">
                                                    <option value="1">이름</option>
                                                    <option value="2">전화번호</option>
                                                    <option value="3">이메일</option>
                                                    <option value="4">학번</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div>
                                            <input type="text">
                                        </div>
                                        <div class="lt_search_submit lt_select">
                                            <button class="search_btn">검색</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tbl_content">
                                <div class="st_lecture_list tbl_header">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>학번</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>
                                                <th>단과대학</th>
                                                <th>학과명</th>
                                                <th>선택</th>

                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                    	<c:choose>
                                       		<c:when test="${empty prof_list }">
                                       			<tr>
                                       				<td colspan="8">
                                       					<p align="center">등록된 교수 정보가 없습니다.</p>
                                       				</td>
                                       			</tr>
                                       		</c:when>
                                       		<c:when test="${!empty prof_list }">
                                       			<c:forEach var="prof" items="${prof_list }" varStatus="listNum">
                                       				<tr>
                                       					<td>${listNum.count }</td>
                                       			<c:if test="${prof.check_sign eq -1 }">
                                       					<td>${prof.pf_id }</td>
                                       					<td></td>
                                       					<td></td>
														<td></td>
														<td>${prof.dan}</td>
														<td>${prof.m_name}</td>
														<td><input type="radio" name="check_prof"></td>
                                       				</tr>
                                       			</c:if>
                                       			<c:if test="${prof.check_sign eq 0 }">
                                       					<td>${prof.pf_id }</td>
                                       					<td>${prof.pf_name}</td>
                                       					<td>${fn:substring(prof.pf_ph,0,3)}-${fn:substring(prof.pf_ph,3,7)}-${fn:substring(prof.pf_ph,7,11)}</td>
														<td>${prof.pf_email}</td>
														<td>${prof.dan}</td>
														<td>${prof.m_name}</td>
														<td><input type="radio" name="check_prof"></td>
                                       				</tr>
                                       			</c:if>
                                       				
                                       			</c:forEach>
                                       		</c:when>
                                       	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="st_lecture_list lt_apply">
                                <button class="apply_btn"><a href="${contextPath }/admin/add_member.jsp">등록</a></button>
                                <button class="apply_btn"><a href="">수정</a></button>
                                <button class="apply_btn"><a href="">삭제</a></button>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>