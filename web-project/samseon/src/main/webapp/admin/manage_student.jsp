<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <c:choose>
                	<c:when test='${admin_msg=="add_member" }'>
						<script>
							window.onload = function () {
								alert("정보를 등록하였습니다.");
							}
						</script>
					</c:when>
					<c:when test='${admin_msg=="modified" }'>
						<script>
							window.onload = function () {
								alert("정보를 수정하였습니다.");
							}
						</script>
					</c:when>
					<c:when test='${admin_msg=="deleted" }'>
						<script>
							window.onload = function () {
								alert("정보를 삭제하였습니다.");
							}
						</script>
					</c:when>
                </c:choose>
                <script type="text/javascript">
                	window.onload = function() {
                		const search_btn=document.querySelector(".search_btn");
                		search_btn.addEventListener("click", search);
                		function search() {
	                		let names=[];
	                		let values=[];
	                		let st_cnd_value=null;
	                		let id_value=null;
	                		const st_cnd=document.getElementById('select_st_cnd');
                			const dan=document.getElementById('select_dan');
                			const m_name=document.getElementById('select_m_name');
                			const etc_option=document.getElementById("select_etc");
               				const etc_search=document.querySelector("input[name='etc_search']");
               				if(st_cnd.value != '' && st_cnd.value != null && st_cnd.value.length != 0) {
               					st_cnd_value=st_cnd.value;
               				}
                			if(dan.value != '' && dan.value != null && dan.value.length != 0) {
                				names.push(dan.getAttribute('name'));
                				values.push(dan.value);
                			}
                			if(m_name.value != '' && m_name.value != null && m_name.value.length != 0) {
                				names.push(m_name.getAttribute('name'));
                				values.push(m_name.value);
                			}
                			if(etc_option.value != '' && etc_option.value != null && etc_option.value.length != 0) {
                				if(etc_option.value != '학번') {
	                				if(etc_search.value != '' && etc_search.value != null && etc_search.value.length != 0) {
		                				names.push(etc_option.value);
	                					values.push(etc_search.value);
	                				}
                				}else {  //학생 학번으로 검색할 경우
                					if(etc_search.value != '' && etc_search.value != null && etc_search.value.length != 0) {
                						id_value=etc_search.value;
                					}
                				}
                			}
                			if(names.length != 0 || id_value != null || st_cnd_value != null) {
                				$.ajax({
                					type:"post",
                					async:"true",
                					traditional:true,
                					url:"${contextPath}/manage/st_search.do",
                					data:{nameArr:names,
                						  valueArr:values,
                						  st_cnd_value:st_cnd_value,
                						  id_value:id_value},
                					dataType:"json",
                					success:function(data) {
                						if(data.searchSt.length != 0) {
                							let searchResult="";
                							let idx=0;
                							for(let i in data.searchSt) {
                								idx=parseInt(i)+1;
                								if(data.searchSt[i].st_email == null) data.searchSt[i].st_email="";
                								searchResult+="<tr>";
        										searchResult+='<td>'+idx+'</td>';
        										searchResult+='<td>' + data.searchSt[i].st_id + '</td>';
        										searchResult+='<td>' + data.searchSt[i].st_name + '</td>';
        										searchResult+='<td>' + data.searchSt[i].st_ph.substring(0,3) + '-' + data.searchSt[i].st_ph.substring(3,7) + '-' + data.searchSt[i].st_ph.substring(7,11) + '</td>';
        										searchResult+='<td>' + data.searchSt[i].st_email + '</td>';
        										searchResult+='<td>' + data.searchSt[i].dan + '</td>';
        										searchResult+='<td>' + data.searchSt[i].m_name + '</td>';
        										searchResult+='<td><input type="radio" name="check_prof" value="st_id"></td>';
        										searchResult+='</tr>';
                							}
                							document.querySelector('#stuDent').innerHTML=searchResult;
                						}else {
                							alert('검색결과가 없습니다.');
                							$('.defaultOption').prop('selected', true);
        									$('#etc_searchBox').val('');
                						}
                					},
                					error:function(data) {
                						alert('에러가 발생했습니다.');
                					}
                				});
                			}
                		}
                	}
                	function mod_st() {
                		let checked=$("input[name='check_st']:checked").val();
                		if(checked==undefined){
                			alert("수정할 학생을 선택해주세요.");
                		}else{
                			$('.mod_btn').attr('href','${contextPath }/manage/mod_st_form.do?st_id='+checked);
                		}
                	}
                	function del_st() {
                		let checked=$("input[name='check_st']:checked").val();
                		let check_sign=$("input[name='check_st']:checked").next().val();
                		if(checked==undefined){
                			alert("삭제할 학생을 선택해주세요.");
                		}else{
                			$('.del_btn').attr('href','${contextPath}/manage/del_st.do?st_id='+checked+'&&check_sign='+check_sign);
                		}
                	}
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
                                    <!-- <div class="lt_select">
                                        <label class="lt_label">학년</label>
                                        <div class="lt_inner">
                                            <select name="lt_options" id="lt_options">
                                                <option value="1">1학년</option>
                                                <option value="2">2학년</option>
                                                <option value="3">3학년</option>
                                                <option value="4">4학년</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <div class="lt_select">
                                        <label class="lt_label">학적상태</label>
                                        <div class="lt_inner">
                                            <select name="st_cnd" id="select_st_cnd">
                                                <option value="" selected class="defaultOption">선택</option>
                                                <option value="0">재학</option>
                                                <option value="1">휴학</option>
                                                <option value="2">졸업</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_select">
                                        <label class="lt_label">단과</label>
                                        <div class="lt_inner">
                                            <select name="dan" id="select_dan">
                                            	<option value="" selected class="defaultOption">선택</option>
                                                <c:forEach var="dan" items="${danList}">
                                                	<option value="${dan}">${dan}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_select">
                                        <label class="lt_label">전공</label>
                                        <div class="lt_inner">
                                            <select name="m_name" id="select_m_name">
                                           		<option value="" selected class="defaultOption">선택</option>
                                                <c:forEach var="major" items="${majorList}">
                                                	<option value="${major}">${major}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="lt_input_text">
                                        <div class="lt_select">
                                            <div class="lt_inner search_select">
                                                <select name="etc_option" id="select_etc">
                                                	<option value="" selected class="defaultOption">선택</option>
                                                    <option value="st_name">이름</option>
                                                    <option value="st_ph">전화번호</option>
                                                    <option value="st_email">이메일</option>
                                                    <option value="st_id">학번</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div>
                                            <input type="text" name="etc_search" id="etc_searchBox">
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
                                                <th>학번</th>
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
                                    <tbody id="stuDent">
                                    	<c:choose>
                                       		<c:when test="${empty st_list }">
                                       			<tr>
                                       				<td colspan="8">
                                       					<p align="center">등록된 학생 정보가 없습니다.</p>
                                       				</td>
                                       			</tr>
                                       		</c:when>
                                       		<c:when test="${!empty st_list }">
                                       			<c:forEach var="st" items="${st_list }" varStatus="listNum">
                                       				<tr>
                                       					<td>${listNum.count }</td>
                                       			<c:if test="${st.check_sign eq -1 }">
                                       					<td>${st.st_id }</td>
                                       					<td></td>
                                       					<td></td>
														<td></td>
														<td>${st.dan}</td>
														<td>${st.m_name}</td>
														<td>
															<input type="radio" name="check_st" value="${st.st_id }">
															<input type="hidden" name="check_sign" value="${st.check_sign}">
														</td>
                                       				</tr>
                                       			</c:if>
                                       			<c:if test="${st.check_sign eq 0 }">
                                       					<td>${st.st_id }</td>
                                       					<td>${st.st_name}</td>
                                       					<td>${fn:substring(st.st_ph,0,3)}-${fn:substring(st.st_ph,3,7)}-${fn:substring(st.st_ph,7,11)}</td>
														<td>${st.st_email}</td>
														<td>${st.dan}</td>
														<td>${st.m_name}</td>
														<td>
															<input type="radio" name="check_st" value="${st.st_id }">
															<input type="hidden" name="check_sign" value="${st.check_sign}">
														</td>
                                       				</tr>
                                       			</c:if>
                                       				
                                       			</c:forEach>
                                       		</c:when>
                                       	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="st_lecture_list lt_apply">
                                <button class="apply_btn"><a href="${contextPath }/admin/add_member.jsp">등록</a></button>
                                <button class="apply_btn"><a href="#" class="mod_btn" onclick="mod_st()">수정</a></button>
                                <button class="apply_btn"><a href="#" class="del_btn" onclick="del_st()">삭제</a></button>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>