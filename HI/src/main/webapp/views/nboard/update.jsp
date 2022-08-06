<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css" type="text/css">


<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>NOTICE</strong>
        </div>
     <form action="${ path }/nboard/update" method="POST">
     	<input type="hidden" name="no" value=${ board.no }>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" id="title" placeholder="제목 입력" value="${ board.title }"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><div class="writer">${ loginMember.id }</div></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><div class="createdate"><fmt:formatDate value="<%= new Date() %>" pattern="yyyy-MM-dd"/></div></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="content" placeholder="내용 입력">${ board.content }</textarea>
                </div>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="reset" style="cursor:pointer" onclick="location.replace('${pageContext.request.contextPath}/nboard/list')" value="취소">
                <input style="cursor:pointer" type="submit" value="저장">
            </div>
        </form>
        </div>
</body>
<jsp:include page="/views/common/footer.jsp" />
</html>