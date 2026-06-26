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


	<!--コンテンツ-->

	<main>
		<div>
			<h2>新規作成</h2>
		</div>

		<div class="area-box">
			<form action="${pageContext.request.contextPath}/UpdateTestsServlet" method="POST">
				<label>日付</label>
				<input type="text" name="test_date" placeholder="1月1日"> 
				<label>科目名</label>
				<input type="text" name="selectedSubject" placeholder="数学">
				<!--保存ボタンエリア-->
				<div>
					<img src="" alt=""> <input type="submit" value="保存">
				</div>
			</form>
		</div>
	</main>
	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>