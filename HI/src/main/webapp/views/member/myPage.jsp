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
	<h1 id="h1myPage">M Y P A G E</h1>
	<div class="userImageUpload">
		<div class="userImage">
			<img src="${ path }/resources/images/Hi_Profil.png" alt="프로필" style="width:100px; height:100px; border-radius: 50%;">
		</div>
		<div class="btnUserImageBox">
			<button class="btnImageUpload">이미지 선택</button>
			<button class="btnImageDelete">이미지 제거</button>
		</div>
	</div>
	<form id="memberFrm" action="${ path }/member/updateUserInfo" method="POST">
		<table class="userInfoChange">
			<tbody>
					<input type="hidden" name="userNo" value="${ loginMember.no }">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" class="userInfoInputBox" name="userName" value="${ loginMember.name }" style="margin-bottom: 15px;"id="userName" readonly required>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newNick" value="${ loginMember.nickName }" id="newNick" >
						<span class="userInfoAlert" id="error_newNick"></span>
					</td>
					<td>
						<input type="button" class = "btnDuplicate" id="newNickDuplicate" value="중복확인"></input>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" class="userInfoInputBox" name="userId" value="${ loginMember.id }" style="margin-bottom: 15px;" id="newId" readonly required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newEmail" value="${ loginMember.email }" id="newEmail" >
						<span class="userInfoAlert" id="error_newEmail"></span>
					</td>
					<td>
						<input type="button" class="btnDuplicate" id="newEmailDuplicate" value="중복확인"></input>
					</td>
				</tr>
				<tr>
					<td class="enrollForm-error" id="error_email"><span></span></td>
				</tr>	
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" class="userInfoInputBox" name="newPhone" value="${ loginMember.phone }" id="newPhone" required>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btnBox">
			<input type="submit" class="btn" id="userInfoChangeFinish" value="수정 완료"></input>
		</form> 
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#changePwd" >
			비밀번호 변경		  
		</button>
		<input type="button" class="btn" id="userDeleteFinish" value="회원 탈퇴"></input>
		</div>
		
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
					<form action="${ path }/member/updatePwd" method="POST">
						<table>
							<tr>
								<th class="enrollForm-name">비밀번호 변경</th>
							</tr>
							<tr>
								<td class="enrollForm-text" id="info_newPwd">
									<input type="password" class="inputPwdChange" name="newPwd" id="newPwd" placeholder="비밀번호를 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td class="enrollForm-error" id="#error_newPwd">
									<span></span>
								</td>
							</tr>
							<tr>
								<th class="enrollForm-name">비밀번호 확인</th>
							</tr>
							<tr>
								<td class="enrollForm-text" id="info_newPwdCheck">
									<input type="password" class="inputPwdChange" name="newPwdCheck" id="newPwdCheck" placeholder="비밀번호를 다시 입력해주세요.">
								</td>
							</tr>	
							<tr>
								<td class="enrollForm-error" id="error_newPwdCheck">
									<span></span>
								</td>
							</tr>
						</table>
					</form>
					<input type="hidden" name="userId" />
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<input type="button" class="btn btn-primary" id="userPwdFinish" value="변경 완료"></input>
			</div>
	</div>
	</div>
</div>
<script>
	$(document).ready(() => {
		// 닉네임 중복 확인
		$("#newNickDuplicate").on("click", () => {
			let userNick = $("#newNick").val().trim();
			
			$.ajax ({
				type: "POST",
				url: "${ path }/member/nickCheck",
				dataType: "json",
				data: {
					userNick
				},
				success: (obj) => {
					console.log(obj);
					
					if(obj.duplicate === true) {
						$("#error_newNick").html("이미 사용 중인 닉네임입니다.");
						$("#error_newNick").css('color','#f1785b');
					} else {
						$("#error_newNick").html("사용 가능한 닉네임입니다.");
						$("#error_newNick").css('color','green');
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});
		
		// 이메일 중복 확인
		$("#newEmailDuplicate").on("click", () => {
			let userEmail = $("#newEmail").val().trim();
			
			$.ajax ({
				type: "POST",
				url: "${ path }/member/emailCheck",
				dataType: "json",
				data: {
					userEmail
				},
				success: (obj) => {
					console.log(obj);
					
					if(obj.duplicate === true) {
						$("#error_newEmail").html("이미 사용 중인 이메일입니다.");
						$("#error_newEmail").css('color','#f1785b');
					} else {
						$("#error_newEmail").html("사용 가능한 이메일입니다.");
						$("#error_newEmail").css('color','green');
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});

		//비밀번호 변경 완료
		$("#userPwdFinish").on("click", () => {
			let newPwd = $("#newPwd").val().trim();
			let newPwdCheck = $("#newPwdCheck").val().trim();

			$.ajax({
				type:"POST",
				url: "${ path }/member/updatePwd",
				// dataType: "json",
				data: {
					newPwd,
					newPwdCheck
				},
				success: (obj) => {
					console.log(obj);
					if(obj === "success") {
						alert("변경 완료");
					} else {
						alert("변경 실패");
					}
				},
				error: (error) => {
					console.log(error);
				}
			})
		});

		// myPage 수정 완료
		$("#userInfoUpdateFinish").on("click", () => {
			history.go(-1);
		});

		// 탈퇴 완료
		$("#userDeleteFinish").on("click", () => {
			if(confirm("정말로 탈퇴하시겠습니까?"))
				location.replace("${ path }/member/deleteUser");
		});





		// 비밀번호 확인
		const errMsg = {
		pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함하여 입력해주세요",
		pwRe: {
		    success: "비밀번호가 일치합니다",
		    fail: "비밀번호가 일치하지 않습니다"
			}
		} 

		let pwVal = "", pwReVal = "", isPwValid = false
		const newpwInputEl = document.querySelector('#info_newPwd input')
		const newpwErrorMsgEl = document.querySelector('#error_newPwd span')

		newpwInputEl.addEventListener('change', () => {
			const newpwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/
			pwVal = newpwInputEl.value
			if(newpwRegExp.test(pwVal)) { 
				isPwValid = true
				newpwErrorMsgEl.textContent = "a"
			} else {
				isPwValid = false
				// newpwErrorMsgEl.textContent = errMsg.pw
			}

			checkPwValid()
			console.log(pwVal, pwReVal, isPwValid, account)
		});

		const newpwReInputEl = document.querySelector('#info_newPwdCheck input')
		const newpwReErrorMsgEl = document.querySelector('#error_newPwdCheck span')
		pwReInputEl.addEventListener('change', () => {
			pwReVal = newpwReInputEl.value
			checkPwValid()
			console.log(pwVal, pwReVal, isPwValid, account)
		});
		
		function checkPwValid() {
		account.pw = null 
		if(pwReVal === "") { 
			newpwReErrorMsgEl.textContent = ""
		}
			else if(pwVal === pwReVal) { 
				if(isPwValid)
				account.pw = pwVal
				newpwReErrorMsgEl.style.color = "green"
				newpwReErrorMsgEl.textContent = errMsg.pwRe.success
			}
			else { 
				newpwReErrorMsgEl.style.color = "#f1785b"
				newpwReErrorMsgEl.textContent = errMsg.pwRe.fail
			}
		};

});
</script>
</body>
<jsp:include page="/views/common/footer.jsp" />
</html>