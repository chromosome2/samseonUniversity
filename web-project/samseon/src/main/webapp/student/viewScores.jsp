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
    <link rel="stylesheet" href="${contextPath}/css/table.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <title>삼선대학교</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

        <div id="middle_area">
            <div id="main_menu_back">
                <jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
                <div class="contents_wrapper">
                    <h3>전체 성적 조회</h3>
                    <div class="my_info">
                        <table border="1">
                            <tr>
                                <th>이름</th>
                                <th>학번</th>
                                <th>학과명</th>
                                <th>단과대학</th>
                                <th>총 취득학점/졸업학점</th>
                                <th>학적 상태</th>
                            </tr>
                            <tr>
                                <td>조수진</td>
                                <td>202211111</td>
                                <td>컴퓨터공학과</td>
                                <td>IT대학</td>
                                <td>3/36</td>
                                <td>재직</td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="search_area">
                        <select id="search_scores" name="search_scores">
                            <option value="total">전체</option>
                            <option value="1">2022년도 1학기</option>
                            <option value="2">2022년도 2학기</option>
                        </select>
                        <input type="button" value="보기">
                    </div>

                    <div class="my_scores_list">
                        <table border="1">
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
                            <tr>
                                <td>1</td>
                                <td>2022.1</td>
                                <td>123456</td>
                                <td>컴퓨터프로그래밍기초</td>
                                <td>90%</td>
                                <td>3</td>
                                <td>A</td>
                                <td>수료</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2022.1</td>
                                <td>333333</td>
                                <td>자바프로그래밍2</td>
                                <td>50%</td>
                                <td>3</td>
                                <td>F</td>
                                <td>미수료</td>
                            </tr>
                            <tr>
                                <td colspan="8">총 학점 : 3</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>