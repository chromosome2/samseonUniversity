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
                		//서브 메뉴 보이게 설정
                		$('.my_page_menu').css('display','inline-block');
                		
                		//교수, 학생 코드 중복체크
                		let id_input=document.getElementById("id");
	                	let id_check=false;
	                	let id_length_check=false;
	                	
	                	id_input.onblur = function(e){
	                		let id=$('#id').val();
	                		if(id.length==8){
	                			id_length_check=true;
	                			$.ajax({
		                			type:"post",
		                			async:true,
		                			dataType:"text",
		                			url:"${contextPath}/manage/check_id.do",
		                			data:{id:id},
		                			success:function(data,textStatus){
		                				if(data=='usable'){
		                					id_check=true;
		                				}else{
		                					alert("사용 불가능한 학번(ID)입니다.");
		                					id_check=false;
		                				}
		                			},
		                			error:function(data, textStatus){
		                				alert("에러발생~!");
		                			}
		                		});
	                		}else{
	                			alert("학번은 8자리입니다.");
	                		}
	                		
	                	};
	                	
	                	//학과명이 collegetbl에 존재하는지
	                	let m_name_input=document.getElementById("m_name");
	                	let m_name_check=false;
	                	
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
	                		if(id_check==false || id_length_check==false){
	                			e.preventDefault();
	                			alert('학번을 변경해주세요.');
	                		}
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
                                <h3>교수, 학생 등록</h3>
                                <form action="${contextPath}/manage/add_member.do" method="post" id="add_memberForm" name="add_memberForm">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>구분</th>
                                                <td class="td_radio">
                                                    <div class="tbl_input label_div">
                                                        <label for="user_identity1" class="idt_label">
                                                            <input type="radio" name="user_level"
                                                                id="user_identity1" value="student" required>
                                                            <span class="choose_span">학생</span>
                                                        </label>
                                                        <label for="user_identity2" class="idt_label">
                                                            <input type="radio" name="user_level"
                                                                id="user_identity2" value="professor">
                                                            <span class="choose_span">교수</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>학번(아이디)</th>
                                                <td><input id="id" class="tbl_input" type="number" name="id" required></td>
                                            </tr>
                                            <tr>
                                                <th>단과 대학</th>
                                                <td><input class="tbl_input" type="text" name="dan"></td>
                                            </tr>
                                            <tr>
                                                <th>학과 명</th>
                                                <td><input id="m_name" class="tbl_input" type="text"  name="m_name" required></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="input_submit privacy_submit">
                                        <input class="btn_submit button" type="submit" value="등록하기">
                                        <input class="btn_cancle button" type="button" value="취소" onclick="history.go(-1)"><%--뒤로 가기 --%>
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>