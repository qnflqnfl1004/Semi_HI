<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

<nav class="navbar navbar-light bg-light">

	<a class="navbar-brand" href="#"> <img
		src="C:\Users\kh\Desktop\semi\logo.png" alt="" width="130" height="70">
	</a>
</nav>
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
					<dd>${ board.writerId }</dd>
				</dl>
			</div>

			<div class="writedate">
				<dl>
					<dt>작성일</dt>
					<dd>${ board.createDate }</dd>
				</dl>
			</div>

			<div class="cont">
				<textarea>${ board.content }</textarea>
			</div>

			<div class="addfile">
				<dl>
					<dt>첨부파일</dt>
					<dd>첨부된 파일이 들어갑니다.</dd>
				</dl>
			</div>

		</div>

		<div class="bt_wrap">
			<a href="#" class="on">목록</a> <a href="#">답변하기</a>
		</div>
	</div>
</div>