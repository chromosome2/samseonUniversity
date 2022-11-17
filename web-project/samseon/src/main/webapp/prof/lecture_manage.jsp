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
    <link rel="stylesheet" href="${contextPath}/css/viewMyLectures_ST.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script src="${contextPath}/js/menu_third.js"></script>
	<script src="${contextPath}/js/table.js"></script>
    <title>삼선대학교</title>
    <style>
    	input{
    		width : 50px;
    	}
    </style>
    <script type="text/javascript">
	    window.onload=function(){//중간고사와 기말고사가 다 입력되면 등록하기버튼과 입력취소 버튼 hidden
	    	if($('.finish').attr('disabled')=='disabled'){
	    		$('.attendance').attr('type','hidden');
				$('.submit').attr('type','hidden');
				$('.reset').attr('type','hidden');
	    	}
		}
    	function fn_chulcheck(cl_name, url) {  //출석체크폼으로 이동
    		let form=document.createElement("form");
    		form.setAttribute('action', url);
    		form.setAttribute('method','post');
			let cl_name_input=document.createElement("input");
			cl_name_input.setAttribute('type','hidden');
			cl_name_input.setAttribute('name','cl_name');
			cl_name_input.setAttribute('value', cl_name);
			form.appendChild(cl_name_input);
			document.body.appendChild(form);
			form.submit();
    	}
    </script>
    <c:choose>
    	<c:when test='${lect_msg=="add_first_score" }'>
    		<script>
	    		window.onload=function(){
					alert("중간고사 점수입력에 성공하였습니다.");
				}
    		</script>
    	</c:when>
    	<c:when test='${lect_msg=="add_second_score" }'>
    		<script>
	    		window.onload=function(){
					alert("기말고사 점수입력에 성공하였습니다.");
					$('.submit').attr('type','hidden');
					$('.reset').attr('type','hidden');
				}
    		</script>
    	</c:when>
    </c:choose>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

        <div id="middle_area">
            <div id="main_menu_back">
				<jsp:include page="../common/menu.jsp"/>
            </div>

            <div id="contents_area">
       		 <section class="contents_wrapper">
         		 <div class="table_header">
        		    <h3>${cl_name}</h3>
       	   </div>
       	   <form action="${contextPath}/view/add_score.do" method="post" id="frm_add_score" name="frm_add_score">
            <div class="tbl_header">
              <table border="0" cellpadding="0" cellspacing="0">
                <thead>
                  <tr class="tr_header">
                    <td colspan="9" class="3">수업 관리(학생, 출석, 성적 관리)</td>
                  </tr>
                  <tr>
                    <th>NO</th>
                    <th>학생 이름</th>
                    <th>학생 학번</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>출석률</th>
                    <th>중간 점수</th>
                    <th>기말 점수</th>
                    <th>최종 성적</th>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="tbl_content">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
            					<c:choose>
            						<c:when test="${empty studentList}">
            							<tr class="td_none">
            								<td colspan="9">
            									수업을 듣는 학생이 없습니다.
            								</td>
            							</tr>
            							<script>
	            							window.onload=function(){
		            							$('.attendance').attr('type','hidden');
		            							$('.submit').attr('type','hidden');
		            							$('.reset').attr('type','hidden');
	            							}
            							</script>
            						</c:when>
            						<c:when test="${!empty studentList}">
            							<c:forEach var="student" items="${studentList}" varStatus="stuNum">
            								<tr>
			            						<td>${stuNum.count}</td>
			            						<td>${student.st_name}</td>
			            						<td>${student.st_id}</td>
			            						<td>${student.st_ph}</td>
			            						<td>${student.st_email}</td>
			            						<td><fmt:formatNumber value="${student.cl_check/30}" pattern="0.0%"/></td>
			            						
			            						<c:choose>
			            							<c:when test="${student.s_first eq -1 }" >
			            								<td><input type="number" name="s_first" required></td>
				            							<td><input type="number" name="s_second" disabled></td>
				            							<td></td>
				            							<input type="hidden" name="st_id" value="${student.st_id }">
				            							<input type="hidden" name="count" value="1">
				            						</c:when>
				            						<c:when test="${student.s_second eq -1 }" >
			            								<td><input type="number" value="${student.s_first}" name="s_first" disabled></td>
				            							<td><input type="number" name="s_second" required></td>
				            							<td></td>
				            							<input type="hidden" name="st_id" value="${student.st_id }">
				            							<input type="hidden" name="count" value="2">
				            						</c:when>
				            						<c:when test="${student.s_first != -1 && student.s_second != -1}">
					            						<td><input type="number" value="${student.s_first}" name="s_first"disabled></td>
					            						<td><input type="number" value="${student.s_second}" name="s_second" class="finish" disabled></td>
					            						<td>${student.hakjum}</td>    						
				            						</c:when>
				            						
			            						</c:choose>
			            					</tr>
            							</c:forEach>
            						</c:when>
            					</c:choose>
            				</tbody>
       				    </table>
       				   </div>
       				   <div class="class_submit">
    				  		<input type="button" class="btn_submit button attendance" value="출석체크" onclick="fn_chulcheck('${cl_name}', '${contextPath}/professor/chulcheckForm.do')">
       					    <input type="submit"class="btn_submit button submit" value="등록">
       					    <input type="reset" class="btn_submit button reset" value="입력취소">
       					    <input type="button" class="btn_submit button back" value="수업목록" onclick="history.go(-1)">
          				</div>
          				<input type="hidden" name="cl_name" value="${cl_name }">
         			 </form>
            		
            	</section>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>