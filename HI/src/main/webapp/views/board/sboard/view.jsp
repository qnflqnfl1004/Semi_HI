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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/f8167db045.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="view1">
        <section>
            <span>
                <i class="fa fa-thin fa-left"></i>
            </span>   
            <c:if test="${board == null}">
                <div class="sboard-title">잘못된 요청입니다...!</div>
            </c:if>
            <c:if test="${board != null}">
                <div class="sboard-title">${ board.STitle }</div>
                <div class="sUserAndDate">
                    <div class="sUser">
                        <img class="sUser_userImg" src="https://upload.wikimedia.org/wikipedia/ko/thumb/d/d4/%ED%8E%AD%EC%88%98.jpg/450px-%ED%8E%AD%EC%88%98.jpg" alt="userImg">
                        <div class="sUser_userName">${board.member.memNickname}</div>
                    </div>
                    <div class="sboard_registeredDate">
                        <fmt:formatDate value="${board.SWriteDate}" pattern="yyyy-MM-dd"/>
                    </div>
                    
                </div>
                <c:if test="${ not empty loginMember && loginMember.memNo == board.member.memNo }">
                        <button type="button" 
                                onclick="location.href='${ path }/sboard/update?no=${ board.SNo }'">수정</button>
                        <form action="${ path }/sboard/delete" method="post">
                            <input type="hidden" name="no" value="${board.SNo}">
                            <button type="submit" id="btnDelete">삭제</button>
                        </form>
                </c:if>
                <ul class="sboard">
                    <li class="sboard-1">
                        <span class="sboard-2">진행 언어</span>
                        <span class="sboard-3">${board.language.LType}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 인원&nbsp;&nbsp;&nbsp;</span>
                        <span class="sboard-3">${board.SMember}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 분야</span>
                        <span class="sboard-3">${board.test.testType}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 마감일</span>
                        <span class="sboard-3">${board.SDueDate}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">진행 기간</span>
                        <span class="sboard-3">${board.SPeriod}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">시작 예정일</span>
                        <span class="sboard-3"><fmt:formatDate value="${board.SDate}" pattern="yyyy-MM-dd"/></span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">연락 방법</span>
                        <span class="sboard-3">${board.SContact}</span>
                    </li>
                    <li class="sboard-1">
                        <span class="sboard-2">모집 레벨&nbsp;&nbsp;&nbsp;</span>
                        <span class="sboard-3">${board.SLevel}</span>
                    </li>
                </ul>
            </c:if>
        </section>
        <div class="sBoard_postContentWrapper">
            <h2 class="sBoard_postContent_postInfo">
                ${board.SContent}
            </h2>
            <div class="sBoard_postContent_postContent">
                <p>하하하 마라샹궈</p>    
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>