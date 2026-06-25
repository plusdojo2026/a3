<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Get:MTResultServlet -->
<!-- Post:mTScoreMenu -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>心理テスト一覧</title>
</head>

<body>

	<!-- ヘッダーエリア、bodyの下に置いてください -->
	<header>
		<div>
			<span><img></span>

		</div>
		<nav>
			<button type="button">ログイン</button>
		</nav>
		<nav style="display: none;">
			<button type="button">新アカウント作成（サインイン）</button>
			<button type="button">ようこそxxxさん</button>
			<button type="button">ログアウト</button>
		</nav>
	</header>

	<!-- 左側サイドナビ -->
	<aside>
		<nav>
			<ul>
				<li><a href="#">生徒</a></li>
				<ul>
					<li><a href="#"> 生徒管理</a></li>
					<li><a href="#"> 点数管理</a></li>
					<li><a href="#"> 日記</a></li>
				</ul>

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
		<!-- メインコンテンツエリア -->
		<div>
			<p>心理テスト一覧​</p>
		</div>
		<!-- MTResultに行く。foreachで結果を表示する -->
		<div>
			<form action="MTResultServlet" method="post">
				<c:forEach var="date" items="${dateSet}">
					<div>
						<button name="date" value="${date}">${date}心理テスト</button>
					</div>
				</c:forEach>
			</form>
		</div>
	</main>
	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>