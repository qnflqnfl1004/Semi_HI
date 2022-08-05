<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />
<jsp:include page="/views/common/home.jsp" />
<jsp:include page="/views/common/footer.jsp" />

<!-- <link rel="stylesheet" href="${ path }/resources/css/view.css" /> -->
<link rel="stylesheet" href="${ path }/resources/css/home.css" />
<link rel="stylesheet" href="${ path }/resources/css/footer.css" />