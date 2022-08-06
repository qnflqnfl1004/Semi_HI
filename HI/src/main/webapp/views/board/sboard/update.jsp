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
                    <ul class="dropboxList" id="langDropbox" name="langNo" style="z-index: 4;">
                        <li>
                            <button type="button" name="langNoBtn" value="1">영어</button>
                        </li>
                        <li>
                            <button type="button" name="langNoBtn" value="2">일본어</button>
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
                    <ul class="dropboxList" name="testNo" id="testName" style="z-index: 4;">
  
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
                    <!-- <input type="text" class="sContactInput" name="sContact" placeholder="링크 주소를 입력해주세요"> -->
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
                console.log('button click Event');
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
                    console.log('list click Event');
                }
            });
        }

        //수정페이지 게시판 해당값에 따라 버튼입력되게 해주는 기능
        window.onload = function(){
            //언어
            //input값
            let langNo = document.getElementById('langNo');
            //select 하위 버튼
            let langNoBtn = document.getElementsByName('langNoBtn');

            for(let i = 0; i < langNoBtn.length; i++){
                //입력값 일치
                if(langNoBtn[i].value == langNo.value){
                    let langNoSelect = document.getElementById('langNoSelect');
                    langNoSelect.innerText = langNoBtn[i].innerText;
                    langNo.value = langNoBtn[i].value;
                }
            }

            


            //시험과목
            //input값
            let testNo = document.getElementById('testNo');
            //select 하위 버튼
            // let testNoBtn = document.getElementsByName('testNoBtn');

            // for(let i = 0; i < testNoBtn.length; i++){
            //     //입력값 일치
            //     if(testNoBtn[i].value == testNo.value){
            //         let testNoSelect = document.getElementById('testNoSelect');
            //         testNoSelect.innerText = testNoBtn[i].innerText;
            //         testNo.value = testNoBtn[i].value;
                    
            //     }
            // }
            // 수정!!!!!!!!!!!!!!제발 
            let testNoSelect = document.getElementById('testNoSelect');
            testNoSelect.innerText = testNo.value; 
            setTestListInit(langNo.value, testNo.value);



            //input value값에 따른 텍스트 출력
            switch (testNo.value) {
                case '1':
                    testNoSelect.innerText = 'TOEIC'; 
                    break;
                case '2':
                    testNoSelect.innerText = 'TOEFL'; 
                    break;
                case '3':
                    testNoSelect.innerText = 'OPIC'; 
                    break;
                case '4':
                    testNoSelect.innerText = 'TEPS'; 
                    break;
                case '5':
                    testNoSelect.innerText = 'JLPT'; 
                    break;
                case '6':
                    testNoSelect.innerText = 'JPT'; 
                    break;
                case '7':
                    testNoSelect.innerText = 'HSK'; 
                    break;
                case '8':
                    testNoSelect.innerText = 'BCT'; 
                    break;
                case '9':
                    testNoSelect.innerText = 'TSC'; 
                    break;
                case '10':
                    testNoSelect.innerText = '프랑스어'; 
                    break;
                case '11':
                    testNoSelect.innerText = '스페인어'; 
                    break;
                case '12':
                    testNoSelect.innerText = '독일어'; 
                    break;
                default:
                    break;
            }

            //모집인원
            //input값
            let sMember = document.getElementById('sMember');
            //select 하위 버튼
            let sMemberBtn = document.getElementsByName('sMemberBtn');
            

            for(let i = 0; i < sMemberBtn.length; i++){
                //입력값 일치
                if('미정' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '인원 미정';
                    sMember.value = -1;
                }else if('1명' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '1명';
                    sMember.value = 1;
                }else if('2명' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '2명';
                    sMember.value = 2;
                }else if('3명' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '3명';
                    sMember.value = 3;
                }else if('4명' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '4명';
                    sMember.value = 4;
                }else if('5명 이상' == sMember.value){
                    let sMemberSelect = document.getElementById('sMemberSelect');
                    sMemberSelect.innerText = '5명 이상';
                    sMember.value = 5;
                }
            }

            //모집기간
            //input값
            let sPeriod = document.getElementById('sPeriod');
            //select 하위 버튼
            let sPeriodBtn = document.getElementsByName('sPeriodBtn');

            for(let i = 0; i < sPeriodBtn.length; i++){
                //입력값 일치
                if('미정' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '미정';
                    sPeriod.value = -1;
                }else if('1개월' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '1개월';
                    sPeriod.value = 1;
                }if('2개월' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '2개월';
                    sPeriod.value = 2;
                }if('3개월' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '3개월';
                    sPeriod.value = 3;
                }if('4개월' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '4개월';
                    sPeriod.value = 4;
                }if('5개월' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '5개월';
                    sPeriod.value = 5;
                }if('6개월 이상' == sPeriod.value){
                    let sPeriodSelect = document.getElementById('sPeriodSelect');
                    sPeriodSelect.innerText = '6개월 이상';
                    sPeriod.value = 6;
                }
            }

            //연락방법
            //input값
            let sContact = document.getElementById('sContact');
            //select 하위 버튼
            let sContactBtn = document.getElementsByName('sContactBtn');

            for(let i = 0; i < sContactBtn.length; i++){
                //입력값 일치
                if('kakao' == sContact.value){
                    let sContactSelect = document.getElementById('sContactSelect');
                    sContactSelect.innerText = '카카오톡 오픈채팅';
                    sContact.value = 'kakao';
                }else if('email' == sContact.value){
                    let sContactSelect = document.getElementById('sContactSelect');
                    sContactSelect.innerText = '이메일';
                    sContact.value = 'email';
                }
            }

            //모집 레벨
            //input값
            let sLevel = document.getElementById('sLevel');
            //select 하위 버튼
            let sLevelBtn = document.getElementsByName('sLevelBtn');

            for(let i = 0; i < sLevelBtn.length; i++){
                //입력값 일치
                if(sLevelBtn[i].value == sLevel.value){
                    let sLevelSelect = document.getElementById('sLevelSelect');
                    sLevelSelect.innerText = sLevelBtn[i].innerText;
                    sLevel.value = sLevelBtn[i].value;
                }
            }

            let selectTestBtn = document.getElementById('testNoSelect');
            if(langNo.value == ''){
                selectTestBtn.disabled = true;

            }

            let langDropbox = document.getElementById('langDropbox');

            //클릭해서 언어 선택한 순간
            langDropbox.addEventListener('click', () =>{
                selectTestBtn.disabled = false; //시험 선택란 비활성화 해제
                setTestList(event.target.value);

            });

            //언어에 따른 시험종류 출력
            function setTestList(langNo){
            
                //li태그 배열 선언
                let liEle = [];

                //input태그 생성/속성설정(input태그는 공통사항임)
                let inputEle = document.createElement('input');
                    inputEle.setAttribute('type', 'hidden');
                    inputEle.setAttribute('name', 'testNo');
                //li태그를 삽입할 ul태그
                let testNameTag = document.getElementById('testName');
                switch (langNo) {
                    case '1': 
                        //박스에 들어있는 기존 글자 지우기
                        //기존 시험목록 삭제
                        while ( testNameTag.hasChildNodes() ){
                            testNameTag.removeChild( testNameTag.firstChild );  
                        }
                        //시험이름 초기화
                        selectTestBtn.innerText = '스터디로 진행할 시험 선택';

                        liEle = [];//배열 초기화
                        let engTestArr = ['TOEIC', 'TOEFL',' OPIC', 'TEPS'];//시험목록
                        //시험목록 갯수별 반복 작업
                        for(let i = 0; i < engTestArr.length; i++){
                            liEle[i] = document.createElement('li'); //li태그 생성/배열삽입
                            
                            let tempBtn = document.createElement('button');//버튼태그 생성
                            tempBtn.setAttribute('type', 'button');//속성설정
                            tempBtn.setAttribute('value', i + 1);
                            tempBtn.innerText = engTestArr[i]; //시험이름 버튼태그에 저장(화면출력부)
                            liEle[i].appendChild(tempBtn); //버튼태그를 li태그 하위에 지정
                            testNameTag.appendChild(liEle[i]); //li태그를 ul태그 하위에 지정 ul>li>btn 의 구조임
                        }
                        
                        testNameTag.appendChild(inputEle);//ul태그에 생성한 li태그를 자식으로 추가(하위에 지정)
                        break;
                    case '2':
                        //기존 시험목록 삭제
                        while ( testNameTag.hasChildNodes() ){
                            testNameTag.removeChild( testNameTag.firstChild );  
                        }
                        selectTestBtn.innerText = '스터디로 진행할 시험 선택';

                        liEle = [];
                        let JapTestArr = ['JLPT', 'JPT'];
                        for(let i = 0; i < JapTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 5);
                            tempBtn.innerText = JapTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    case '3':
                        //기존 시험목록 삭제
                        while ( testNameTag.hasChildNodes() ){
                            testNameTag.removeChild( testNameTag.firstChild );  
                        }
                        selectTestBtn.innerText = '스터디로 진행할 시험 선택';

                        liEle = [];
                        let ChnTestArr = ['HSK', 'BCT', 'TSC'];
                        for(let i = 0; i < ChnTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 7);
                            tempBtn.innerText = ChnTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    case '4':
                        //기존 시험목록 삭제
                        while ( testNameTag.hasChildNodes() ){
                            testNameTag.removeChild( testNameTag.firstChild );  
                        }
                        selectTestBtn.innerText = '스터디로 진행할 시험 선택';

                        liEle = [];
                        let etcTestArr = ['프랑스어', '스페인어', '독일어'];
                        for(let i = 0; i < etcTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 10);
                            tempBtn.innerText = etcTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    default:
                        break;
                }
            }

            //수정페이지의 경우 이미 시험 종류가 들어있으므로 li태그를 처음에 추가해줌
            function setTestListInit(langNo, testVal){
            
                //li태그 배열 선언
                let liEle = [];

                //input태그 생성/속성설정(input태그는 공통사항임)
                let inputEle = document.createElement('input');
                    inputEle.setAttribute('type', 'hidden');
                    inputEle.setAttribute('name', 'testNo');
                    inputEle.setAttribute('value', testVal);
                //li태그를 삽입할 ul태그
                let testNameTag = document.getElementById('testName');
                switch (langNo) {
                    case '1': 

                        liEle = [];//배열 초기화
                        let engTestArr = ['TOEIC', 'TOEFL',' OPIC', 'TEPS'];//시험목록
                        //시험목록 갯수별 반복 작업
                        for(let i = 0; i < engTestArr.length; i++){
                            liEle[i] = document.createElement('li'); //li태그 생성/배열삽입
                            
                            let tempBtn = document.createElement('button');//버튼태그 생성
                            tempBtn.setAttribute('type', 'button');//속성설정
                            tempBtn.setAttribute('value', i + 1);
                            tempBtn.innerText = engTestArr[i]; //시험이름 버튼태그에 저장(화면출력부)
                            liEle[i].appendChild(tempBtn); //버튼태그를 li태그 하위에 지정
                            testNameTag.appendChild(liEle[i]); //li태그를 ul태그 하위에 지정 ul>li>btn 의 구조임
                        }
                        
                        testNameTag.appendChild(inputEle);//ul태그에 생성한 li태그를 자식으로 추가(하위에 지정)
                        break;
                    case '2':
                        liEle = [];
                        let JapTestArr = ['JLPT', 'JPT'];
                        for(let i = 0; i < JapTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 5);
                            tempBtn.innerText = JapTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    case '3':

                        liEle = [];
                        let ChnTestArr = ['HSK', 'BCT', 'TSC'];
                        for(let i = 0; i < ChnTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 7);
                            tempBtn.innerText = ChnTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    case '4':
                        while ( testNameTag.hasChildNodes() ){
                            testNameTag.removeChild( testNameTag.firstChild );  
                        }
                        liEle = [];
                        let etcTestArr = ['프랑스어', '스페인어', '독일어'];
                        for(let i = 0; i < etcTestArr.length; i++){
                            liEle[i] = document.createElement('li');
                            
                            let tempBtn = document.createElement('button');
                            tempBtn.setAttribute('type', 'button');
                            tempBtn.setAttribute('value', i + 10);
                            tempBtn.innerText = etcTestArr[i];
                            liEle[i].appendChild(tempBtn);
                            testNameTag.appendChild(liEle[i]);
                        }
                        
                        testNameTag.appendChild(inputEle);
                        break;
                    default:
                        break;
                }
            }
        }
    </script>
</body>
<jsp:include page="/views/common/footer.jsp" /> 
</html>