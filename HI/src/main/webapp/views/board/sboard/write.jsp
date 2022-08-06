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
    <form action="${ path }/sboard/write" method="POST">

        <div class="sboard">
            <h2 class="sboardH2"> 🚀 스터디의 정보를 입력하세요 </h2>  
            <article class="sboardSelect">
                <div class="sboardDropbox">
                    <label class="sboardLabel">진행할 스터디</label>
                    <button type="button" class="selectBtn">
                        함께 공부할 언어 선택
                    </button>
                    <ul class="dropboxList" id="langDropbox" name="langNo" style="z-index: 4;">
                        <li>
                            <button type="button" value="1">영어</button>
                        </li>
                        <li>
                            <button type="button" value="2">일본어</button>
                        </li>
                        <li>
                            <button type="button" value="3">중국어</button>
                        </li>
                        <li>
                            <button type="button" value="4">기타</button>
                        </li>
                        <input type="hidden" name="langNo" id="langNo" value="">
                    </ul>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel" style="z-index: 99;">모집 분야</label>
                    <button type="button" class="selectBtn" id="selectTestBtn">
                        스터디로 진행할 시험 선택
                    </button>
                    <ul class="dropboxList" name="testNo" id="testName" style="z-index: 4;">

                    </ul>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">모집 인원</label>
                    <button type="button" class="selectBtn">
                            인원 미정 ~ 5명 이상
                    </button>
                    <ul class="dropboxList" name="sMember"   style="z-index: 3;">
                       <li>
                           <button type="button" value="-1">인원 미정</button>
                        </li>
                        <li>
                            <button type="button" value="1">1명</button>
                        </li>
                        <li>
                            <button type="button" value="2">2명</button>
                        </li>
                        <li>
                            <button type="button" value="3">3명</button>
                        </li>
                        <li>
                            <button type="button" value="4">4명</button>
                        </li>
                        <li>
                            <button type="button" value="5">5명 이상</button>
                        </li>
                        <input type="hidden" name="sMember" value="">
                      </ul>
                 </div>
                 <div>
                    <label class="sboardLabel">모집 마감일</label>
                    <div>
                        <input type="date" class="sboardDate" name="sDueDate">
                    </div>
                 </div>
                 <div class="sboardDropbox">
                     <label class="sboardLabel">진행 기간</label>
                     <button type="button" class="selectBtn">
                          기간 미정 ~ 6개월 이상
                     </button>
                     <ul class="dropboxList" name="sPeriod"   style="z-index: 2;">
                        <li>
                            <button type="button" value="-1">기간 미정</button>
                        </li>
                        <li>
                            <button type="button" value="1">1개월</button>
                        </li>
                        <li>
                            <button type="button" value="2">2개월</button>
                        </li>
                        <li>
                            <button type="button" value="3">3개월</button>
                        </li>
                        <li>
                            <button type="button" value="4">4개월</button>
                        </li>
                        <li>
                            <button type="button" value="5">5개월</button>
                        </li>
                        <li>
                            <button type="button" value="6">6개월 이상</button>
                        </li>
                        <input type="hidden" name="sPeriod" value="">
                    </ul>
                </div>
                <div>
                    <label class="sboardLabel">시작 예정일</label>
                    <div>
                        <input type="date" class="sboardDate" name="sDate">
                    </div>
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">연락 방법</label>
                    <button type="button" class="selectBtn">
                        연락 방법 선택
                    </button>
                    <ul class="dropboxList" style="z-index: 1;">
                        <li>
                            <button type="button" value="kakao">카카오톡 오픈채팅</button>
                        </li>
                        <li>
                            <button type="button" value="email">이메일</button>
                        </li>
                        <input type="hidden" class="sboardContact" name="sContact" value="">
                    </ul>
                    <!-- <input type="text" class="sContactInput" name="sContact" placeholder="링크 주소를 입력해주세요"> -->
                </div>
                <div class="sboardDropbox">
                    <label class="sboardLabel">모집 레벨</label>
                    <button type="button" class="selectBtn">
                        고급 / 중급 / 초급
                    </button>
                    <ul class="dropboxList" name="sLevel" style="z-index: 1;">
                        <li>
                            <button type="button" value="초급">초급</button>
                        </li>
                        <li>
                            <button type="button" value="중급">중급</button>
                        </li>
                        <li>
                            <button type="button" value="고급">고급</button>
                        </li>
                        <input type="hidden" name="sLevel" value="">
                    </ul>
                </div>
            </article>
            <h2 class="sboardH2"> 🚀 스터디에 대해 소개해 주세요 </h2>
            <article class="sboardInfo">
                <label class="sboardLabel">제목</label>
                <div>
                    <input type="text" class="sboardTitle" style="padding-left: 10px;" placeholder="제목을 입력해 주세요" name="sTitle">
                </div>
                <label class="sboardLabel">내용</label>
                <div>
                    <textarea class="sboardContent" style="padding-left: 10px;" cols="124" rows="10" placeholder="내용을 입력해 주세요" name="sContent"></textarea>
                </div>
            </article>
            <div class="btns">
                <input type="reset" value="취소" class="cancelBtn"></input>
                <input type="submit" value="저장" class="submitBtn"></input>
            </div>
        </div>
    </form>
        
    <script>
        window.onload = function(){
            //언어 선택이 안 되어 있을 경우 비활성화
            let selectTestBtn = document.getElementById('selectTestBtn');
            let langNo = document.getElementById('langNo');
            if(langNo.value == ''){
                selectTestBtn.disabled = true;

            }
            
            let langDropbox = document.getElementById('langDropbox');

            //클릭해서 언어 선택했을 때
            langDropbox.addEventListener('click', () =>{
                selectTestBtn.disabled = false; //비활성화 해제
                setTestList(event.target.value);

            });
        };

        //언어에 따른 시험종류 출력
        function setTestList(langNo){
        
            //li태그 배열 선언
            let liEle = [];

            //input태그 속성 설정
            let inputEle = document.createElement('input');
                inputEle.setAttribute('type', 'hidden');
                inputEle.setAttribute('name', 'testNo');
            //li태그를 삽입할 ul태그
            let testNameTag = document.getElementById('testName');
            switch (langNo) {
                case '1': 
                    //박스에 들어있는 기존 글자 삭제
                    //기존 시험목록 삭제
                    while ( testNameTag.hasChildNodes() ){
                        testNameTag.removeChild( testNameTag.firstChild );  
                    }
                    //시험 이름 초기화
                    selectTestBtn.innerText = '스터디로 진행할 시험 선택';

                    liEle = []; //배열 초기화
                    let engTestArr = ['TOEIC', 'TOEFL',' OPIC', 'TEPS'];//시험목록
                    //시험목록 반복
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

        // 리스트 열기
        let btns = document.querySelectorAll('.selectBtn');
        let lists = document.querySelectorAll('.dropboxList');
        
        for (let i = 0; i < btns.length; i++) {
            
            btns[i].addEventListener('click', (event) => {
                btns[i].classList.toggle('on'); 
                
                event.stopPropagation();
            });
        }

        $(function() {
            testSelectMaker("select[name=langNo]");
        });

        var testSelectMaker = function(target) {
            if (target == null || $(target).length == 0) {
                console.warn("not select");
                return;
            }

            
        }

        for (let i = 0; i < lists.length; i++) {
            
            lists[i].addEventListener('click', () => {
                if (event.target.nodeName === "BUTTON") {
                    //선택한 옵션 값
                    let val = event.target.value;
                    //input tag
                    let tag = event.target.parentElement.parentElement.children;
                    // console.log(val);

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

        
        

    </script>
</body>
</html>