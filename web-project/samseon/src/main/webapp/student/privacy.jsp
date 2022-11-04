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
    <c:if test="${msg=='info_modified'}">
		<script type="text/javascript">
			window.onload=function() {
				alert("회원정보가 수정되었습니다.");
			}
		</script>
	</c:if>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

        <div id="middle_area">
            <div id="main_menu_back">
                <jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
                <div class="contents_wrapper">
                    <h2>개인정보</h2>
                    <form action="${contextPath}/member/modInfo.do" method="post" id="privacy_modForm" name="privacy_modForm">
                        <table border="1">
                            <tr>
                                <th>학번</th>
                                <td><input type="number" value="${log_id}" disabled></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="password" name="pwd"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" value="${studentInfo.name}" disabled></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input type="tel" value="${studentInfo.phone}" name="tel"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" value="${studentInfo.email}" name="email"></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td><input type="text" value="${studentInfo.addr.trim()}" name="addr"></td>
                            </tr>
                            <tr>
                                <th>학적 상태</th>
                                <c:if test="${studentInfo.st_cnd == 1}">
	                                <td><input type="text" value="재직" disabled></td>                                
                                </c:if>
                                <c:if test="${studentInfo.st_cnd == 2 }">
                                    <td><input type="text" value="휴학" disabled></td>
                                </c:if>
                                <c:if test="${studentInfo.st_cnd == 3 }">
                                	<td><input type="text" value="졸업" disabled></td>
                                </c:if>
                            </tr>
                            <tr>
                                <th>학과 명</th>
                                <td><input type="text" value="${studentInfo.m_name}" disabled></td>
                            </tr>
                            <tr>
                                <th>단과 대학</th>
                                <td><input type="text" value="${studentInfo.dan}" disabled></td>
                            </tr>
                        </table>
                        <input type="submit" value="수정하기">
                        <input type="reset" value="취소">
                    </form>
                </div>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>