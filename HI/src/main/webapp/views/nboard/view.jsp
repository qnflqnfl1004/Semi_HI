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
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    ${ board.title }
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${ board.no }</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${ board.writerId }</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${ board.createDate }</dd>
                    </dl>
                </div>
                <div class="cont">
					${ board.content }
                </div>
            </div>
            <div class="bt_wrap">
                <a href="#" class="list" onclick="location.href='${ path }/nboard/list'">목록</a>
                <%--<c:if test="${ not empty loginMember && loginMemeber.nickName  == board.writerId }"> --%>
	                <a href="#" class="delete" id="btnDelete">삭제</a>
	                <a href="#" class="on">수정</a>
                <%--</c:if>--> --%>
            </div>
        </div>
    </div>
</body>

<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/nboard/delete?no=${ board.no }");
			}
		});
	});
</script>
</html>