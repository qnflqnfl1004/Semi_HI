<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<style>
	.btns {
		margin-top: 10px;
		text-align: center;
	}
	
	.title a {
		color : black;
		text-decoration: none;
	}
	.pagenumcurrent,
	.pagenumothers,
	.pagearrow {
	border-color: #ddd;
	border: 1px solid #ddd;
	}
	
	.pagenumcurrent,
	.pagenumothers {
		width: 32px;
	    height: 32px;
    	font-size: 1.4rem;
    	border-radius: 5px;
	}
	.pagenumothers {
		background-color: #fff;
    	color: #7A86B6;
	}
	.pagenumcurrent {
		background-color: #7A86B6; 
    	color: #fff;
	}

	.pagearrow {
	width: 32px;
    height: 32px;
    font-size: 1.4rem;
	background-color: #fff;
	color: #ddd;
	border-radius: 5px;

	}

	
</style>

<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

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
						<div class="num">${ board.rowNum }</div>
						<div class="title">
							<a href="${path}/admin/Qview?no=${ board.no }"> ${ board.title }
							</a>
						</div>
						<div class="answer">${ board.as }</div>
						<div class="writer">${ board.writerId}</div>
						<div class="as">${ board.createDate }</div>
					</div>
				</c:forEach>
			</c:if>

			

		</div>
		
			<div class="btns">
			<button class="pagearrow" onclick="location.href='${ path }/admin/Qlist?page=1'">&lt;&lt;</button>
			<button class="pagearrow"
				onclick="location.href='${ path }/admin/Qlist?page=${ pageInfo.prevPage }'">&lt;</button>
			<c:forEach begin="${ pageInfo.startPage }"
				end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button class="pagenumcurrent" disabled >${ status.current }</button>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button class="pagenumothers"
						onclick="location.href='${path}/admin/Qlist?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>
			<button class="pagearrow"
				onclick="location.href='${path}/admin/Qlist?page=${ pageInfo.nextPage }'">&gt;</button>
			<button class="pagearrow"
				onclick="location.href='${path}/admin/Qlist?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
		
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />

