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
                <!-- <link rel="stylesheet" href="${contextPath}/css/table.css"> -->
                <link rel="stylesheet" href="${contextPath}/css/apply_header.css">
                <link rel="stylesheet" href="${contextPath}/css/add_lecture2.css">
                <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
                <script src="${contextPath}/js/common.js"></script>
                <script src="${contextPath}/js/menu_third.js"></script>
                <script src="${contextPath}/js/mypage_third.js"></script>
                <script defer src="${contextPath}/js/privacy.js"></script>
                <title>삼선대학교</title>
                <c:if test="${msg=='info_modified'}">
                    <script type="text/javascript">
                        window.onload = function () {
                            alert("회원정보가 수정되었습니다.");
                        }
                    </script>
                </c:if>
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
                                <h3>개인정보</h3>
                                <form action="${contextPath}/member/modInfo.do" method="post" id="privacy_modForm"
                                    name="privacy_modForm">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>학번</th>
                                                <td><input class="tbl_input" type="number" value="${log_id}" disabled>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td><input id="pwd" class="tbl_input" type="password" name="pwd"></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input class="tbl_input" type="text" value="${studentInfo.name}"
                                                        disabled></td>
                                            </tr>
                                            <tr>
                                                <th>전화번호</th>
                                                <td><input id="phone" class="tbl_input" type="tel"
                                                        value="${studentInfo.phone}" name="tel"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td><input id="email" class="tbl_input" type="text"
                                                        value="${studentInfo.email}" name="email"></td>
                                            </tr>
                                            <tr>
                                                <th>주소</th>
                                                <td><input class="tbl_input" type="text" value="${studentInfo.addr}"
                                                        name="addr"></td>
                                            </tr>
                                            <tr>
                                                <th>학적 상태</th>
                                                <c:if test="${studentInfo.st_cnd == 1}">
                                                    <td><input class="tbl_input" type="text" value="재직" disabled></td>
                                                </c:if>
                                                <c:if test="${studentInfo.st_cnd == 2 }">
                                                    <td><input class="tbl_input" type="text" value="휴학" disabled></td>
                                                </c:if>
                                                <c:if test="${studentInfo.st_cnd == 3 }">
                                                    <td><input class="tbl_input" type="text" value="졸업" disabled></td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <th>학과 명</th>
                                                <td><input class="tbl_input" type="text" value="${studentInfo.m_name}"
                                                        disabled></td>
                                            </tr>
                                            <tr>
                                                <th>단과 대학</th>
                                                <td><input class="tbl_input" type="text" value="${studentInfo.dan}"
                                                        disabled></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="input_submit privacy_submit">
                                        <input class="btn_submit button btn_privacy" type="submit" value="수정하기">
                                        <input class="btn_cancle button" type="reset" value="취소">
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>