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
        <link rel="stylesheet" href="${contextPath}/css/table.css">
        <link rel="stylesheet" href="${contextPath}/css/board_detail.css">
        <link rel="stylesheet" href="${contextPath}/css/viewScores.css">
        <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${contextPath}/js/common.js"></script>
        <script src="${contextPath}/js/menu_second.js"></script>
        <title>삼선대학교</title>
        <script type="text/javascript">
        	window.onload = function() {
        		const search_btn=document.querySelector(".search_btn");
				//select, input에 입력된 값이 있으면 name과 value를 저장할 배열
				let names=[];
				let values=[];
				/* let obj={}; */
				search_btn.addEventListener("click", search);
				function search() {
					let search=document.getElementsByClassName("searchable");
					for(let i=0; i<search.length; i++) {
						if(search[i].value != '' && search[i].value != null && search[i].value.length != 0) {
							names.push(search[i].getAttribute("name"));
							values.push(search[i].value);
						}
					}
					if(names.length != 0) {
						//ajax로 names, values 전송하고 json으로 검색된 값 반환받기
						$.ajax({
							type:"post",
							async:"true",
							traditional: true,
							url:"${contextPath}/subject/search.do",
							data:{nameArr:names,
								  valueArr:values},
							dataType:"json",
							success:function (data) {
								names=[];
								values.length=0;
								if(data.searchClass.length != 0) {
									let searchResult="";
									for(let i in data.searchClass) {
										searchResult+="<tr>";
										searchResult+='<td><input type="checkbox" name="addLecture" value=' + i +'></td>';
										searchResult+='<td>' + data.searchClass[i].cl_mj_t + '</td>';
										searchResult+='<td>' + data.searchClass[i].m_name + '</td>';
										searchResult+='<td>' + data.searchClass[i].cl_name + '</td>';
										searchResult+='<td>' + data.searchClass[i].cl_pt + '</td>';
										searchResult+='<td>' + data.searchClass[i].cl_size + '</td>';
										searchResult+='<td>' + data.searchClass[i].pf_name + '</td>';
										searchResult+='<td>' + data.searchClass[i].cl_room + '</td>';
										searchResult+='<td>' + data.searchClass[i].cl_time + '</td>';
										searchResult+='<input type="hidden" name="pf_id" value="' + data.searchClass[i].pf_id + '">';
										searchResult+='<input type="hidden" name="pf_name" value="' + data.searchClass[i].pf_name + '">';
										searchResult+='<input type="hidden" name="cl_name" value="' + data.searchClass[i].cl_name + '">';
										searchResult+='<input type="hidden" name="cl_id" value="' + data.searchClass[i].cl_id + '">';
										searchResult+='<input type="hidden" name="cl_pt" value="' + data.searchClass[i].cl_pt + '">';
										searchResult+='<input type="hidden" name="cl_sem" value="' + data.searchClass[i].cl_sem + '">';
										searchResult+='</tr>';
									}
									document.querySelector('#sugang').innerHTML=searchResult;
								} else {
									alert('검색한 조건의 강의가 존재하지 않습니다.');
									$('.defaultOption').prop('selected', true);
									$('#cl_nameBox').val('');
								}
							},
							error:function(data) {
								alert('에러가 발생했습니다.');
							}
						});
					}
				}
        	}
        </script>
      </head>

      <body>
        <jsp:include page="../common/header.jsp" />

        <div id="middle_area">
          <div id="main_menu_back">
            <jsp:include page="../common/menu.jsp" />
          </div>

          <div id="contents_area">
            <div class="contents_wrapper">
              
	              <h3>수강 신청 및 조회</h3>
	              <div class="st_lecture_area">
	                <div class="lt_search_form">
	                  <!-- <div class="lt_select">
	                <label class="lt_label">학년</label>
	                <div class="lt_inner">
	                  <select name="lt_options" id="lt_options">
	                    <option value="1">1학년</option>
	                    <option value="1">2학년</option>
	                    <option value="1">3학년</option>
	                    <option value="1">3학년</option>
	                  </select>
	                </div>
	              </div> -->
	                  <div class="lt_select">
	                    <label class="lt_label">학기</label>
	                    <div class="lt_inner">
	                      <select name="semester" id="lt_options" disabled>
	                        <option value="1" selected>1학기</option>
	                        <option value="2">2학기</option>
	                      </select>
	                    </div>
	                  </div>
	                  <div class="lt_select">
	                    <label class="lt_label">교과구분</label>
	                    <div class="lt_inner">
	                      <select name="cl_mj_t" id="lt_options" class="searchable">
	                        <option value="" selected class="defaultOption">선택</option>
	                        <option value="전공">전공과목</option>
	                        <option value="교양">교양과목</option>
	                      </select>
	                    </div>
	                  </div>
	                  <div class="lt_select">
	                    <label class="lt_label">전공</label>
	                    <div class="lt_inner">
	                      <select name="m_name" id="lt_options" class="searchable">
	                      <option value="" selected class="defaultOption">선택</option>
	                        <c:forEach var="major" items="${majorList}">
		                  		<option value="${major}">${major}</option>
		                  	</c:forEach>
	                      </select>
	                    </div>
	                  </div>
	                  <div class="lt_input_text">
	                    <label class="lt_label">과목명</label>
	                    <div>
	                      <input type="text" name="cl_name" class="searchable" id="cl_nameBox">
	                    </div>
	                  </div>
	                  <div class="lt_search_submit lt_select">
	                    <button class="search_btn">검색</button> <!-- ajax : input type button -->
	                  </div>
	                </div>
	              </div>
				<form action="${contextPath}/subject/addSugang.do" method="post">
	              <div class="tbl_content">
	                <div class="st_lecture_list tbl_header">
	                  <table border="0" cellpadding="0" cellspacing="0">
	                    <thead>
	                      <tr>
	                        <th>선택</th>
	                        <th>구분</th>
	                        <th>학과</th>
	                        <th>강좌명</th>
	                        <th>학점</th>
	                        <th>정원</th>
	                        <th>담당 교수</th>
	                        <th>강의실</th>
	                        <th>강의 시간</th>
	                      </tr>
	                    </thead>
	                  </table>
	                </div>
	                
	                <table border="0" cellpadding="0" cellspacing="0">
	                  <tbody id="sugang"> <!-- ajax로 내용 바뀔 부분 -->
	                  <c:choose>
		            		<c:when test="${sugangList == null}">
		            			<tr colsapn="9"><td colspan="9">수강 신청할 수 있는 강의가 아직 등록되지 않았습니다.</td></tr>
		            		</c:when>
		            		<c:otherwise>
	            				<c:forEach var="lecture" items="${sugangList}" varStatus="sugang">
		            				<tr>
			            				<td><input type="checkbox" name="addLecture" value="${sugang.index}"></td>
			            				<td>${lecture.cl_mj_t}</td>
			            				<td>${lecture.m_name}</td>
			            				<td>${lecture.cl_name}</td>
			            				<td>${lecture.cl_pt}</td>
			            				<td>${lecture.cl_size}</td>
			            				<td>${lecture.pf_name}</td>
			            				<td>${lecture.cl_room}</td>
			            				<td>${lecture.cl_time}</td>
			            				<input type="hidden" name="pf_id" value="${lecture.pf_id}">
			            				<input type="hidden" name="pf_name" value="${lecture.pf_name}">
			            				<input type="hidden" name="cl_name" value="${lecture.cl_name}">
			            				<input type="hidden" name="cl_id" value="${lecture.cl_id}">
			            				<input type="hidden" name="cl_pt" value="${lecture.cl_pt}">
			            				<input type="hidden" name="cl_sem" value="${lecture.cl_sem}">
		            				</tr>
	            				</c:forEach>
		            		</c:otherwise>
		            	</c:choose>
	                  </tbody>
	                </table>
	              </div>
	              <div class="st_lecture_list lt_apply">
	                <input type="submit" class="apply_btn" value="신청하기">
	              </div>
              </form>
            </div>
          </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
        </div>
      </body>

      </html>