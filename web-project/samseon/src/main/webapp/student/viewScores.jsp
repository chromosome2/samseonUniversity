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
    <div id="wrapper">
        <header>
            <div class="head1">
                <div class="black_head1"></div>
                <div class="header_contents">
                    <div class="white_head1">
                        <h2 class="hidden">대학교 로고</h2>
                        <a href="${contextPath}/board.jsp">
                            <img src="${contextPath}/images/logo.png" alt="삼선대학교 로고">
                            <span>삼선대학교</span>
                        </a>
                    </div>
                    <span class="st_name">${studentInfo.m_name} ${studentInfo.name}님</span>
                    <ul class="mini_menu">
                        <li><a href="#">학교 서비스</a>
                            <ul class="service_menu">
                                <li><a href="#">대학홈페이지</a></li>
                                <li><a href="#">도서관</a></li>
                                <li><a href="#">총학생회</a></li>
                                <li><a href="#">학생생활상담소</a></li>
                                <li><a href="#">취업정보센터</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:choose>
			          <c:when test="${!empty isLogin && isLogin == true}">
				      	<a href="${contextPath}/member/logout.do" class="btn_logout">로그아웃</a>     
			          </c:when>
			          <c:otherwise>
			          	<a href="${contextPath}/index.jsp" class="btn_logout">로그인</a>
			          </c:otherwise>
		         	 </c:choose>
                </div>
            </div>
            <div class="head2">
            </div>
            <div class="head3">
            </div>
        </header>

        <div id="middle_area">
            <div id="main_menu_back">
                <nav>
                    <h2 class="hidden">메인메뉴</h2>
                    <ul class="main_menu">
                        <li><a href="${contextPath}/board.jsp" class="menu_title">공지사항</a></li>
                        <li><a href="${contextPath}/student/main_apply_lectures.jsp" class="menu_title">수강신청</a></li>
                        <li class="my_page point"><div class="my_page_click_area"><a href="#" class="menu_title">마이페이지</a></div>
                            <ul class="my_page_menu">
                                <li><a href="${contextPath}/student/viewScores.jsp" class="mypage_point">전체성적 조회</a></li>
                                <li><a href="${contextPath}/student/viewMyLectures_ST.jsp">수강중인 과목 조회</a></li>
                                <li><a href="${contextPath}/student/privacy_check.jsp">개인정보</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
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

        <footer id="footer">
            <div id="footerInner">
                <a href="#" class="privacy_policy">개인정보 처리방침</a>
                <address>
                    <span>서울시 종로구 종로동 11-1 삼선대학교</span>
                    <span>Tel : 02)333-1234</span>
                </address>
            </div>
        </footer>
    </div>
</body>
</html>