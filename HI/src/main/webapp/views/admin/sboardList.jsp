<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HI</title>
<style>
    a {
        text-decoration-line: none;
        color: #333;
    }
    .selectMenu {
        width: 100px;
        height: 30px;
        display: flex;
        justify-content: flex-start;
        padding-left: 200px;
    }

    #searchForm {
        width: 100px;
        height: 30px;
    }

    .searchForm {
        text-align: right;
        height: 40px;
    }

    .table {
        width: 1000px;
        margin-left: auto;
        margin-right: auto;
    }
    
    #pageBar {
        text-align: center;
        
    }

</style>
</head>
<body>
    <div class="selectMenu">
        <select>
            <option selected>언어</option>
            <option value="1">영어</option>
            <option value="2">일본어</option>
            <option value="3">중국어</option>
            <option value="3">기타</option>
        </select>
        <select>
            <option selected>시험</option>
            <option value="1">토익</option>
            <option value="2">토플</option>
            <option value="3">ㅇㅇ</option>
        </select>
    </div>
    <div class="searchForm">
        <select id="searchForm">
            <option selected>선택</option>
            <option value="1">작성자</option>
            <option value="2">내용/제목</option>
        </select>
        <input type="text" placeholder="search...">
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="board" varStatus="status">
            <tr>
                <th scope="row">${board.SNo}</th>
                <td>
                    <a href="${path}/board/sboard/view?no=${board.SNo}">
                        ${board.STitle}
                    </a>
                </td>
                <td>${board.member.nickName}</td>
                <td>
                    <form action="${path}/board/sboard/delete" method="post">
                        <input type="hidden" name="no" value="${board.SNo}">
                        <button type="submit" id="btnDelete">삭제</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <div id="pageBar">
        <!-- 맨 처음으로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=1'">&lt;&lt;</button>

        <!-- 이전 페이지로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.prevPage }'">&lt;</button>

        <!--  10개 페이지 목록 -->
        <!-- <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status"> -->
            <!-- <c:if test="${ status.current == pageInfo.currentPage }"> -->
                <button>1</button>
                <button>2</button>
                <button>3</button>
            <!-- </c:if> -->
            <!-- <c:if test="${ status.current != pageInfo.currentPage }"> -->
                <!-- <button onclick="location.href='${ path }/board/list?page=${ status.current }'">${ status.current }</button> -->
            <!-- </c:if> -->
        <!-- </c:forEach> -->


        <!-- 다음 페이지로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.nextPage }'">&gt;</button>

        <!-- 맨 끝으로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
    </div>

    
</body>
</html>