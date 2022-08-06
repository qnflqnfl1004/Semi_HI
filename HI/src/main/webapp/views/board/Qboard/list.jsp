<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<%-- <link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css"> --%>
<style>
div#pageBar {
	margin-top: 10px;
	text-align: center;
}
</style>
<jsp:include page="/views/common/header.jsp" />
<div class="board_wrap">
	<div class="board_title">
		<strong>건의하기</strong>
	</div>
	<div class="board_list_wrap">
		<div class="board_list">
			<div class="top">
				<div class="num">번호</div>
				<div class="title">제목</div>
				<div class="answer">답변상태</div>
				<div class="writer">글쓴이</div>
				<div class="date">작성일</div>

			</div>

			<c:if test="${ empty list }">
				<div>
					<div colspan="6">조회된 게시글이 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="board" items="${ list }">
					<div>
						<div class="num" >${ board.rowNum }</div>
						<div class="title">
							<a href="${path}/user/Qview?no=${ board.no }"> ${ board.title } </a>
						</div>
						<div class="answer">${ board.as }</div>
						<div class="writer">${ board.writerId}</div>
						<div class="date">${ board.createDate }</div>
						<div calss="as">${ board.as }</div>
					</div>
				</c:forEach>
			</c:if>
			
			<div id="pageBar">
	<!-- 맨 처음으로 -->
	<button onclick="location.href='${ path }/user/list?page=1'">&lt;&lt;</button>

	<!-- 이전 페이지로 -->
	<button
		onclick="location.href='${ path }/user/list?page=${ pageInfo.prevPage }'">&lt;</button>

	<!--  10개 페이지 목록 -->
	<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }"
		varStatus="status">
		<c:if test="${ status.current == pageInfo.currentPage }">
			<button disabled>${ status.current }</button>
		</c:if>
		<c:if test="${ status.current != pageInfo.currentPage }">
			<button
				onclick="location.href='${path}/user/list?page=${ status.current }'">${ status.current }</button>
		</c:if>
	</c:forEach>


	<!-- 다음 페이지로 -->
	<button
		onclick="location.href='${path}/user/list?page=${ pageInfo.nextPage }'">&gt;</button>

	<!-- 맨 끝으로 -->
	<button
		onclick="location.href='${path}/user/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
</div>
			</div>
		</div>
	</div>
</div>
