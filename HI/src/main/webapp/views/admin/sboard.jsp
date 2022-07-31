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
    .selectMenu {
        width: 100px;
        height: 40px;
    }

    #searchForm {
        width: 100px;
    }

    .searchForm {
        text-align: right;
        height: 40px;
    }

    .table2_2 table {
        width:100%;
        margin:15px 0
    }
    .table2_2 th {
        background-color:#7A86B6;
        color:#FFFFFF
    }
    .table2_2,.table2_2 th,.table2_2 td
    {
        font-size:0.95em;
        text-align:center;
        padding:4px;
        border:1px solid #9b9b9b;
        border-collapse:collapse;
        width:1000px;

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
    <table class="table2_2">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="board" varStatus="status">
            <tr>
                <td>${board.SNo}</td>
                <td>
                    <a href="${path}/sboard/view?no=${board.SNo}">
                        ${board.STitle}
                    </a>
                </td>
                <td>${board.member.memNickname}</td>
                <td><button>삭제</button></td>
                </tr>
            
        </c:forEach>   
        </tbody>
    </table>
</body>
</html>