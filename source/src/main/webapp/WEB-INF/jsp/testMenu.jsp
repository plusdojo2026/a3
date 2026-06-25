<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="jp">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>テスト一覧 / 新規作成・削除​</title>
</head>

<body>
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

	<!-- ここからの編集 -->
	<!-- タイトル -->
	<main>
		<h2>テスト一覧/新規作成・削除</h2>
		<p>
			<small>新規作成で件数が増えるため、日付選択は下部へ配置</small>
		</p>

		<!-- 科目の選択 -->
		<div class="area-box">
			<form
				action="${pageContext.request.contextPath}/SelectSubjectsServlet"
				method="GET">
				<button type="submit" name="subject" value="math">数学</button>
				<button type="submit" name="subject" value="english">英語</button>
				<button type="submit" name="subject" value="science">理科</button>
			</form>

			<!-- 科目の作成・削除のボタン -->
			<button type="button">科目作成</button>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/DeleteSubjectsServlet'">削除</button>
		</div>
		<!-- 日付の一覧 -->
		<div class="area-box">
			<h3>日付選択</h3>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/AddTestsServlet'">
				新規作成</button>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/SelectScoresServlet'">
				確認</button>
			<ul>
				<li><button type="button"
						onclick="location.href='${pageContext.request.contextPath}/SelectScoresServlet?date=2021-1'">2021年1回目</button></li>
				<li><button type="button"
						onclick="location.href='${pageContext.request.contextPath}/SelectScoresServlet?date=2021-2'">2021年2回目</button></li>
				<li><button type="button"
						onclick="location.href='${pageContext.request.contextPath}/SelectScoresServlet?date=2021-3'">2021年3回目</button></li>
				<li><button type="button"
						onclick="location.href='${pageContext.request.contextPath}/SelectScoresServlet?date=2021-4'">2021年4回目</button></li>
			</ul>
			<button type="button">編集</button>
		</div>
	</main>




	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>