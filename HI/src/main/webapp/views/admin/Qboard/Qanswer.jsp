<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

<nav class="navbar navbar-light bg-light">

	<a class="navbar-brand" href="#"> <img
		src="C:\Users\kh\Desktop\semi\logo.png" alt="" width="130" height="70">
	</a>
	<div class="main1">
		<button class="main2">회원가입</button>
		<button class="main3">로그인</button>
	</div>
</nav>
<div class="board_wrap">
	<div class="board_title">
		<strong>건의사항</strong>
	</div>
	<div class="board_view_wrap">
		<div class="board_view">
			<div class="title">@@@이용자님 답변입니다.</div>
			<div class="info">
				<dl>
					<dt>번호</dt>
					<dd>1</dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd>관리자</dd>
				</dl>
				<dl>
					<dt>작성일</dt>
					<dd>2021.1.16</dd>
				</dl>
				<dl>
					<dt>조회</dt>
					<dd>33</dd>
				</dl>
			</div>
			<div class="cont">문의내용</div>
			<div class="contanswer">답변내용</div>
		</div>
		<div class="bt_wrap">
			<a href="list.html" class="on">목록</a> <a href="edit.html">제출하기</a>
		</div>
	</div>
</div>