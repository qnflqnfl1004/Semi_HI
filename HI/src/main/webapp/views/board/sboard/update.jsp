<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/write.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HI</title>
</head>
<body>
    <form action="${ path }/sboard/update" method="POST">
        <input type="hidden" name="no" value="${board.SNo}">
        <div class="sboard">
            <h2 class="sboardH2"> 🚀 스터디의 정보를 수정하세요 </h2>  
            <article class="sboardSelect">
                <div class="sboardDropbox">
                    <label class="sboardLabel">진행할 스터디</label>
                    <button type="button" class="selectBtn" id="langNoSelect">
                        함께 공부할 언어 선택
                    </button>
                    <ul class="dropboxList" name="langNo" style="z-index: 4;">
                        <li>
                            <button type="button" name="langNoBtn" value="1">>영어</button>
                        </li>
                        <li>
                            <button type="button" name="langNoBtn" value="2">>일본어</button>
                        </li>
                        <li>
                            <button type="button" name="langNoBtn" value="3">중국어</button>
                        </li>
                        <li>
                            <button type="button" name="langNoBtn" value="4">기타</button>
                        </li>
                        <input type="hidden" name="langNo" id="langNo" value="${board.language.LNo}">
                    </ul>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel" style="z-index: 99;">모집 분야</label>
                    <button type="button" class="selectBtn" id="testNoSelect">
                        스터디로 진행할 시험 선택
                    </button>
                    <ul class="dropboxList" name="testNo">
                        <li>
                            <button type="button" name="testNoBtn" value="1">토익</button>
                        </li>
                        <li>
                            <button type="button" name="testNoBtn" value="2">토플</button>
                        </li>
                        <li>
                            <button type="button" name="testNoBtn" value="3">오픽</button>
                        </li>
                        <li>
                            <button type="button" name="testNoBtn" value="4">텝스</button>
                        </li>
                        <input type="hidden" name="testNo" id="testNo" value="${board.test.testNo}">
                    </ul>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">모집 인원</label>
                    <button type="button" class="selectBtn" id="sMemberSelect">
                            인원 미정 ~ 5명 이상
                    </button>
                    <ul class="dropboxList" name="sMember"   style="z-index: 3;">
                        <li>
                            <button type="button" name="sMemberBtn" value="-1">인원 미정</button>
                        </li>
                        <li>
                            <button type="button" name="sMemberBtn" value="1">1명</button>
                        </li>
                        <li>
                            <button type="button" name="sMemberBtn" value="2">2명</button>
                        </li>
                        <li>
                            <button type="button" name="sMemberBtn" value="3">3명</button>
                        </li>
                        <li>
                            <button type="button" name="sMemberBtn" value="4">4명</button>
                        </li>
                        <li>
                            <button type="button" name="sMemberBtn" value="5">5명 이상</button>
                        </li>
                        <input type="hidden" name="sMember" id="sMember" value="${board.SMember}">
                    </ul>
                </div>
                <div>
                    <label class="sboardLabel">모집 마감일</label>
                    <div>
                        <input type="date" class="sboardDate" name="sDueDate" value="${board.SDueDate}">
                    </div>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">진행 기간</label>
                    <button type="button" class="selectBtn" id="sPeriodSelect">
                        기간 미정 ~ 6개월 이상
                    </button>
                    <ul class="dropboxList" name="sPeriod"   style="z-index: 2;">
                        <li>
                            <button type="button" name="sPeriodBtn" value="-1" >기간 미정</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="1" >1개월</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="2" >2개월</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="3" >3개월</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="4" >4개월</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="5" >5개월</button>
                        </li>
                        <li>
                            <button type="button" name="sPeriodBtn" value="6" >6개월 이상</button>
                        </li>
                    <input type="hidden" name="sPeriod" id="sPeriod" value="${board.SPeriod}">
                    </ul>
                </div>
                <div>
                    <label class="sboardLabel">시작 예정일</label>
                    <div>
                        <input type="date" class="sboardDate" name="sDate" value="${board.SDate}">
                    </div>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">연락 방법</label>
                    <button type="button" name="sContact" class="selectBtn" id="sContactSelect">
                        연락 방법 선택
                    </button>
                    <ul class="dropboxList" name="sContact" style="z-index: 1;">
                        <li>
                            <button type="button" name="sContactBtn" value="kakao" >카카오톡 오픈채팅</button>
                        </li>
                        <li>
                            <button type="button" name="sContactBtn" value="email" >이메일</button>
                        </li>
                        <input type="hidden" class="sboardContect"  name="sContact" id="sContact" value="${board.SContact}">
                    </ul>
                    <input type="text" class="sContactInput" name="sContact" placeholder="링크 주소를 입력해주세요">
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">모집 레벨</label>
                    <button type="button" class="selectBtn" id="sLevelSelect">
                        고급 / 중급 / 초급
                    </button>
                    <ul class="dropboxList" name="sLevel" style="z-index: 1;">
                        <li>
                            <button type="button" name="sLevelBtn" value="초급" >초급</button>
                        </li>
                        <li>
                            <button type="button" name="sLevelBtn" value="중급" >중급</button>
                        </li>
                        <li>
                            <button type="button" name="sLevelBtn" value="고급" >고급</button>
                        </li>
                        <input type="hidden" name="sLevel" id="sLevel" value="${board.SLevel}">
                    </ul>
                </div>
            </article>
            <h2 class="sboardH2"> 🚀 스터디에 대해 소개해 주세요 </h2>
            <article class="sboardInfo">
                <label class="sboardLabel">제목</label>
                <div>
                    <input type="text" class="sboardTitle" style="padding-left: 10px;" placeholder="제목을 입력해 주세요" name="sTitle" value="${ board.STitle }">
                </div>
                <label class="sboardLabel">내용</label>
                <div>
                    <textarea class="sboardContent" style="padding-left: 10px;" cols="124" rows="10" placeholder="내용을 입력해 주세요" name="sContent">${board.SContent}
                    </textarea>
                </div>
            </article>
            <div class="btns">
                <input type="reset" value="취소" class="cancelBtn"></input>
                <input type="submit" value="수정" class="submitBtn"></input>
            </div>
        </div>
    </form>
        
    <script>
        let btns = document.querySelectorAll('.selectBtn');
        let lists = document.querySelectorAll('.dropboxList');
        
        for (let i = 0; i < btns.length; i++) {
            
            btns[i].addEventListener('click', (event) => {
                btns[i].classList.toggle('on'); 
                
                event.stopPropagation();
            });
        }
        
        for (let i = 0; i < lists.length; i++) {
            
            lists[i].addEventListener('click', () => {
                if (event.target.nodeName === "BUTTON") {
                    //선택한 옵션 값
                    let val = event.target.value;
                    //input tag
                    let tag = event.target.parentElement.parentElement.children;
                    console.log(tag);

                    let arr = Array.from(tag);
                  	//마지막배열요소(input)값 제어
                    arr.at(-1).value = val; 
                    // console.log(arr.at(-1).value);

                    //선택된 옵션의 value저장
                    btns[i].innerText = event.target.innerText;
                    btns[i].classList.remove('on');
                }
            });
        }

        //수정페이지 게시판 해당값에 따라 버튼입력되게 해주는 기능
        window.onload = function(){
            //언어
            //input값
            let langNo = document.getElementById('langNo').value;
            //select 하위 버튼
            let langNoBtn = document.getElementsByName('langNoBtn');

            for(let i = 0; i < langNoBtn.length; i++){
                //입력값 일치
                if(langNoBtn[i].value == langNo){
                    let langNoSelect = document.getElementById('langNoSelect');
                    langNoSelect.innerText = langNoBtn[i].innerText;
                }
            }

            //시험과목
            //input값
            let testNo = document.getElementById('testNo').value;
            //select 하위 버튼
            let testNoBtn = document.getElementsByName('testNoBtn');

            for(let i = 0; i < testNoBtn.length; i++){
                //입력값 일치
                if(testNoBtn[i].value == testNo){
                    let testNoSelect = document.getElementById('testNoSelect');
                    testNoSelect.innerText = testNoBtn[i].innerText;
                }
            }

            //모집인원
            //input값
            let sMember = document.getElementById('sMember').value;
            //select 하위 버튼
            let sMemberBtn = document.getElementsByName('sMemberBtn');

            for(let i = 0; i < sMemberBtn.length; i++){
                //입력값 일치
                if('미정' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '인원 미정';
                }else if('1명' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '1명';
                }else if('2명' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '2명';
                }else if('3명' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '3명';
                }else if('4명' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '4명';
                }else if('5명 이상' == sMember){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '5명 이상';
                }
            }

            //모집기간
            //input값
            let sPeriod = document.getElementById('sPeriod').value;
            //select 하위 버튼
            let sPeriodBtn = document.getElementsByName('sPeriodBtn');

            for(let i = 0; i < sPeriodBtn.length; i++){
                //입력값 일치
                if('미정' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '미정';
                }else if('1개월' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '1개월';
                }if('2개월' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '2개월';
                }if('3개월' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '3개월';
                }if('4개월' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '4개월';
                }if('5개월' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '5개월';
                }if('6개월 이상' == sPeriod){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '6개월 이상';
                }
            }

            //연락방법
            //input값
            let sContact = document.getElementById('sContact').value;
            //select 하위 버튼
            let sContactBtn = document.getElementsByName('sContactBtn');

            for(let i = 0; i < sContactBtn.length; i++){
                //입력값 일치
                if('카카오톡 오픈채팅' == sContact){
                    let sContactSelect = document.getElementById('sContactSelect');
                    sContactSelect.innerText = '카카오톡 오픈채팅';
                }else if('이메일' == sContact){
                    let sContactSelect = document.getElementById('sContactSelect');
                    sContactSelect.innerText = '이메일';
                }
            }

            //모집 레벨
            //input값
            let sLevel = document.getElementById('sLevel').value;
            //select 하위 버튼
            let sLevelBtn = document.getElementsByName('sLevelBtn');

            for(let i = 0; i < sLevelBtn.length; i++){
                //입력값 일치
                if(sLevelBtn[i].value == sLevel){
                    let sLevelSelect = document.getElementById('sLevelSelect');
                    sLevelSelect.innerText = sLevelBtn[i].innerText;
                }
            }
        }
    </script>
</body>
</html>