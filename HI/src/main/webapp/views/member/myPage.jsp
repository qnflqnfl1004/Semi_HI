<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage.css">

<body>
<div class="view-container">
	<h1 id="h1myPage">M Y - P A G E</h1>
	<form id="memberFrm" action="${ path }/member/updateUserInfo" method="GET">
		<div class="userImageUpload">
			<div class="userImage">
				<img src="${ path }/resources/images/프로필.png" alt="프로필" style="width:100px; height:100px; border-radius: 50%;">
			</div>
			<div class="btnUserImageBox">
				<button class="btnImageUpload">이미지 선택</button>
				<button class="btnImageDelete">이미지 제거</button>
			</div>
		</div>
		<table class="userInfoChange">
			<tbody>
				
					<input type="hidden" name="userNo" value="${ loginMember.no }">
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" class="userInfoInputBox" name="userName" value="${ loginMember.userName }" style="margin-bottom: 15px;"id="userName" readonly required>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newNick" value="${ loginMember.userNick }" id="newNick" required>
						<span class="userInfoAlert">필수 정보입니다. </span>
					</td>
					<td>
						<button class="btnDuplicate" id="btnNickDuplicate" type="submit">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" class="userInfoInputBox" name="userId" value="${ loginMember.userId }" style="margin-bottom: 15px;" id="userId" readonly required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newEmail" value="${ loginMember.userEmail }" id="newEmail" required>
						<span class="userInfoAlert" >필수 정보입니다. </span>
					</td>
					<td>
						<button type="submit" class="btnDuplicate" id="btnEmailDuplicate">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newPhone" value="${ loginMember.userPhone }" id="newPhone" required>
						<span class="userInfoAlert">필수 정보입니다. </span>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btnBox">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#changePwd" >
				비밀번호 변경		  
			</button>
			<input type="submit" class="btn" id="userInfoChangeFinish" value="수정 완료"></input>
			<input type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#btnDelete" value="회원 탈퇴"></input>
		</div>
	</form> 

<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title" id="exampleModalLabel">Change Password</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="updatePwd-container">
					<form action="${ path }/member/updatePwd" method="post">
						<table>
							<!-- <tr>
								<th>현재 비밀번호</th>
								<td>
									<input
									type="password"
									class="inputPwdChange"
									name="userPwd"
									id="userPwd"
									required
									/>
								</td>
								</tr> -->
							<tr>
								<th>비밀번호 변경</th>
								<td>
								<input
									type="password"
									class="inputPwdChange"
									name="newPwd"
									id="newPwd"
									required
								/>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
								<input type="password" class="inputPwdChange" name="newPwd"
								id="newPwd"								
								required
								/>
								</td>
							</tr>
						</table>
					</form>
					<input type="hidden" name="userId" />
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="userPwdFinish">변경 완료</button>
			</div>
	</div>
	</div>
	</div>



<!-- myPage 수정 완료 모달 -->
<!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header">
			<h5 class="modal-title" id="staticBackdropLabel">수정 완료</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="updateInfoMsg">
        수정이 완료 되었습니다.
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" id="userInfoUpdateFinish">완료</button>
		</div>
    </div>
	</div>
</div> -->



<!-- myPage 회원 탈퇴 모달 -->
<div class="modal fade" id="btnDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">	
		<div class="modal-header">
		  <h5 class="modal-title" id="btnDelete" style="color:brown">회원 탈퇴</h5>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="updateInfoMsg" style="color:brown">
		정말 탈퇴하시겠습니까?
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">탈퇴 취소</button>
			<button type="button" class="btn btn-primary" id="userDeleteFinish" style=" background-color: black;">탈퇴 완료</button>
		</div>
	  </div>
	</div>
  </div>
<script>
	$(document).ready(() => {
		// 닉네임 중복 확인
    	  $("#btnNickDuplicate").on("click", () => {
			alert("닉네임 중복 확인 버튼입니다. ")
			// let newNick = $("#newNick").val.trim();

			// $.ajax({
			// 	type: "POST",
			// 	url: "${ path }/member/nickDuplicate",
			// 	dataType: "json"
			// 	data: {
			// 		"newNick" : newNick
			// 	},
			// 	success: (obj) => {
			// 		console.log(obj);

			// 		if(obj.duplicat === true) {
			// 			alert("이미 사용중인 닉네임 입니다.")
			// 		} else {
			// 			alert("사용 가능한 닉네임 입니다.")
			// 		}
			// 	},
			// 	error: (error) => {
			// 		consol.log(error);
			// 	}
			// });
		    // });
		
		// 이메일 중복 확인
		$("#btnEmailDuplicate").on("click", () => {
			alert("이메일 중복 확인 버튼입니다.")
		});

		//비밀번호 변경 완료
		// $("#userPwdFinish").on("click", () => {
		// 	location.replace("${ path }/member/updatePwd")
		// });

		// myPage 수정 완료
		$("#userInfoUpdateFinish").on("click", () => {
			location.replace("${ path }/member/updateUserInfo");
		});
		
		// 탈퇴 완료
		$("#userDeleteFinish").on("click", () => {
			location.replace("${ path }/member/deleteUser");
					
	});
});
</script>



<!-- 부트스트랩 script -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous"
></script>
</body>
</html>
