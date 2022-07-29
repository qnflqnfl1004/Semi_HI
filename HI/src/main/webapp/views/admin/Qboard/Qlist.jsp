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
					<div colspan="6">
						조회된 게시글이 없습니다.
					</div>
				</div>	
			</c:if>
			
			
			
			
			<div>
				<div class="num">5</div>
				<div class="title">
					<a href="/HI/admin/Qview">글 제목이 들어갑니다.</a>
				</div>
				<div class="answer">답변예정</div>
				<div class="writer">김이름</div>
				<div class="date">2021.1.15</div>

			</div>
			<div>
				<div class="num">4</div>
				<div class="title">
					<a href="view.html">글 제목이 들어갑니다.</a>
				</div>
				<div class="answer">답변예정</div>
				<div class="writer">김이름</div>
				<div class="date">2021.1.15</div>
			</div>
			<div>
				<div class="num">3</div>
				<div class="title">
					<a href="view.html">글 제목이 들어갑니다.</a>
				</div>
				<div class="answer">답변예정</div>
				<div class="writer">김이름</div>
				<div class="date">2021.1.15</div>
			</div>
			<div>
				<div class="num">2</div>
				<div class="title">
					<a href="view.html">글 제목이 들어갑니다.</a>
				</div>
				<div class="answer">답변예정</div>
				<div class="writer">김이름</div>
				<div class="date">2021.1.15</div>
			</div>
			<div>
				<div class="num">1</div>
				<div class="title">
					<a href="view.html">글 제목이 들어갑니다.</a>
				</div>
				<div class="answer">답변예정</div>
				<div class="writer">김이름</div>
				<div class="date">2021.1.15</div>
			</div>
		</div>
		<div class="board_page">
			<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
			<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="num">4</a> <a href="#"
				class="num">5</a> <a href="#" class="bt next">></a> <a href="#"
				class="bt last">>></a>
		</div>
		<div class="bt_wrap">
			<a href="write.html" class="on">등록</a>
			<!--<a href="#">수정</a>-->
		</div>
	</div>
</div>