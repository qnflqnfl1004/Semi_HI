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
	<title>header</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${ path }/resources/css/header_ver2.css">
	<link rel="stylesheet" href="${ path }/resources/css/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<nav class="navbar">
        <a class="navbar-brand" href="${ path }/">
            <img src="${ path }/resources/images/Hi_Logo.png" alt="" width="130" height="70">
        </a>
        <c:if test="${ empty loginMember }">
            <div class="main1 loginX">
                <button type="button" class="btn btn-Link main2" data-bs-toggle="modal" data-bs-target="#agreemodal">회원가입</button>
                <button type="button" class="btn btn-Link main2" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">로그인</button>
            </div>
        </c:if>

        <c:if test="${ not empty loginMember && loginMember.role == 'ROLE_USER' }">
        <div class="main1 loginO">
            <button type="button" class="btn btn-Link main2" onclick="location.href = '${ path }/sboard/write';">새 글 쓰기</button>
            <div class="dropdown text-end ">	
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${ path }/resources/images/Hi_Menu.png" alt="Hi" width="50" height="45" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="${ path }/member/studyBox">My Study</a></li>
                    <!-- <li><a class="dropdown-item" href="${ path }/member/myPage">My Page</a></li> -->
                    <li>
                      <button type="button" class="dropdown-item btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        My Page
                      </button>
                    </li>
                    <li><a class="dropdown-item" href="${ path }/Qboard/write">건의하기</a></li>
                    <li><a class="dropdown-item" href="#">내 문의함</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${ path }/logout">로그아웃</a></li>
                </ul>
            </div>
        </div>
        </c:if>
	
        <c:if test="${ not empty loginMember && loginMember.role == 'ROLE_ADMIN'}">
        <div class="main1 loginAdmin">
            <div class="dropdown text-end">	
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${ path }/resources/images/Hi_Menu.png" alt="Hi" width="50" height="45" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="${ path }/admin/memberList">회원관리</a></li>
                    <li><a class="dropdown-item" href="${ path }/admin/sboard">게시물관리</a></li>
                    <li><a class="dropdown-item" href="${ path }/nboard/list">공지사항</a></li>
                    <li><a class="dropdown-item" href="${ path }/admin/Qlist">건의사항</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${ path }/logout">로그아웃</a></li>
                </ul>
            </div>
        </div>
        </c:if>
	</nav>
    
     <!-- Modal -->
  <div class="modal fade" id="agreemodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
      <div class="modal-content">
        <div class="modal-header">
            <img class="logo" src="${ path }/resources/images/Hi_Logo.png" alt="" width="120" height="60">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <form name="agreeForm" action="${ path }/member/agree" method="POST" >
          <div class="form-check checkbox_group">
              <input class="form-check-input checkAll" id="checkAll" type="checkbox" value="" style="width: 20px; height:20px; f">
              <label class="form-check-label agreeAllTitle" for="checkAll">
                HI(하이)의 이용약관 및 개인정보 수집 및 이용에 모두 동의합니다.
              </label> <br>
              
              <input class="form-check-input checkSep" id="check1" type="checkbox" value="">
              <label class="form-check-label agreeTitle" for="check1">
                HI(하이)의 이용약관에 동의합니다.
              </label> <br>
              <textarea class="terms" cols="80" rows="10" readonly>
               블라블라
              </textarea>
          
	          <input class="form-check-input checkSep" id="check2" type="checkbox" value="">
	          <label class="form-check-label agreeTitle" for="check2">
	            HI의 개인정보 수집 및 이용에 동의합니다.
	          </label> <br>
	          <textarea class="terms" cols="80" rows="10" readonly>
	            다들 블라블라
	          </textarea>
          </div>
          </form>
        </div>
              <div class="modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-primary btnNext" data-bs-toggle="modal" data-bs-target="#enrollmodal">다음</button>
              </div>
            </div>
          </div>
        </div>
        
   <script type="text/javascript">
   
	$(".checkbox_group").on("click", "#checkAll", function() {
		$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});

	$(".checkbox_group").on("click", ".checkSep", function() {
	    var is_checked = true;
	    
	    $(".checkbox_group .checkSep").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    
	    $("#checkAll").prop("checked", is_checked);
	});
	
	$(".btnNext").on("click", function() {
		 if($("#checkAll").is(":checked")){
          
      } else { 
          alert("모든 항목을 체크 해주세요.")
		  location.href="${ path }/";
          return false;
      }
	});
	
   </script>
        
        <div class="modal fade" id="enrollmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
      <div class="modal-content">
        <div class="modal-header">
            <img class="logo" src="${ path }/resources/images/Hi_Logo.png" alt="" width="120" height="60">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="enrollContent">
            <form name="enrollForm" action="${ path }/member/enroll" method="POST" >
              <table class="enrollTable">
                <tr>
                  <th class="enrollForm-title" colspan="2">Welcome to HI!</th>
                </tr>
                <tr>
                    <td class="profilForm-img" colspan="2">
                    	<img id="imgOri" name="imgOri" src="${ path }/resources/images/Hi_Profil.png" alt="profil" width="150" height="150">                    
                    </td>
                </tr>
                <tr>
                  <th class="profilForm-title" colspan="2">"여러분 만의 특별한 이미지를 설정해보세요!"</th>
                </tr>
                <tr>
                  <th class="profilForm-title" colspan="2">물론, 언제든지 변경할 수 있습니다.</th>
                </tr>
                <tr>
                  <td class="profilForm-btn" colspan="2">
                      <input type="file" name="file" accept="image/*" id="imgAdd" style="display:none;">
						<label for="imgAdd" class="imgBtn">이미지 추가</label>
                      <button type="button" class="imgBtn" id="imgDel" onclick="imgDel()">이미지 삭제</button>
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-name">아이디</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_id">
                  	<input type="text" class="info_enter" name="userId" id="userId" placeholder="아이디를 입력해주세요.">
                  </td>
                  <td><input type="button" class="btn_enter" value="중복확인" id="idDuplicate"></td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_id"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">비밀번호</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_pwd">
                  	<input type="password" class="info_enter" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요.">
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_pwd"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">비밀번호 확인</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_pwdCheck">
                  	<input type="password" class="info_enter" name="userPwdCheck" id="userPwdCheck" placeholder="비밀번호를 다시 입력해주세요.">
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_pwdCheck"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">닉네임</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_nick">
                  	<input type="text" class="info_enter" name="userNick" id="userNick" placeholder="닉네임를 입력해주세요.">
                  </td>
                  <td><input type="button" class="btn_enter" value="중복확인" id="nickDuplicate"></td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_nick"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">이름</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_name">
                  	<input type="text" class="info_enter" name="userName" id="userName" placeholder="이름를 입력해주세요.">
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_name"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">이메일</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_email">
                  	<input type="text" class="info_enter" name="userEmail" id="userEmail" placeholder="@ 포함하여 이메일을 입력해주세요.">
                  </td>
                  <td><input type="button" class="btn_enter" value="중복확인" id="emailDuplicate"></td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_email"><span></span></td>
                </tr>
                <tr>
                  <td class="enrollForm-name">전화 번호</td>
                </tr>
                <tr>
                  <td class="enrollForm-text" id="info_phone">
                  	<input type="text" class="info_enter" name="userPhone" id="userPhone" placeholder="010부터 -를 제외한 11자리 숫자를 입력해주세요.">
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_phone"><span></span></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div class="modal-footer" style="justify-content: center;">
          <button type="submit" class="btn btn-primary btnNext" id="btnClear" data-bs-toggle="modal" data-bs-target="#successmodal" >가입</button>
        </div>
      </div>
    </div>
  </div>
  


  <!-- MyPage - 비밀번호 확인 모달 -->
 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="pwdCheckTitle">비밀번호 재확인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <table>
            <tr>
              <td>
                <input type="password" class="inputPwdCheck" name="pwdDoubleCheck" id="pwdDoubleCheck" placeholder="비밀번호를 입력해주세요.">
              </td>
            </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="myPagePwdCheckFinish">MyPage</button>
        </div>
      </div>
    </div>
  </div> 

<!-- MyPage 비밀번호 확인 SCRIPT -->
<script>
  $("#myPagePwdCheckFinish").on("click", () => {
    let pwdDoubleCheck = $("#pwdDoubleCheck").val().trim();

    $.ajax({
      type: "POST",
      url: "${ path }/member/myPagePwdCheck",
      dataType : "JSON",
      data: {
        pwdDoubleCheck
      },
      success: (obj) => {
        console.log(obj);
        if(obj != null) {
          location.href = "${ path }/member/myPage"
        } else {
          alert("비밀번호를 확인해 주세요.")
        }
      },
      error:(error) => {
        console.log(error);
      }
    })
  });

</script>

  <script type="text/javascript">
	  $("#idDuplicate").on("click", () => {
			let userId = $("#userId").val().trim();
			
			$.ajax ({
				type: "POST",
				url: "${ path }/member/idCheck",
				dataType: "json",
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
				dataType: "json",
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
				dataType: "json",
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
  </script>

  <div class="modal fade" id="successmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
      <div class="modal-content">
        <div class="modal-header">
            <img class="logo" src="${ path }/resources/images/Hi_Logo.png" alt="" width="120" height="60">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="successContent">
                <form name="successForm" action="" method="POST" >
                  <table class="successTable">
                    <tr>
                        <th class="successForm-title" id="success1">축하합니다! </th>
                    </tr>
                    <tr>
                        <th class="successForm-title" id="success2">HI에서 이제 팀원을 찾아보세요!</th>
                    </tr>
                  </table>
                </form>
            </div>
        </div>
        <div class="modal-footer" style="justify-content: center;">
          <button onclick="toggleConfetti();" type="button" class="btn btn-primary btnNext" >찾으러 가기</button>
        </div>
      </div>
    </div>
  </div>
    
    
 <div id="logins">
 <div class="login-container">     	
   <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
   	 <div class="modal-dialog modal-dialog-scrollable ">
	   <div class="modal-content">
	        <div class="modal-header">
	            <img class="logo" src="${ path }/resources/images/Hi_Logo.png" alt="" width="120" height="60">
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body" id="modal_body">
	            
		       <c:if test="${  empty loginMember }">
		     	<form id="loginFrm" action="${ path }/login" method="post">
		     	        
		    			<input type="text" name="userId" class="text-field" placeholder="아이디"
		    			value="${  empty cookie.saveId ? '' : cookie.saveId.value }" required>
		                <input type="password" name="userPwd" class="text-field" placeholder="비밀번호" required>
		                <input type="submit" value="로그인" class="submit-btn" >
		    		
					<div class="modal-footer" style="justify-content: center;">
		            	<img class="loginImg" src="${ path }/resources/images/naver.png" width="70" height="70"  >
		            	<img class="loginImg" src="${ path }/resources/images/googel.png" width="70" height="70"  >
		            	<img class="loginImg" src="${ path }/resources/images/kakao.png" width="70" height="70"  >
		            </div>
		                <p id="joinLogin">연동 로그인</p>		
		 		 </form>            
	    	   </c:if>               			        
	       	 </div>		          		        			        		            
	        <div class="modal-footer" style="justify-content: center;">
	        	<div class="links">
	        		<a href="#">아이디를 잊어버리셨나요?</a>
		        	<a href="#">비밀번호를 잊어버리셨나요?</a>
		    	</div>	          	
	        </div>	        
    	  </div>
     	</div>
	  </div>
    </div>   
  </div>
        		
  <script src="${ path }/resources/js/confetti.js"></script>
  <script src="${ path }/resources/js/enroll.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>