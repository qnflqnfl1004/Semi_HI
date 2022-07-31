<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>memberlist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="${ path }/resources/css/memberlist.css">
</head>
<body>
    <div class="memListForm">
        <div class="memListBody">
            <form action="">
                <table class="memListTable">
                    <tr class="memListHeader">
                        <th colspan="4">
                       	 	<div class="memListPage">
                            	<a href="#">회원 관리</a>
                        	</div>
                        </th>
                        <th colspan="3"s>
                            <div class="memListSearch">
                                <select id="searchList">
                                    <option selected>경고 횟수</option>
                                    <option value="1">아이디</option>
                                    <option value="2">이름</option>
                                    <option value="3">이메일</option>
                                    <option value="4">전화번호</option>
                                </select>
                                <input type="text" placeholder="검색" id="search">
                                <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                            </div>
                        </th>
                    </tr>
                    
                    
                    <tr class="memListTitle">
                        <th class="memList listNo">번호</th>
                        <th class="memList listId">아이디</th>
                        <th class="memList listName">이름</th>
                        <th class="memList listEmail">이메일</th>
                        <th class="memList listPhone">전화번호</th>
                        <th class="memList warning">경고</th>
                        <th class="memList listDel">탈퇴</th>
                    </tr>    
                    <tr class="memListContent">
                        <td class="memList listNo">1</td>
                        <td class="memList listId">내아이디</td>
                        <td class="memList listName">내이름</td>
                        <td class="memList listEmail">mymine@email.com</td>
                        <td class="memList listPhone">01012345678</td>
                        <td class="memList warning">
                            <input type="number" id="warningCount" value="0" min="0" max="3">
                        </td>
                        <td class="memList listDel">
                            <button class="btnX">X</button>
                        </td>
                    </tr>
                    <tr class="memListContent">
                        <td class="memList listNo">2</td>
                        <td class="memList listId"></td>
                        <td class="memList listName"></td>
                        <td class="memList listEmail"></td>
                        <td class="memList listPhone"></td>
                        <td class="memList warning">
                            <input type="number" id="warningCount" value="0" min="0" max="3">
                        </td>
                        <td class="memList listDel">
                            <button class="btnX">X</button>
                        </td>
                    </tr>
                    <tr class="memListContent">
                        <td class="memList listNo">3</td>
                        <td class="memList listId"></td>
                        <td class="memList listName"></td>
                        <td class="memList listEmail"></td>
                        <td class="memList listPhone"></td>
                        <td class="memList warning">
                            <input type="number" id="warningCount" value="0" min="0" max="3">
                        </td>
                        <td class="memList listDel">
                            <button class="btnX">X</button>
                        </td>
                    </tr>
                    <tr class="memListContent">
                        <td class="memList listNo">4</td>
                        <td class="memList listId"></td>
                        <td class="memList listName"></td>
                        <td class="memList listEmail"></td>
                        <td class="memList listPhone"></td>
                        <td class="memList warning">
                            <input type="number" id="warningCount" value="0" min="0" max="3">
                        </td>
                        <td class="memList listDel">
                            <button class="btnX">X</button>
                        </td>
                    </tr>
                    <tr class="memListContent">
                        <td class="memList listNo">5</td>
                        <td class="memList listId"></td>
                        <td class="memList listName"></td>
                        <td class="memList listEmail"></td>
                        <td class="memList listPhone"></td>
                        <td class="memList warning">
                            <input type="number" id="warningCount" value="0" min="0" max="3">
                        </td>
                        <td class="memList listDel">
                            <button class="btnX">X</button>
                        </td>
                    </tr>
                </table>
                <div id="pageBar">
                    <!-- 맨 처음으로 -->
                    <button onclick="location.href='${ path }/admin/memberList?page=1'">&lt;&lt;</button>
        
                    <!-- 이전 페이지로 -->
                    <button onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.prevPage }'">&lt;</button>
        
                    <!--  10개 페이지 목록 -->
                    <!-- <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage}" varStatus="status"> 
                        <c:if test="${ status.current == pageInfo.currentPage }"> -->
                            <!-- <button disabled>${ status.current }</button> -->
                            <button>1</button>
                            <button>2</button>
                            <button>3</button>
                            <button>4</button>
                            <button>5</button>
                            <button>6</button>
                            <button>7</button>
                            <button>8</button>
                            <button>9</button>
                            <button>10</button>
                        <!-- </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }"> -->
                            <!-- <button onclick="location.href='${ path }/board/list?page=${ status.current }'">${ status.current }</button> -->
                       <!-- </c:if>
                    </c:forEach> -->
        
                    <!-- 다음 페이지로 -->
                    <button onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.nextPage }'">&gt;</button>
        
                    <!-- 맨 끝으로 -->
                    <button onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                </div>
            </form>
        </div>

    </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>