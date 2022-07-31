
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#imgOri').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }

  $("#imgAdd").change(function() {
      readURL(this);
  });
  
  function imgdel() {
	  $('#imgOri').removeAttr('src');
	  $('#imgOri').attr('src', '${ path }/resources/images/Hi_Profil.png');
  }
  
  let account = {
		id: "",
		nick: "",
		name: "",
		email: "",
		phone: ""
	}
  const errMsg = {
		id: "6자 이상 영문 소문자와 숫자만 입력해주세요.",
		pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함하여 입력해주세요",
		pwRe: {
		   success: "비밀번호가 일치합니다",
		   fail: "비밀번호가 일치하지 않습니다"
		},
		nick: "특수문자를 제외하여 입력해주세요.",
		name: "필수 입력 사항입니다.",
		email: "@를 포함한 올바른 이메일을 입력해주세요.",
		phone: "‘-’ 제외 11자리를 입력해주세요." 
		} 
  
	const idInputEl = document.querySelector('#info_id input')
	const idErrorMsgEl = document.querySelector('#error_id span')
	idInputEl.addEventListener('change', () => {
		const idRegExp = /^[a-z0-9]{6,20}$/ 
	    if(idRegExp.test(idInputEl.value)) { 
	      	idErrorMsgEl.textContent = ""
	      	account.id = idInputEl.value
	    } else {
	      	idErrorMsgEl.textContent = errMsg.id
	      	account.id = null
	    }
	    console.log(account)
	  });
  
    let pwVal = "", pwReVal = "", isPwValid = false
	const pwInputEl = document.querySelector('#info_pwd input')
	const pwErrorMsgEl = document.querySelector('#error_pwd span')
	pwInputEl.addEventListener('change', () => {
	  	const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/
	  	pwVal = pwInputEl.value
	  	if(pwRegExp.test(pwVal)) { 
	    	isPwValid = true
	    	pwErrorMsgEl.textContent = ""
	  	} else {
	    	isPwValid = false
	    	pwErrorMsgEl.textContent = errMsg.pw
	  }
	  checkPwValid()
	  console.log(pwVal, pwReVal, isPwValid, account)
	});

	const pwReInputEl = document.querySelector('#info_pwdCheck input')
	const pwReErrorMsgEl = document.querySelector('#error_pwdCheck span')
	pwReInputEl.addEventListener('change', () => {
	  pwReVal = pwReInputEl.value
	  checkPwValid()
	  console.log(pwVal, pwReVal, isPwValid, account)
	});
	
	function checkPwValid() {
	  account.pw = null 
	  if(pwReVal === "") { 
	    pwReErrorMsgEl.textContent = ""
	  }
	  else if(pwVal === pwReVal) { 
	    if(isPwValid)
	      account.pw = pwVal
	    pwReErrorMsgEl.style.color = "green"
	    pwReErrorMsgEl.textContent = errMsg.pwRe.success
	  }
	  else { 
	    pwReErrorMsgEl.style.color = "#f1785b"
	    pwReErrorMsgEl.textContent = errMsg.pwRe.fail
	  }
	}
	
    const nickInputEl = document.querySelector('#info_nick input')
	const nickErrorMsgEl = document.querySelector('#error_nick span')
	nickInputEl.addEventListener('change', () => {
		const nickRegExp =  /^[가-힣a-zA-Z0-9]{0,20}$/
	    if(nickRegExp.test(nickInputEl.value)) { 
	      	nickErrorMsgEl.textContent = ""
	        account.nick = nickInputEl.value
	    } else { 
	      	nickErrorMsgEl.textContent = errMsg.nick
	      	account.nick = null
	    }
	    console.log(account)
	  });
	  
	const nameInputEl = document.querySelector('#info_name input')
	const nameErrorMsgEl = document.querySelector('#error_name span')
	nameInputEl.addEventListener('change', () => {
		const nameRegExp =  /^[가-힣]{2,20}$/
	    if(nameRegExp.test(nameInputEl.value)) { 
	      	nameErrorMsgEl.textContent = ""
	        account.name = nameInputEl.value
	    } else { 
	      	nameErrorMsgEl.textContent = errMsg.name
	      	account.name = null
	    }
	    console.log(account)
	  });  
	  
	const emailInputEl = document.querySelector('#info_email input')
	const emailErrorMsgEl = document.querySelector('#error_email span')
	emailInputEl.addEventListener('change', () => {
		const emailRegExp = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/i
	    if(emailRegExp.test(emailInputEl.value)) { 
	      	emailErrorMsgEl.textContent = ""
	        account.email = emailInputEl.value
	    } else { 
	      	emailErrorMsgEl.textContent = errMsg.email
	      	account.email = null
	    }
	    console.log(account)
	  });
	  
	const phoneInputEl = document.querySelector('#info_phone input')
	const phoneErrorMsgEl = document.querySelector('#error_phone span')
	phoneInputEl.addEventListener('change', () => {
		const phoneRegExp = /^010([0-9]{8})$/ 
	    if(phoneRegExp.test(phoneInputEl.value)) { 
	      	phoneErrorMsgEl.textContent = ""
	        account.phone = phoneInputEl.value
	    } else { 
	      	phoneErrorMsgEl.textContent = errMsg.phone
	      	account.phone = null
	    }
	    console.log(account)
	  });
	  
	const submitBtn = document.querySelector('#btnClear')
	const resultFailEl = document.querySelector('#result-fail')
	submitBtn.addEventListener('click', function() {
	  let isAllFilled = true
	  const word = {  
	    id: "아이디를",
	    pw: "비밀번호를",
	    nick: "닉네임을",
		name: "이름을",
	    email: "이메일을",
	    phone: "전화번호를"
	  }
	  for(element in account) {
	    if(account[element] === null) {
	      resultFailEl.textContent = word[element] + " 다시 한번 확인해주세요"
	      isAllFilled = false
	      break
	    }
	  }
	  if (isAllFilled === true) {
	    resultFailEl.textContent = ""
	    setTimeout(function() {
	      alert("서버 전송 데이터 : " + JSON.stringify(account))
	    }, 300)
	  }
	})  

/*  jquery 적용안됨

	$("#idDuplicate").on("click", () => {
		let userId = $("#userId").val().trim();
		
		$.ajax ({
			type: "POST",
			url: "${ path }/member/idCheck",
			dataTypd: "json",
			data: {
				userId
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate === true) {
					$("#error_id").html("이미 사용 중인 아이디입니다.");
					$("#error_id").css('color','#f1785b');
				} else {
					$("#error_id").html("사용 가능한 아이디입니다.");
					$("#error_id").css('color','green');
					
				}
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
  
  $("#nickDuplicate").on("click", () => {
		let userNick = $("#userNick").val().trim();
		
		$.ajax ({
			type: "POST",
			url: "${ path }/member/nickCheck",
			dataTypd: "json",
			data: {
				userNick
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate === true) {
					$("#error_nick").html("이미 사용 중인 닉네임입니다.");
					$("#error_nick").css('color','#f1785b');
				} else {
					$("#error_nick").html("사용 가능한 닉네임입니다.");
					$("#error_nick").css('color','green');
				}
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
  
  $("#emailDuplicate").on("click", () => {
		let userEmail = $("#userEmail").val().trim();
		
		$.ajax ({
			type: "POST",
			url: "${ path }/member/emailCheck",
			dataTypd: "json",
			data: {
				userEmail
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate === true) {
					$("#error_email").html("이미 사용 중인 이메일입니다.");
					$("#error_email").css('color','#f1785b');
				} else {
					$("#error_email").html("사용 가능한 이메일입니다.");
					$("#error_email").css('color','green');
				}
			},
			error: (error) => {
				console.log(error);
			}
		});
	});

$(document).ready(function() {
		$("#btnClear").on("click", function() {
			let userId = $("#userId").val();
			let userPwd = $("#userPwd").val();
			let userNick = $("#userNick").val();
			let userName = $("#userName").val();
			let userEmail = $("#userEmail").val();
			let userPhone = $("#userPhone").val();
			
			$.ajax({
				type: "POST",
				url: "${ path }/member/enroll",
				dataType: "json",
				data: {
					userId,
					userPwd,
					userNick,
					userName,
					userEmail,
					userPhone,
				},
				success: (obj) => {
					console.log(obj);
				},
				error: (error) => {
					console.log(error);
				}
			});
		});	
	});
	
	*/
 
  
