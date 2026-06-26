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
    <div>
        <p>事案報告</p>

        <form action="SelectMypageServlet" method="post">

            <label>件名</label>
            <input type="text" name="title"><br>

            <label>事案内容</label><br>
            <textarea name="contents"></textarea><br>

            <label>関係者</label>
            <input type="text" name="user_id"><br>

            <input type="submit" value="保存">

        </form>
    </div>
</main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>

</html>