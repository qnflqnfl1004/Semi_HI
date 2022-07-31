<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<head><title>StudyBox</title><body>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/studyBox.css">

    <main>
        <section class="py-5 text-center container">
          <div class="row py-lg-5" id="myStudyType">
            <div class="col-lg-6 col-md-8 mx-auto">
              <h1>M Y S T U D Y</h1>
            </div>
          </div>
        </section>

        <div class="album py-5">
          <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
              <!-- <form action="${ path }/member/myStudyBox" method="GET"> -->
                <!-- <c:if test="${ empty myStudy }">
                  <div>지금 바로 <b>당신의 스터디</b>를 시작해주세요</div>
                </c:if>  -->
                
                <!-- .col 스터디 카드 하나! -->
                <div class="col" id="studyBox">
                  <!-- <c:if test="${ not empty myStudyList }"> -->
                    <div class="studyContent">
                      <!-- <c:forEach var="board" items="${ myStudyList }">  -->
                        <div
                            class="bd-placeholder-img card-img-top"
                            xmlns="http://www.w3.org/2000/svg"
                            role="img"
                            aria-label="Placeholder: Thumbnail"
                            preserveAspectRatio="xMidYMid slice"
                            focusable="false"
                        >
                          <div class="studyStart">${ myStudyList.sDate }</div>
                          <div class="studyTitle">${ myStudyList.sTitle }</div>
                          <div class="studyFilter">
                            <div class="sLevel">
                              <c:choose>
                                <c:when test="${ myStudyList.sLevel == '초급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                </c:when>
                                <c:when test="${ myStudyList.sLevel == '중급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                </c:when>
                                <c:when test="${ myStudyList.sLevel == '고급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                  <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                                </c:when>
                              </c:choose>
                            </div>
                                </div>
                                <div class="writerInfo">
                                  <img src="${ path }/resources/images/프로필.png" class="writerImg" alt="" />
                                  <div class="writerNick">${ myStudyList.userNick }</div>
                                </div>    
                        </div>  <!-- bd-placeholder-img card-img-top-->
                    </div> <!-- studyContent -->
                          <div class="btnBox">
                          <button type="button" class="btn" id="btnDelete">삭제</button>
                          <button type="button" class="btn" id="btnFinish">마감</button>
                          </div>
                        <!-- </c:forEach> -->
                  <!-- </c:if> -->
                </div> <!-- col-->
              <!-- </form> -->
            </div> <!-- row-->
            <div class="btnBox">
              <button type="button" class="btn" id="btnMore" ><a href="${ path }/member/myStudy">더보기</a></button>
            </div>
          </div> <!-- container-->
        </div> <!-- album py-5-->
      </div>
    </main>












    <main>
      <section class="py-5 text-center container">
        <div class="row py-lg-5" id="saveStudyType">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1>찜 S T U D Y</h1>
          </div>
        </div>
      </section>

      <div class="album py-5">
        <div class="container">
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="studyStart">시작 예정일</div>
                  <div class="studyTitle">스터디 제목</div>
                  <div class="studyFilter">
                    <div>
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                      </div>
                    </div>
                    <div class="writerInfo">
                      <img src="${ path }/resources/images/프로필.png" class="writerImg" alt="" />
                      <div class="writerNick">닉네임</div>
                    <div class="studySaveI">
                      <!-- <i class="fa-solid fa-heart fa-2x"></i> -->
                      <i class="fa-regular fa-heart fa-2x"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- <div class="btnBox">
                <button type="button" class="btn" id="btnDelete">삭제</button>
                <button type="button" class="btn" id="btn">마감</button>
              </div> -->
            </div>

            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="textWrapper" style="text-align: center">
                    <div class="studyStart">시작 예정일</div>
                    <div class="studyTitle">스터디 제목</div>
                    <!-- <i class="fas fa-heart"></i> -->
                    <div class="studyFilter">
                        <div>
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                          </div>
                        </div>
                        <div class="writerInfo">
                          <img src="${ path }/resources/images/프로필.png" class="writerImg" alt="" />
                          <div class="writerNick">닉네임</div>
                      <div class="studySaveI">
                        <i class="fa-solid fa-heart fa-2x"></i>
                        <!-- <i class="fa-regular fa-heart fa-2x"></i> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div> <!-- row row-cols-1 -->
              <!-- <div class="btnBox">
                <button type="submit" class="btn">삭제</button>
                <button type="button" class="btn">마감</button>
              </div> -->
            </div>

            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="textWrapper" style="text-align: center">
                    <div class="studyStart">시작 예정일</div>
                    <div class="studyTitle">스터디 제목</div>
                    <div class="studyFilter">
                        <div>
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                          </div>
                        </div>
                        <div class="writerInfo">
                          <img src="${ path }/resources/images/프로필.png" class="writerImg" alt="" />
                          <div class="writerNick">닉네임</div>
                      <div class="studySaveI">
                        <!-- <i class="fa-solid fa-heart fa-2x"></i> -->
                        <i class="fa-regular fa-heart fa-2x"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <!-- <div class="btnBox">
                <button type="submit" class="btn">삭제</button>
                <button type="button" class="btn">마감</button>
              </div> -->
            </div>
          </div>
          <div class="btnBox">
            <button type="button" class="btn" id="btnMore"><a href="${ path }/member/favStudy">더보기</a></button>
          </div>
        </div>
      </div>
    </main>

    <script
      src="/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <script>
    $(document).ready(() => {
        // $("#studyBox").click(funtion() {
        //     var startNum = $("#studyBox li").length;
        //     var addListHtml = "";
        // })

        // $(".studySaveI").click(function() {
        //     document.getElementById("img").scr=

        // })

       
    });
    </script>
  </body>
</html>
