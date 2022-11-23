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
                <script src="${contextPath}/js/mypage_second.js"></script>
                <script defer src="${contextPath}/js/privacy.js"></script>
                <script>
                    $(function () {
                        $('.my_page_menu').css('display', 'inline-block');
                        
                      //학과명이 collegetbl에 존재하는지
	                	let m_name_input=document.getElementById("m_name");
						let m_name_check=true;
	                	
	                	$('#m_name').change(function(){
	                		m_name_check=false;
	                	})
	                	
	                	m_name_input.onblur = function(e){
	                		let m_name=$('#m_name').val();
	                		$.ajax({
	                			type:"post",
	                			async:true,
	                			dataType:"text",
	                			url:"${contextPath}/manage/check_m_name.do",
	                			data:{m_name:m_name},
	                			success:function(data,textStatus){
	                				if(data=='usable'){
	                					m_name_check=true;
	                				}else{
	                					alert("사용 불가능한 학과명입니다.");
	                					m_name_check=false;
	                				}
	                			},
	                			error:function(data, textStatus){
	                				alert("에러발생~!");
	                			}
	                		})
	                	};
	                	
	                	$('.btn_submit').on('click',function (e){
	                		if(m_name_check==false){
	                			e.preventDefault();
	                			alert('학과 명을 변경해주세요.');
	                		}
	                	});
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
                                <h3>학생 정보 수정</h3>
                                <form action="${contextPath }/manage/mod_st.do" method="post" id="privacy_modForm"
                                    name="privacy_modForm">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>구분</th>
                                                <td class="td_radio">
                                                    <div class="tbl_input label_div">
                                                        <label for="user_identity1" class="idt_label">
                                                            <input type="radio" name="user_identity" id="user_identity1"
                                                                checked>
                                                            <span class="choose_span" checked>학생</span>
                                                        </label>
                                                        <label for="user_identity2" class="idt_label">
                                                            <input type="radio" name="user_identity" id="user_identity2"
                                                                disabled>
                                                            <span class="choose_span">교수</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <c:choose>
                                                <c:when test="${st_info.check_sign eq -1 }">
                                                    <tr>
                                                        <th>학번(아이디)</th>
                                                        <td><input name="st_id" class="tbl_input" type="number"
                                                                value="${st_info.st_id}" readonly></td>
                                                    </tr>
                                                    <tr>
                                                        <th>단과 대학</th>
                                                        <td><input name="dan" class="tbl_input" type="text"
                                                                value="${st_info.dan}"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>학과 명</th>
                                                        <td><input name="m_name" id="m_name" class="tbl_input" type="text"
                                                                value="${st_info.m_name}"></td>
                                                    </tr>
                                                    <input type="hidden" name="check_sign" value="-1">
                                                </c:when>
                                                <c:when test="${st_info.check_sign eq 0 }">
                                                    <tr>
                                                        <th>학번(아이디)</th>
                                                        <td><input name="st_id" class="tbl_input" type="number"
                                                                value="${st_info.st_id}" readonly></td>
                                                    </tr>
                                                    <tr>
                                                        <th>이름</th>
                                                        <td><input name="st_name" class="tbl_input" type="text"
                                                                value="${st_info.st_name}"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>전화번호</th>
                                                        <td><input id="phone" name="st_ph" class="tbl_input" type="text"
                                                                value="${st_info.st_ph}"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>이메일</th>
                                                        <td><input id="email" name="st_email" class="tbl_input"
                                                                type="text" value="${st_info.st_email}"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>단과 대학</th>
                                                        <td><input name="dan" class="tbl_input" type="text"
                                                                value="${st_info.dan}"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>학과 명</th>
                                                        <td><input name="m_name" id="m_name" class="tbl_input" type="text"
                                                                value="${st_info.m_name}"></td>
                                                    </tr>
                                                    <input type="hidden" name="check_sign" value="0">
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <div class="input_submit privacy_submit">
                                        <input class="btn_submit button btn_modify" type="submit" value="수정하기">
                                        <input class="btn_cancle button" type="button" value="취소"
                                            onclick="history.go(-1)">
                                        <%--뒤로 가기 --%>
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>