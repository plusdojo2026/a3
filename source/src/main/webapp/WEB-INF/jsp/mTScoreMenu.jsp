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


		<!-- メインコンテンツエリア -->

		<div>
			<h2>${date}心理テスト結果​</h2>
		</div>


		<c:choose>
			<c:when test="${empty scores}">
				<p>生徒はまだテスト完成していないので、当日のテストのデータがありません</p>
			</c:when>
			<c:otherwise>

				<c:forEach var="sc" items="${scores}">
					<c:if test="${sc.user.state==1}">
						<div>
							<div>
								<nav>
									<p>${sc.user.name}</p>
									<input type="hidden" name="user_id_listener"
										value="${sc.user.user_id}">
								</nav>
								<nav>
									<input type="hidden" name="mtScoresId"
										value="${sc.score.mtScoresId}">
									<p>${sc.score.score}​</p>
								</nav>
								<nav>
									<p>${sc.className}​</p>
								</nav>
								<c:if
									test="${sc.score.status=='ALERT' or sc.score.status=='WARNING'}">
									<img src="#">いじめ警戒！
</c:if>
								<nav>
									<a href="SoServlet?user_id_listener=${sc.user.user_id}">
										<button>チャット</button>
									</a>

								</nav>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>


	</main>
	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>