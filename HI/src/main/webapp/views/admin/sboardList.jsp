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
        <select id="searchLang" name="searchLang" onchange="changeLangSelect();">
            <option selected disabled value="-1">언어 선택</option>
            <option value="0">전체</option>
            <option value="1">영어</option>
            <option value="2">일본어</option>
            <option value="3">중국어</option>
            <option value="4">기타</option>
        </select>
        <select id="searchTest" name="searchTest" onchange="changeTestSelect();">
            <option selected disabled value="-1">시험 선택</option>
            <option value="0">전체</option>
            <option value="1">TOEIC</option>
            <option value="2">TOEFL</option>
            <option value="3">OPIC</option>
            <option value="4">TEPS</option>
            <option value="5">JLPT</option>
            <option value="6">JPT</option>
            <option value="7">HSK</option>
            <option value="8">BCT</option>
            <option value="9">TSC</option>
            <option value="10">프랑스어</option>
            <option value="11">스페인어</option>
            <option value="12">독일어</option>
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
            <th scope="col">언어</th>
            <th scope="col">시험</th>
            <th scope="col">작성자</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="board" varStatus="status">
            <c:if test="${empty list}">
                <tr>
                    <td>검색 결과가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${not empty list}">
                <tr>
                    <th scope="row">${board.SNo}</th>
                    <td>
                        <a href="${path}/sboard/view?no=${board.SNo}">
                            ${board.STitle}
                        </a>
                    </td>
                    <td>${board.language.LType}</td>
                    <td>${board.test.testType}</td>
                    <td>${board.member.nickName}</td>
                    <td>
                        <form action="${path}/sboard/delete" method="post">
                            <input type="hidden" name="no" value="${board.SNo}">
                            <button type="submit" id="btnDelete">삭제</button>
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    
    <div id="pageBar">
        <!-- 맨 처음으로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=1'">&lt;&lt;</button>

        <!-- 이전 페이지로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.prevPage }'">&lt;</button>
        
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>6</button>
        <button>7</button>
        <button>8</button>
        <!--  10개 페이지 목록 -->
        <!-- <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
            <c:if test="${ status.current == pageInfo.currentPage }">
                <button>${pageInfo.currentPage}</button> -->
            <!-- </c:if>
            <c:if test="${ status.current != pageInfo.currentPage }">
                <button onclick="location.href='${ path }/admin/sboardList?page=${ status.current }'">${ status.current }</button>
            </c:if>
        </c:forEach> -->


        <!-- 다음 페이지로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.nextPage }'">&gt;</button>

        <!-- 맨 끝으로 -->
        <button onclick="location.href='${ path }/admin/sboardList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
    </div>

    
<script>
    let searchLang = document.getElementById('searchLang');
    let searchTest = document.getElementById('searchTest');
    let langValue = searchLang.options[searchLang.selectedIndex].value;
    let testValue = searchTest.options[searchTest.selectedIndex].value;

    //현재 url과 파라미터를 저장
    let url = new URL(window.location.href);
    let urlParamLang = url.searchParams.get('searchLang');
    let urlParamTest = url.searchParams.get('searchTest');
    //현재 검색 상태를 select
    searchLang.options[Number(urlParamLang)+1].selected = true;
    searchTest.options[Number(urlParamTest)+1].selected = true;

//언어 검색
function changeLangSelect(){
    
    //언어와 시험은 서로 유기적인 관계이지만 동시에 검색할 필요가 없음
    //검색은 단일로도 가능 제발........
    langValue = searchLang.options[searchLang.selectedIndex].value;
    // testValue = searchTest.options[searchTest.selectedIndex].value;
    console.log(langValue);
    location.href = '${ path }/admin/sboardList?searchLang='+langValue+'&searchTest='+0;
}

//시험 검색
function changeTestSelect(){
    
    // langValue = searchLang.options[searchLang.selectedIndex].value;
    testValue = searchTest.options[searchTest.selectedIndex].value;
    console.log(langValue);
    location.href = '${ path }/admin/sboardList?searchLang='+0+'&searchTest='+testValue;
}


</script>
</body>
<jsp:include page="/views/common/footer.jsp" /> 
</html>