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

	<!-- 左側サイドナビ -->
	<aside>
		<nav>
			<ul>
				<li><a href="InsertClassesServlet">生徒</a>
					<ul>
						<li><a href="/a3/SelectClassesServlet"> 生徒管理</a></li>
						<li><a href="/a3/SelectClassesServlet"> 点数管理</a></li>
						<li><a href="SelectDiaryServlet?dialog_id=${user.user_id}">
								日記</a></li>
					</ul></li>
				<li><a href="/a3/AddTestsServlet">成績</a>
					<ul>
						<li><a href="/a3/AddTestsServlet">得点</a></li>
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