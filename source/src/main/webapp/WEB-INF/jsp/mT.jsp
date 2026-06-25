<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="dto.Tests" %>   
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 心理テスト</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/common.css">
</head>
<body id="index-top">
<div>
  <!-- ロゴ写真 -->
  <span><img></span>

</div>
<!-- ログイン、サインイン -->
<div class="loginStatus">
			<c:if test="${empty user or loginStatu == false}">
				<div class="notLogin" id="notLogin">
					<a href="AddUserServlet">サインイン</a> <a href="LoginServlet">ログイン</a>
				</div>
			</c:if>
			<c:if test="${!empty user and loginStatu==true}">
				<div class="isLogin" id="isLogin">
					<p>
						ようこそ <span id="username">${user.name}</span> さん
					</p>
					<a href="/classcare/Forward?page=logout" id="logoutBtn">ログアウト</a>
				</div>
			</c:if>
		</div>



<!-- 左側サイドナビ -->
<!-- 左側サイドナビ -->
<aside>
  <nav>
    <ul>
  <li>
    <a href="InsertClassesServlet">生徒</a>
    <ul>
      <li><a href="SelectMypageServlet">生徒管理</a></li>
      <li><a href="SelectMypageServlet">点数管理</a></li>
      <li>
        <a href="SelectDiaryServlet?dialog_id=${user.user_id}">
          日記
        </a>
      </li>
    </ul>
  </li>

  <li>
    <a href="UpdateStuScoreServlet">成績</a>
    <ul>
      <li>
        <a href="SelectStuScoreServlet?score_id=${user.user_id}">
          得点
        </a>
      </li>
      <li>
        <a href="MTResultServlet">
          心理テスト
        </a>
      </li>
    </ul>
  </li>

  <li>
    <a href="#">報告</a>
    <ul>
      <li><a href="InsertTroubleServlet">事案</a></li>
      <li><a href="SelectMTServlet">心理テスト</a></li>
    </ul>
  </li>

  <li>
    <a href="jsp/Support.jsp">海外支援</a>
  </li>
	</ul>
  </nav>
</aside>


<main>

<h2>心理テスト</h2>

<form action="SelectMTServlet" method="post">

    <c:forEach var="test" items="${todayMTlist}" varStatus="status">

        <div>
            <h3>問題 ${status.count}</h3>

            <p>${test.question}</p>

            <img src="${test.mt_img_url}" alt="心理テスト画像">

            <div>
                <label>
                    <input type="radio"
                           name="score"
                           value="${test.choiceA_score}"
                           required>
                    A. ${test.choiceA_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score"
                           value="${test.choiceB_score}">
                    B. ${test.choiceB_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score"
                           value="${test.choiceC_score}">
                    C. ${test.choiceC_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score"
                           value="${test.choiceD_score}">
                    D. ${test.choiceD_descript}
                </label>
            </div>


            <input type="hidden" name="time" value="3000">

        </div>

        <hr>

    </c:forEach>

    <input type="hidden"
           name="mt_id"
           value="${todayMTlist[0].mt_id}">

    <input type="submit" value="提出">

</form>

</main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>