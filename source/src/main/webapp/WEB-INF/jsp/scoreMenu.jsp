
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<title>Class Care - 成績管理</title>
</head>
<!-- ヘッダーエリア、bodyの下に置いてください -->

<body>
	<!-- ===== header ===== -->
	<jsp:include page="/WEB-INF/jsp/common/header.jsp" />
	<!-- ===== layout ===== -->
	<div class="layout">

		<!-- ===== sidebar ===== -->

		<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp" />

		<!--コンテンツ-->
		<main class="main">
			<div>
				<h2>点数一覧</h2>
			</div>

			<div class="area-box" style="display:flex;gap:10px">
    <button type="button"
            onclick="location.href='${pageContext.request.contextPath}/SelectSubjectServlet'"
            class="btn-link btn-link-submit">戻る
    </button>
				<c:forEach var="s" items="${resultList}">
					<div class="list-row">
						<p>名前:${s.username}</p>
						<p>点数:${s.scores}</p>
						<p>クラス:${s.classname}</p>
					</div>
					</c:forEach>
			</div>
		</main>


	</div>
	<!-- ===== footer ===== -->
	<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

</body>
</html>
