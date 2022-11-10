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
                <link rel="stylesheet" href="${contextPath}/css/manage.css">
                <link rel="stylesheet" href="${contextPath}/css/table.css">
                <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
                <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
                <script src="${contextPath}/js/common.js"></script>
                <script src="${contextPath}/js/menu_second.js"></script>
                <script src="${contextPath}/js/mypage_second.js"></script>
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
                            <h3>학생 등록 및 관리</h3>
                            <div class="st_lecture_area">
                                <div class="lt_search_form">
                                    <div class="lt_select">
                                        <label class="lt_label">학년</label>
                                        <div class="lt_inner">
                                            <select name="lt_options" id="lt_options">
                                                <option value="1">1학년</option>
                                                <option value="2">2학년</option>
                                                <option value="3">3학년</option>
                                                <option value="4">4학년</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_select">
                                        <label class="lt_label">학적상태</label>
                                        <div class="lt_inner">
                                            <select name="lt_options" id="lt_options">
                                                <option value="1">재학</option>
                                                <option value="2">휴학</option>
                                                <option value="3">졸업</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_select">
                                        <label class="lt_label">단과</label>
                                        <div class="lt_inner">
                                            <select name="lt_options" id="lt_options">
                                                <option value="1">문과대학</option>
                                                <option value="2">경영대학</option>
                                                <option value="3">정보대학</option>
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
                                                <th>아이디</th>
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
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>102030</td>
                                            <td>김학생</td>
                                            <td>010-1234-5678</td>
                                            <td>qwer0101@naver.com</td>
                                            <td>정보대학</td>
                                            <td>컴퓨터공학과</td>
                                            <td><input type="radio" name="check_stu"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="st_lecture_list lt_apply">
                                <button class="apply_btn"><a href="${contextPath }/admin/add_member.jsp">등록</a></button>
                                <button class="apply_btn">수정</button>
                                <button class="apply_btn">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>