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
                <%-- <script src="${contextPath}/js/add_lecture.js"></script> --%>
                <title>삼선대학교</title>
                <script type="text/javascript">
	                $(function(){
	                	let cl_id_input=document.getElementById("cl_id");
	                	let check=false;
	                	
	                	cl_id_input.onblur = function(e){
	                		let cl_id=$('#cl_id').val();
	                		$.ajax({
	                			type:"post",
	                			async:true,
	                			dataType:"text",
	                			url:"${contextPath}/view/check_cl_id.do",
	                			data:{cl_id:cl_id},
	                			success:function(data,textStatus){
	                				if(data=='usable'){
	                					check=true;
	                				}else{
	                					alert("사용 불가능한 과목 코드입니다.");
	                					check=false;
	                				}
	                			},
	                			error:function(data, textStatus){
	                				alert("에러발생~!");
	                			}
	                		})
	                	}
	                	
	                	$('.btn_submit').on('click',function (e){
	                		if(check==false){
	                			e.preventDefault();
	                			alert('과목 코드를 변경해주세요.');
	                		}
	                	});
	                });
                </script>
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
                                <h3>수업 등록하기</h3>
                                <form action="${contextPath}/view/add_lecture.do" method="post" id="frm_add_lecture"
                                    name="frm_add_lecture">
                                    <table border="0" cellpadding="0" cellspacing="0" id="main_table">
                                        <tbody>
                                            <tr>
                                                <th>과목 코드</th>
                                                <td><input id="cl_id" class="tbl_input" type="number" name="cl_id" required></td>
                                            </tr>
                                            <tr>
                                                <th>강의 이름</th>
                                                <td><input class="tbl_input" type="text" name="cl_name" required></td>
                                            </tr>
                                            <tr>
                                                <th>학점</th>
                                                <td><input class="tbl_input" type="number" name="cl_pt" required></td>
                                            </tr>
                                            <tr>
                                                <th>강의 시간</th>
                                                <td><input class="tbl_input" type="text" name="cl_time" required></td>
                                            </tr>
                                            <tr>
                                                <th>강의실</th>
                                                <td><input class="tbl_input" type="text" name="cl_room" required></td>
                                            </tr>
                                            <tr class="radio_btns">
                                                <th>강의 유형</th>
                                                <td colspan="2">
                                                    <p>
                                                        <input type="radio" id="major" value="전공" name="cl_mj_t"
                                                            checked="checked">
                                                        <label for="major">전공</label>
                                                    </p>
                                                    <p>
                                                        <input type="radio" id="GE" value="교양" name="cl_mj_t">
                                                        <label for="GE">교양</label>
                                                    </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="input_submit">
                                        <input class="btn_submit button" type="submit" value="등록하기">
                                        <a href="${contextPath}/view/pf_lectureList.do"
                                            class="btn_cancle button">취소</a>
                                    </div>
                                </form>
                        </section>
                    </div>
                </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>