<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<head>
  <title>StudyBox</title>
  <body>
    <jsp:include page="/views/common/header.jsp" />
    <link rel="stylesheet" href="${ path }/resources/css/studyBox.css" />

    <main>
      <section class="py-5 text-center container">
          <div class="row py-lg-5" id="likeStudyType">
            <div class="col-lg-6 col-md-8 mx-auto">
              <h1>찜 S T U D Y</h1>
            </div>
          </div>
      </section>

      <div class="album py-5">
        <div class="container">
          <form action="${ path }/member/likeStudyBox" method="GET">
            <c:if test="${ empty likeStudyList }">
              <span>지금 바로 <b>당신의 스터디</b>를 시작해주세요 !!!!!!!!!!</span>
            </c:if> 
          
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<!-- .col 스터디 카드 하나! -->
            <c:if test="${ ! empty likeStudyList }">
              <c:forEach var="likeStudy" items="${ likeStudyList }"> 
                <div class="col" id="studyBox">
                  <form action="${ path }/member/studyBox" method="GET">
                  <a onclick="location.href='${ path }/sboard/view?no=${ likeStudy.SNo }'" style="text-decoration:none; cursor: pointer;" >
                  <div class="studyContent">
                    <div 
                        class="bd-placeholder-img card-img-top"
                        xmlns="http://www.w3.org/2000/svg"
                        role="img"
                        aria-label="Placeholder: Thumbnail"
                        preserveAspectRatio="xMidYMid slice"
                        focusable="false">
                        <div class="studyStart">시작 예정일 <br> | ${ likeStudy.SDate } | </div>
                        <div class="studyTitle">${ likeStudy.STitle }</div>

                      <div class="studyFilter">
                        <div class="testNo">
                            <c:if test="${ likeStudy.language.LNo != 4 }">
                              <img src="${ path }/resources/images/Test_logo/${ likeStudy.test.testType }.png" alt="${ path }/resources/images/Test_logo/basic.png" class="testImg"/>
                            </c:if>
                            <c:if test="${ likeStudy.language.LNo == 4 }">
                              <img src="${ path }/resources/images/Test_logo/basic.png" class="testImg"/>
                            </c:if>
                        </div>      
                        <div class="sLevel">
                            <c:choose>
                              <c:when test="${ likeStudy.SLevel == '초급' }">
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                              </c:when>
                              <c:when test="${ likeStudy.SLevel == '중급' }">
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                              </c:when>
                              <c:when test="${ likeStudy.SLevel == '고급' }">
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                <img src="${ path }/resources/images/level.png" class="levelImg"/>
                              </c:when>
                          </c:choose>   
                        </div>
                      </div>
                    </a>
                        <div class="writerInfo">
                              <img src="${ path }/resources/images/Hi_Profil.png" class="writerImg" />
                              <div class="writerNick">${ likeStudy.member.nickName }</div>
                              <!-- <span>${ likeStudy.like.likeNo }</span> -->
                              <c:if test="${ ! empty likeStudy.like }">
                                <i class="fa-solid fa-heart fa-3x" id="favIcon" bno="${ likeStudy.SNo }"></i>
                              </c:if>
                              <c:if test="${ empty likeStudy.like }">
                                <i class="fa-regular fa-heart fa-3x" id="favIcon" bno="${ likeStudy.SNo }"></i>
                              </c:if>
                        </div>    
                    </div> 
                  </div> 
                  </form>

                </div>
              </c:forEach>
            </c:if>
<!-- .col 스터디 카드 하나! -->
          </div>

        </div>
      </div>
  </main>
  </body>

  <jsp:include page="/views/common/footer.jsp" />
</head>

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
          $(event.target).attr("class", "fa-solid fa-heart fa-3x");
        } else {
          $(event.target).attr("class", "fa-regular fa-heart fa-3x");
        }
      },
      error:(error) => {
        console.log(error);
      }
    });
  });

});
</script>
</body>
</html>