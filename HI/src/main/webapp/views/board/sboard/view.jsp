<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/view.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/f8167db045.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="studyView">
            <span>
                <a href="javascript:history.back()">
                    <i class="fa-solid fa-arrow-left fa-2x arrowLeft"></i>
                </a>
            </span>   
            <!-- <c:if test="${board == null}">
                <div class="sboard-title">잘못된 요청입니다...!</div>
            </c:if> -->
            <c:if test="${board != null}">
                <div class="sboard-title">🚀 ${ board.STitle }

                    <div class="heartIcon">
                        <i class="fa-regular fa-heart fa-sm"></i>
                    </div>
                </div>
                <div class="sUserAndDate">
                    <div class="sUser">
                        <img class="sUser_userImg" src="https://upload.wikimedia.org/wikipedia/ko/thumb/d/d4/%ED%8E%AD%EC%88%98.jpg/450px-%ED%8E%AD%EC%88%98.jpg" alt="userImg">
                        <div class="sUser_userName">${board.member.nickName}</div>
                    </div>
                    <div class="sboard_registeredDate">
                        <fmt:formatDate value="${board.SWriteDate}" pattern="yyyy-MM-dd"/>
                    </div>                    
                </div>
                <div class="btns">
                    <c:if test="${ not empty loginMember && loginMember.no == board.member.no }">
                        <button type="button" class="btnUpdate"
                        onclick="location.href='${ path }/sboard/update?no=${ board.SNo }'">
                        수정
                    </button>
                    <form action="${ path }/sboard/delete" method="post">
                        <input type="hidden" name="no" value="${board.SNo}">
                        <button type="submit" class="btnDelete">삭제</button>
                    </form>
                </c:if>
                </div>
                <ul class="sboard">
                    <li class="sboard-1">
                        <span class="sboard-2">진행 언어&nbsp;</span>
                        <span class="sboard-3">${board.language.LType}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 인원&nbsp;&nbsp;&nbsp;</span>
                        <span class="sboard-3">${board.SMember}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 분야&nbsp;</span>
                        <span class="sboard-3">${board.test.testType}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 마감일</span>
                        <span class="sboard-3">${board.SDueDate}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">진행 기간&nbsp;</span>
                        <span class="sboard-3">${board.SPeriod}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">시작 예정일</span>
                        <span class="sboard-3"><fmt:formatDate value="${board.SDate}" pattern="yyyy-MM-dd"/></span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">연락 방법&nbsp;</span>
                        <span class="sboard-3">
                            <a class="scontactLink" value="${board.SContact}">
                            링크
                                <i class="fa-solid fa-link iconLink"></i>
                            </a>
                        </span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 레벨&nbsp;&nbsp;&nbsp;</span>
                        <span class="sboard-3">${board.SLevel}</span>
                    </li>
                </ul>
                <div class="sBoard_postContentWrapper">
                    <h1 class="sBoard_postContent_postInfo">
                        🚀 스터디 소개
                    </h1>
                    <div class="sBoard_postContent_postContent">
                        ${board.SContent}
                    </div>
                </div>
            </c:if>
    </div>
</body>
</html>
