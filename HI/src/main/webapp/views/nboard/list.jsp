<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css" type="text/css">
    
<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>NOTICE</strong>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                </div>
                <c:if test="${ empty list }">
                	<div>
						<div class="empty">
							조회된 게시글이 없습니다.
						</div>
					</div>	
				</c:if>

                <c:if test="${ not empty list }">
                	<c:forEach var="board" items="${ list }">				
		                <div>
		                    <div class="num">${ board.rowNum }</div>
		                    <div class="title"><a href="${ path }/nboard/view?no=${ board.no }">${ board.title }</a></div>
		                    <div class="writer">${ board.writerId }</div>
		                    <div class="date">${ board.createDate }</div>
		                </div>
	                </c:forEach>
				</c:if>

            </div>
            
            <div class="bt_wrap">
             <c:if test="${ not empty loginMember && loginMember.role == 'ROLE_ADMIN' }"> 
	                <a href="${path}/nboard/write" class="on">글쓰기</a>
	          </c:if>
	            
                <!--<a href="#">수정</a>-->
            </div>
            
            <div class="board_page">
                <a href="${ path }/nboard/list?page=1" class="bt first">&lt;&lt;</a>
                <a href="${ path }/nboard/list?page=${ pageInfo.prevPage }" class="bt prev">&lt;</a>
            	<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
            		<c:if test="${ status.current == pageInfo.currentPage }">
            			<a href="#" class="num on">${ status.current }</a>
            		</c:if>
            		<c:if test="${ status.current != pageInfo.currentPage }">
            			<a href="${ path }/nboard/list?page=${ status.current }" class="num">${ status.current }</a>
            		</c:if>
            	</c:forEach>
                <a href="${ path }/nboard/list?page=${ pageInfo.nextPage }" class="bt next">&gt;</a>
                <a href="${ path }/nboard/list?page=${ pageInfo.maxPage }" class="bt last">&gt;&gt;</a>
            </div>
        </div>
    </div>
</body>
</html> 