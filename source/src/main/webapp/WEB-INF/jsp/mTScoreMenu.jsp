<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>海外支援</title>
</head>

<body>

	<!-- ヘッダーエリア、bodyの下に置いてください -->
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


		<!-- メインコンテンツエリア -->
		
		<div>
			<h2>${date}心理テスト結果​</h2>
		</div>
		<c:forEach var="sc" items="${scores}">
		<c:if test="${sc.user.state==1}">
			<div>
				<div>
					<nav>
						<p>${sc.user.name}</p>
						<input type="hidden" name="user_id_listener" value="${sc.user.user_id}">
					</nav>
					<nav>
					<input type="hidden" name="mtScoresId" value="${sc.score.mtScoresId}">
						<p>${sc.score.score}​</p>
					</nav>
					<nav>
						<p>${sc.className}​</p>
					</nav>
					<c:if test="${sc.score.status=='ALERT' or sc.score.status=='WARNING'}">
					<img src="#"  >いじめ警戒！
					</c:if>
					<nav>
						<button type="button">チャット</button>
					</nav>
				</div>
			</div>
			</c:if>
		</c:forEach>
	</main>
	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>