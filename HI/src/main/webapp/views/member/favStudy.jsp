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
        <div class="row py-lg-5" id="myStudyType">
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
                      <img
                        src="${ path }/resources/images/level.png"
                        class="levelImg"
                        alt=""
                      />
                      <img
                        src="${ path }/resources/images/level.png"
                        class="levelImg"
                        alt=""
                      />
                      <img
                        src="${ path }/resources/images/level.png"
                        class="levelImg"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="writerInfo">
                    <img
                      src="${ path }/resources/images/프로필.png"
                      class="writerImg"
                      alt=""
                    />
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
          </div>
        </div>
      </div>
    </main>
  </body>
</head>
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