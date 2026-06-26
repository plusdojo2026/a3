<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/.css">
<title>Class Care - 成績管理</title>
</head>
<!-- ヘッダーエリア、bodyの下に置いてください -->

<body>
	<!--ヘッダー-->
	<header>
		<div>
			<span><img></span>

		</div>
		<nav>
			<button type="button">ログイン</button>
			<button type="button">サインイン</button>
		</nav>
		<nav style="display: none;">
			<button type="button">ようこそxxxさん</button>
			<button type="button">ログアウト</button>
		</nav>
	</header>





	<!-- 左側サイドナビ -->
	<aside>
		<nav>
			<ul>
				<li><a href="#">生徒</a>
					<ul>
						<li><a href="#"> 生徒管理</a></li>
						<li><a href="#"> 点数管理</a></li>
						<li><a href="#"> 日記</a></li>
					</ul></li>
				<li><a href="#">成績</a></li>
				<ul>
					<li><a href="#">得点</a></li>
					<li><a href="#">心理テスト</a></li>
				</ul>
				<li><a href="">報告</a></li>
				<ul>
					<li><a href="#">事案</a></li>
					<li><a href="#">心理テスト</a></li>
				</ul>
				<li><a href="#">海外支援</a></li>
			</ul>
		</nav>
	</aside>
	


	<main>
		<div>
			<h2>2021年1回目 / 点数一覧</h2>
		</div>

		<div class="area-box">

			<input type="button" value="戻る"
				onclick="location.href='${pageContext.request.contextPath}/testMenu.jsp'">

			<!-- 点数一覧 -->
			<c:forEach var="s" items="${resultList}">

				<form
					action="${pageContext.request.contextPath}/UpdateScoresServlet"
					method="GET">
					<input type="hidden" name="test_id" value="${s.test_id}">


					<p>${s.username}</p>
					<p>${s.scores}</p>
					<p>${s.classname}</p>
			<form action="${pageContext.request.contextPath}/ScoreEditServlet" method="get">
            <input type="hidden" name="test_id" value="${s.test_id}">
            <input type="submit" value="編集">
        </form>
			</c:forEach>
		</div>
	</main>

	<footer>
		<p>虎視眈々(株)</p>
	</footer>

</body>
</html>
