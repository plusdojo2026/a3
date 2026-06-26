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
	<!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">

    <!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

	<!--コンテンツ-->
	<main class="main">
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

	
	</div>
<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>
