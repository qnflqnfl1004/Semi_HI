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
	<form action="${ path }/nboard/write" method="POST">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" name="writer" placeholder="글쓴이 입력" value="${ loginMemeber.id }" readonly></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><input type="text" name="createDate" placeholder="날짜 입력" value="${ board.createDate }" ></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="content" placeholder="내용 입력"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input style="cursor:pointer" type="reset" value="취소">
                <input style="cursor:pointer" type="submit" value="등록">
            </div>
        </div>
     </form>
    </div>
</body>
</html>



