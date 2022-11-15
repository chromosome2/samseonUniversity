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
                <link rel="stylesheet" href="${contextPath}/css/apply_header.css">
                <link rel="stylesheet" href="${contextPath}/css/add_lecture2.css">
                <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
                <script src="${contextPath}/js/common.js"></script>
                <script src="${contextPath}/js/menu_second.js"></script>
                <script>
                	$(function () {
                		$('.my_page_menu').css('display','inline-block');
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
                        <section class="form_section">
                            <div class="contents_wrapper">
                                <h3>교수 정보 수정</h3>
                                <form action="${contextPath }/manage/mod_prof.do" method="post" id="privacy_modForm" name="privacy_modForm">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>구분</th>
                                                <td class="td_radio">
                                                    <div class="tbl_input label_div">
                                                        <label for="user_identity1" class="idt_label">
                                                            <input type="radio" name="user_identity"
                                                                id="user_identity1" disabled>
                                                            <span class="choose_span">학생</span>
                                                        </label>
                                                        <label for="user_identity2" class="idt_label">
                                                            <input type="radio" name="user_identity"
                                                                id="user_identity2" checked>
                                                            <span class="choose_span">교수</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <c:choose>
                                            	<c:when test="${prof_info.check_sign eq -1 }">
                                            		<tr>
		                                                <th>학번(아이디)</th>
		                                                <td><input name="pf_id" class="tbl_input readonly" type="number" value="${prof_info.pf_id}" readonly></td>
		                                            </tr>
		                                            <tr>
		                                                <th>단과 대학</th>
		                                                <td><input name="dan" class="tbl_input" type="text" value="${prof_info.dan}" ></td>
		                                            </tr>
		                                            <tr>
		                                                <th>학과 명</th>
		                                                <td><input name="m_name" class="tbl_input" type="text" value="${prof_info.m_name}" ></td>
		                                            </tr>
		                                            <input type="hidden" name="check_sign" value="-1">
                                            	</c:when>
                                            	<c:when test="${prof_info.check_sign eq 0 }">
                                            		<tr>
		                                                <th>학번(아이디)</th>
		                                                <td><input name="pf_id" class="tbl_input" type="number" value="${prof_info.pf_id}" readonly></td>
		                                            </tr>
		                                            <tr>
		                                                <th>이름</th>
		                                                <td><input name="pf_name" class="tbl_input" type="text" value="${prof_info.pf_name}"></td>
		                                            </tr>
		                                            <tr>
		                                                <th>전화번호</th>
		                                                <td><input name="pf_ph" class="tbl_input" type="text" value="${prof_info.pf_ph}"></td>
		                                            </tr>
		                                            <tr>
		                                                <th>이메일</th>
		                                                <td><input name="pf_email" class="tbl_input" type="text" value="${prof_info.pf_email}"></td>
		                                            </tr>
		                                            <tr>
		                                                <th>단과 대학</th>
		                                                <td><input name="dan" class="tbl_input" type="text" value="${prof_info.dan}" ></td>
		                                            </tr>
		                                            <tr>
		                                                <th>학과 명</th>
		                                                <td><input name="m_name" class="tbl_input" type="text" value="${prof_info.m_name}" ></td>
		                                            </tr>
		                                            <input type="hidden" name="check_sign" value="0">
                                            	</c:when>
                                            </c:choose>
                                            
                                        </tbody>
                                    </table>
                                    <div class="input_submit privacy_submit">
                                        <input class="btn_submit button" type="submit" value="수정하기">
                                        <input class="btn_cancle button" type="button" value="취소" onclick="history.go(-1)"><%--뒤로 가기 --%>
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>