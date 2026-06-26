<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 心理テスト</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mT.css">
</head>
<body id="index-top">
<header>
		<!-- ここからテンプレート -->
		<div>
			<!-- ロゴ写真 -->
			<span><img alt=""></span>
		</div>

		<c:if test="${empty sessionScope.user}">
			<nav>
				<form action="${pageContext.request.contextPath}/LoginServlet">
					<button type="submit">ログイン</button>
				</form>
			</nav>
		</c:if>

		<c:if test="${not empty sessionScope.user}">
			<nav>
				<button type="button">ようこそ${sessionScope.user.name}さん</button>

				<form action="${pageContext.request.contextPath}/SigninServlet">
					<button type="submit">サインイン（新規作成）</button>
				</form>

				<!--
                    本来ログアウト専用Servletがあるなら
                    LoginServlet ではなく LogoutServlet の方が自然です
                    例：
                    ${pageContext.request.contextPath}/LogoutServlet
                -->

				<form action="${pageContext.request.contextPath}/Forward"
					method="post">
					<input type="hidden" name="page" value="logout">
					<button type="submit">ログアウト</button>
				</form>

			</nav>
		</c:if>
		<!-- テンプレート終了 -->
	</header>

<aside>
		  
		<nav>
			<ul>

				<li><a href="">生徒</a>
					<ul>
						<li><a href="SelectMypageServlet">生徒管理</a></li>
						<li><a href="SelectMypageServlet">点数管理</a></li>
						<li><a
							href="SelectDiaryServlet?dialog_id=${sessionScope.user.user_id}">
								日記 </a></li>
					</ul></li>

				<li><a href="">成績</a>
					<ul>
						<li><a
							href="SelectScoresServlet?score_id=${sessionScope.user.user_id}">
								得点 </a></li>
						<li><a href="MTResultServlet">心理テスト</a></li>
					</ul></li>

				<li><a href="">報告</a>
					<ul>
						<li><a href="InsertTroubleServlet">事案</a></li>
						<li><a href="SelectMTServlet">心理テスト</a></li>
					</ul></li>

				<li><a href="jsp/Support.jsp">海外支援</a></li>

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

            <img src="${test.mt_img_url}"
     		alt="心理テスト画像"
     		class="question-image">

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
           name="mt_id">


    <input type="submit" value="提出">

</form>

</main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>