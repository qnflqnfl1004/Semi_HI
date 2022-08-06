<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />


<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

<style>

.bt_wrap button {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #fff;
    background: #dadbe0;
    border-radius: 10px;
    font-size: 1.4rem;
}

.bt_wrap button {
	background: #7A86B6;
    color: #fff;
    border-radius: 10px;
    float: right;
    min-width: 100px;
}

button {
 font-size: medium;
    font-weight: 900;
    outline: none;
    border: none;
    cursor: pointer;
    background-color: #7A86B6;
    color: #fff; 
}

</style>

<jsp:include page="/views/common/header.jsp" />
 
<div class="board_wrap">
	<div class="board_title">
		<strong>건의하기</strong>
	</div>
	<div class="board_write_wrap">
		<div class="board_write">
		 <form action="${ path }/Qboard/write" method="POST" enctype="multipart/form-data">
			<div class="reason">
				<dl>
					<dt>사유</dt>
					<dd>
						<select name="reason" id="reason">
							<option selected>사유를 선택해 주세요.</option>
							<option value="버그/오류">버그/오류</option>
							<option value="불량유저">불량유저</option>
							<option value="기타">기타</option>
						</select>
					</dd>
				</dl>
			</div>
			
			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd>
						<input type="text" name="title" id="title" placeholder="제목 입력">
					</dd>
				</dl>
			</div>

			<div class="email">
				<dl>
					<dt>이메일</dt>
					<dd>
						<input type="text" name="email" id="email" value="${loginMember.email} ">
					</dd>
				</dl>
			</div>

			<div class="cont" id="content">
				<textarea name="content" placeholder="내용 입력"></textarea>
			</div>

			<div class="addfile">
				<dl>
					<dt>첨부파일</dt>
					<dd>
						<input type="file" name="upfile">
					</dd>
				</dl>
			</div>
			<div class="bt_wrap">
			<button type="submit" >등록</button>
			<button type="button" onclick="location.replace('${pageContext.request.contextPath}/user/list')">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />

