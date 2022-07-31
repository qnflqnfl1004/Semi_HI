<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>updatePwd</title>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />

    <style>
      #updatePwd-container {
        background: #a8a4ce;
        text-align: center;
        width: 100%;
        padding-left: 1rem;
        padding-right: 1rem;
        padding-top: 10px;
        padding-bottom: 10px;
        margin-left: auto;
        margin-right: auto;
      }

      #updatePwd-container table {
        margin: 0 auto;
        border-spacing: 20px;
      }

      #updatePwd-container table th {
        padding-right: 20px;
        padding-top: 10px;
        text-align: center;
        font-size: larger;
        font-weight: 700;
        color: white;
      }

      #updatePwd-container .inputPwdChange {
        width: 300px;
        height: 50px;
        border-radius: 10px;
        border: none;
        box-shadow: none;
        background-color: #e2e2e2;
        margin-top: 10px;
        float: right;
        padding: 10px;
        font-size: large;
      }

      #updatePwd-container .btn {
        background-color: #7a86b6;
        color: white;
        height: 50px;
        width: 150px;
        font-weight: 700;
        font-size: larger;
        border-radius: 10px;
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
    <div id="updatePwd-container">
      <form action="${ path }/member/updatePwd" method="post">
        <table>
          <tr>
            <th>변경할 비밀번호</th>
            <td>
              <input
                type="password"
                class="inputPwdChange"
                name="userPwd"
                id="pass1"
                required
              />
            </td>
          </tr>
          <tr>
            <th>비밀번호 확인</th>
            <td>
              <input type="password" class="inputPwdChange" id="pass2" />
            </td>
          </tr>
        </table>
        <div class="btnBox">
          <input
            type="submit"
            class="btn"
            value="변경"
            onclick="return validate();"
          />

          <input
            type="button"
            class="btn"
            value="닫기"
            onclick="self.close();"
          />
        </div>
        <input type="hidden" name="userId" />
      </form>
    </div>
    <script>
      function validate() {
        let pass1 = $("#pass1").val();
        let pass2 = $("#pass2").val();

        if (pass1.trim() != pass2.trim()) {
          alert("비밀번호가 일치하지 않습니다.");
          $("#pass1").val("");
          $("#pass2").val("");
          $("#pass1").focus();

          return false;
        }
      }
    </script>
  </body>
</html>
