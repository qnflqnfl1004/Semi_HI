<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/memberlist_ver2.css">

    
<body>
    <div class="memListForm">
        <div class="memListBody">
            <table class="memListTable">
                <tr class="memListHeader">
                    <th colspan="5">
                   	 	<div class="memListPage">
                        	<a href="#">회원 관리</a>
                    	</div>
                    </th>
                    <th colspan="3">
                   		<form name="memSearchForm" action="${ path }/admin/memberSearch" method="GET">
                        	<div class="memListSearch">
	                            <select id="searchList" class="searchForm_control" name="searchOption">
	                                <option value="mem_warning" selected >경고 횟수</option>
	                                <option value="mem_id">아이디</option>
	                                <option value="mem_nickname">닉네임</option>
	                                <option value="mem_email">이메일</option>
	                                <option value="mem_phone">전화번호</option>
	                            </select>
	                            <input type="text" placeholder="멤버 검색하기" class="searchForm_control" id="search" name="searchWord" value="${ param.searchWord }">
	                            <button id="btnSearch" type="submit">
                                    <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                                </button>
                        	</div>
                       </form>
                    </th>
                </tr>
                <tr class="memListTitle">
                    <th class="memList listRNum">번호</th>
                    <th class="memList listNo">회원 번호</th>
                    <th class="memList listId">아이디</th>
                    <th class="memList listNickName">닉네임</th>
                    <th class="memList listEmail">이메일</th>
                    <th class="memList listPhone">전화번호</th>
                    <th class="memList warning">경고</th>
                    <th class="memList listDel">탈퇴</th>
                </tr>    
                <c:if test="${ empty Searchlist }">
                 <tr class="memListContent">
                     <td colspan="7" style="text-align:center;"> 
                     	조회된 멤버가 없습니다.
                     </td>
                 </tr>
                </c:if>
                <c:if test="${ not empty Searchlist }">
                	<c:forEach var="member" items="${ Searchlist }">
                  <tr class="memListContent">
                      <td class="memList listRNum">${ member.rowNum }</td>
                      <td class="memList listNo">${ member.no }</td>
                      <td class="memList listId">${ member.id }</td>
                      <td class="memList listNickName">${ member.nickName }</td>
                      <td class="memList listEmail">${ member.email }</td>
                      <td class="memList listPhone">${ member.phone }</td>
                      <td class="memList warning">
                          <input type="number" class="warningNum" id="warningCount" userNo="${ member.no }" value="${ member.warning }" min="0" max="3">
                      </td>
                      <td class="memList listDel">
                          <button type="button" class="btnX" userNo="${ member.no }" >X</button>
                      </td>
                  </tr>
                	</c:forEach>
                </c:if>         
            </table>
            <div id="pageBar"> 
                <button onclick="location.href='${ path }/admin/memberSearch?page=1'">&lt;&lt;</button>
                <button onclick="location.href='${ path }/admin/memberSearch?page=${ pageInfo.prevPage }'">&lt;</button>
     
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status"> 
                    <c:if test="${ status.current == pageInfo.currentPage }">
                       <button disabled>${ status.current }</button>
                    </c:if>
                    <c:if test="${ status.current != pageInfo.currentPage }">
                        <button onclick="location.href='${ path }/admin/memberSearch?page=${ status.current }'">${ status.current }</button>
                   </c:if>
                </c:forEach>
    
                <button onclick="location.href='${ path }/admin/memberSearch?page=${ pageInfo.nextPage }'">&gt;</button>
                <button onclick="location.href='${ path }/admin/memberSearch?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
            </div>
        </div>
    </div>
<body>

<script>
	
	$(document).ready(() => {
		$(".btnX").on("click", (event) => {
			console.log(event);
			if(confirm("정말 삭제 하시겠습니까?")){
				location.replace("${ path }/admin/memberDelete?no=" + $(event.target).attr("userNo"));
			}
		});
	});
	
	$(document).ready(function() {
		$(".warningNum").change( function(event) {
			
			let userWarning = $(event.target).val();
			let userNo = $(event.target).attr("userNo");
		
			console.log(userWarning);
			console.log(userNo);
			
			$.ajax({
				type: "POST",
				url: "${ path }/admin/memberWarning",
				dataType: "json",
				data: {
					userNo,
					userWarning
				},
				success: (obj) => {
					console.log(obj);
				},
				error: (error) => {
					console.log(error);
				}
			});
		});	
	});	
</script>
