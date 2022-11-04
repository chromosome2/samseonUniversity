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
    <link rel="stylesheet" href="${contextPath}/css/privacy_check.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script src="${contextPath}/js/menu_third.js"></script>
    <script src="${contextPath}/js/mypage_third.js"></script>
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
                    <p class="privacy_title">※ 개인정보 수정</p>
                    <form action="${contextPath}/member/checkPwd.do" method="post" id="pwd_checkForm" name="pwd_checkForm">
                        <div class="password_check_area">
                            <h3>비밀번호 재확인</h3>
                            <p>안전한 정보보호를 위하여 비밀번호를 다시 한번 확인합니다.<br>비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.</p>
                            <input type="password" class="pwd_check_box" name="pwd" placeholder="비밀번호">
                        </div>
                        <input type="submit" value="확인">
                    </form>
                </div>
            </div>
        </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
</html>