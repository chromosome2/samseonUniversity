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
                <script src="${contextPath}/js/menu_third.js"></script>
                <script src="${contextPath}/js/mypage_third.js"></script>
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
                                <h3>개인정보</h3>
                                <form action="" method="post" id="privacy_modForm" name="privacy_modForm">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>구분</th>
                                                <td class="td_radio">
                                                    <div class="tbl_input label_div">
                                                        <label for="user_identity1" class="idt_label">
                                                            <input type="radio" name="user_identity"
                                                                id="user_identity1">
                                                            <span class="choose_span">학생</span>
                                                        </label>
                                                        <label for="user_identity2" class="idt_label">
                                                            <input type="radio" name="user_identity"
                                                                id="user_identity2">
                                                            <span class="choose_span">교수</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>학번(아이디)</th>
                                                <td><input class="tbl_input" type="number" value="1111" disabled></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td><input class="tbl_input" type="password" name="pwd"></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input class="tbl_input" type="text" value="홍길동" disabled></td>
                                            </tr>
                                            <tr>
                                                <th>전화번호</th>
                                                <td><input class="tbl_input" type="tel" value="01012341111" name="tel">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td><input class="tbl_input" type="text" value="hong@naver.com"
                                                        name="email"></td>
                                            </tr>
                                            <tr>
                                                <th>주소</th>
                                                <td><input class="tbl_input" type="text" value="서울시 종로구 종로동 77-7"
                                                        name="addr"></td>
                                            </tr>
                                            <tr>
                                                <th>학적 상태</th>
                                                <td><input class="tbl_input" type="text" value="재직" disabled></td>
                                            </tr>
                                            <tr>
                                                <th>학과 명</th>
                                                <td><input class="tbl_input" type="text" value="컴퓨터공학과" disabled></td>
                                            </tr>
                                            <tr>
                                                <th>단과 대학</th>
                                                <td><input class="tbl_input" type="text" value="IT대학" disabled></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="input_submit privacy_submit">
                                        <input class="btn_submit button" type="submit" value="수정하기">
                                        <input class="btn_cancle button" type="reset" value="취소">
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>