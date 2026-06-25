<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Class Care - 点数一覧表</title>
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
	</header>

	<aside>
		<nav>
			<ul>
				<li><a href="#">生徒</a></li>
				<li><a href="#">成績</a></li>
				<li><a href="#">報告</a></li>
				<li><a href="#">海外支援</a></li>
			</ul>
		</nav>
	</aside>
	<c:if test="${empty param.test_id}">
		<c:redirect url="SelectScoresServlet" />
	</c:if>


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
					<input type="hidden" name="test_id" value="${s.scores}">


					<p>${s.username}</p>
					<p>${s.scores}</p>
					<p>${s.classname}</p>

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
