<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="${ path }/resources/css/footer.css" />
</head>
<body>
    <div id="foot0" class="footer-container">
        <div id="footer" class="footer">
            <div id="foot1" class="footer-heading footer-1">
                <h2>HI 제작 정보</h2>
                <p>HI</p>
                <p>소속 : KH정보교육원|서울특별시 강남구 역삼동 823-25</p>
                <p>팀장 : 김민주</p>
                <p>팀원 : 신영은 엄솔이 박현진 정연우 김덕겸</p>
            </div>
            <div id="foot2" class="footer-heading footer-2">
                <h2>관련 사이트</h2>
                <a href="https://github.com/rn1nju">김민주 : https://github.com/rn1nju</a>
                <a href="https://github.com/qnflqnfl1004">신영은 : https://github.com/qnflqnfl1004</a>
                <a href="https://github.com/eumsoli">엄솔이 : https://github.com/eumsoli</a>
                <a href="https://github.com/hgggny">박현진 : https://github.com/hgggny</a>
                <a href="https://github.com/J-YEONU">정연우 : https://github.com/J-YEONU</a>
                <a href="https://github.com/rkwmdk">김덕겸 : https://github.com/rkwmdk</a>
            </div>
            <div id="foot3" class="footer-heading footer-3">
                <h2>고객센터</h2>
                <p>Tel : 010-1234-5678(평일 09:00 ~ 18:00)</p>
                <p>Mail : HI@gmail.com</p>
            </div>
            <div id="foot4" class="footer-heading footer-4">
                <h2>Copyright 2022. &lt;KH-SEMI-PROJECT&gt;. All rights reserved.</h2>
            </div>
        </div>
    </div>
</body>
</html>