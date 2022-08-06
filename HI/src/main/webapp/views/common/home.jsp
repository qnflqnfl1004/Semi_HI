<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<!-- <link rel="stylesheet" href="${ path }/resources/css/view.css" /> -->
<link rel="stylesheet" href="${ path }/resources/css/home.css" />

<main>
  <div
    id="carouselExampleIndicators"
    class="carousel slide"
    data-bs-ride="carousel"
  >
    <div class="carousel-indicators">
      <button
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide-to="0"
        class="active"
        aria-current="true"
        aria-label="Slide 1"
      ></button>
      <button
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide-to="1"
        aria-label="Slide 2"
      ></button>
      <button
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide-to="2"
        aria-label="Slide 3"
      ></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img
          src="${ path }/resources/images/Hi_Main.png"
          class="d-block w-100"
          alt="..."
          style="width: 100%; height: 800px"
        />
      </div>
      <div class="carousel-item">
        <img
          src="${ path }/resources/images/Hi_Banner.png"
          class="d-block w-100"
          alt="..."
          style="width: 100%; height: 800px"
        />
      </div>
      <!-- <div class="carousel-item">
        <img src="..." class="d-block w-100" alt="..." />
      </div> -->
    </div>
    <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <section class="py-5 text-center container">
    <div class="row py-lg-5" id="myStudyType">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1>Hi(An-Mozilla) <br/>스터디</h1>
      </div>
    </div>
  </section>
  
  <div class="mainMenu_wrap">
    <ul class="mainMenuList">
      <li class="categoryLanguage" id="categoryEngLanguage">
        영어
          <ul class="hideList" id="hideEngList">
            <li>TOEIC</li>
            <li>TOFLE</li>
            <li>OPIC</li>
            <li>TEPS</li>
          </ul>
      </li>
      <li class="categoryLanguage" id="categoryJpLanguage">
        일본어
        <ul class="hideList" id="hideJpList">
          <li>JLPT</li>
          <li>JPT</li>
        </ul>
      </li>
      <li class="categoryLanguage" id="categoryChLanguage">
        중국어
        <ul class="hideList" id="hideChList">
          <li>HSK</li>
          <li>BCT</li>
          <li>TSC</li>
        </ul>
      </li>
      <li class="categoryLanguage" id="categoryEtcLanguage">
        기타
        <ul class="hideList" id="hideEtcList">
          <li>프랑스어</li>
          <li>스페인어</li>
          <li>독일어</li>
        </ul>
      </li>
    </ul>
  </div>

    <div class="album py-5" style="margin-bottom: 0">
      <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<!------------- .col 스터디 카드 하나!------------->
          <c:if test="${ ! empty list }">
            <c:forEach var="board" items="${ list }">
              <div class="col" id="studyBox">
                <a
                  onclick="location.href='${ path }/sboard/view?no=${ board.SNo }'"
                  style="text-decoration: none; cursor: pointer"
                >
                  <div class="studyContent">
                    <div
                      class="bd-placeholder-img card-img-top"
                      xmlns="http://www.w3.org/2000/svg"
                      role="img"
                      aria-label="Placeholder: Thumbnail"
                      preserveAspectRatio="xMidYMid slice"
                      focusable="false"
                    >
                      <div id="studyStart">시작 예정일 <br> | ${ board.SDate } | </div>
                      <div id="studyTitle">${ board.STitle }</div>
                      <div id="studyFilter">
                        <div id="testNo">
                          <c:if test="${ board.language.LNo != 4 }">
                            <img
                              src="${ path }/resources/images/Test_logo/${ board.test.testType }.png"
                              alt="${ path }/resources/images/Test_logo/basic.png"
                              id="testImg1"
                            />
                          </c:if>
                          <c:if test="${ board.language.LNo == 4 }">
                            <img
                              src="${ path }/resources/images/Test_logo/basic.png"
                              id="testImg2"
                            />
                          </c:if>
                        </div>
                        <div id="sLevel">
                          <c:choose>
                            <c:when test="${ board.SLevel == '초급' }">
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                            </c:when>
                            <c:when test="${ board.SLevel == '중급' }">
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                            </c:when>
                            <c:when test="${ board.SLevel == '고급' }">
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                              <img
                                src="${ path }/resources/images/level.png"
                                class="levelImg"
                              />
                            </c:when>
                          </c:choose>
                        </div>
                      </div>
                    </a>
                      <div id="writerInfo">
                        <img
                        src="${ path }/resources/images/Hi_Profil.png"
                        id="writerImg"
                        />
                        <div id="writerNick">${ board.member.nickName }</div>
                        <c:if test="${ ! empty loginMember }">
                          <!-- <span>${ board.SNo }</span> -->
                          <c:if test="${ ! empty board.like }">
                            <i class="fa-solid fa-heart fa-4x" style="margin-top: 10px;" id="favIcon" bno="${ board.SNo }"></i>
                          </c:if>
                          <c:if test="${ empty board.like }">
                            <i class="fa-regular fa-heart fa-4x" id="favIcon" bno="${ board.SNo }" style="margin-top: 10px;"></i>
                          </c:if>
                        </c:if>
                      </div>
                    </div>
                  </div>
              </div>
            </c:forEach>
          </c:if>
    </div>
<!------------- .col 스터디 카드 하나!------------->
      </div>
    </div>
  </main>
</main>
<script src="https://kit.fontawesome.com/f8167db045.js"
crossorigin="anonymous"></script>
<script>
$(document).ready(() => {
  $(".fa-heart").on("click", (event) => {
    let studyNo = $(event.target).attr("bno");
    
    $.ajax({
      url:"${ path }/like.do",
      type: "POST",
      dataType: "JSON",
      data: {
        studyNo
      },
      success:(data) => {
        console.log(data);
        if(data !== null) {
          console.log()
          $(event.target).attr("class", "fa-solid fa-heart fa-4x");
        } else {
          $(event.target).attr("class", "fa-regular fa-heart fa-4x");
        }
      },
      error:(error) => {
        console.log(error);
      }
    });
  });
});


let langMenus = document.querySelectorAll('.categoryLanguage');
let hideLists = document.querySelectorAll('.hideList');

for (let i = 0; i < langMenus.length; i++) {  
  langMenus[i].addEventListener('click', (event) =>{

    console.log('click!' + langMenus[i].className);
    langMenus[i].classList.toggle('down');
    console.log(langMenus[i].className.indexOf);
    event.stopPropagation();
    if(langMenus[i].className.indexOf('down') > 0){
      $(hideLists[i]).slideDown(400);
    }else{
     
      $(hideLists[i]).slideUp(400);
    }
  });
}
</script>