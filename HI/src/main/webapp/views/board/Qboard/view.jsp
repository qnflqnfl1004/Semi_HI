<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

<style>
.bt_wrap {
    margin-top: 15px;
    text-align: center;
    font-size: 0;
    
}

.bt_wrap button {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #fff;
    background: #dadbe0;
    border-radius: 10px;
    font-size: 1.4rem;
}


.bt_wrap button {
	background: #7A86B6;
    color: #fff;
    border-radius: 10px;
    float: right;
    min-width: 100px;
}

button {
 font-size: medium;
    font-weight: 900;
    outline: none;
    border: none;
    cursor: pointer;
    background-color: #7A86B6;
    color: #fff;
}

</style>

<jsp:include page="/views/common/header.jsp" />

<div class="board_wrap">
	<div class="board_title">
		<strong>건의사항</strong>
	</div>
	<div class="board_write_wrap">
		<div class="board_write">
			
			<div class="writetitle">
				<dl>
					<dt>제목</dt>
					<dd>${ board.title }</dd>
				</dl>
			</div>

			<div class="reason">
				<dl>
					<dt>사유</dt>
					<dd> ${ board.reason } </dd>
				</dl>
			</div>

			<div class="writeperson">
				<dl>
					<dt>작성자</dt>
					<dt>${ board.writerId }</dt>
				</dl>
			</div>

			<div class="writedate">
				<dl>
					<dt>작성일</dt>
					<dd>${ board.createDate }</dd>
				</dl>
			</div>

			<div class="cont">
				<textarea readonly>${ board.content }</textarea>
			</div>

			<div class="addfile">
				<dl>
					<dt>첨부파일</dt>
					<dd>
						<c:if test="${ not empty board.originalFileName }">
						<img src="${ path }/resources/images/file.png" width="20px" height="20px" >
						<a href="javascript:" id="fileDown">
						<span> ${ board.originalFileName } </span>
						</a>
						</c:if>
					</dd>
				</dl>
			</div>

		</div>
		
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />