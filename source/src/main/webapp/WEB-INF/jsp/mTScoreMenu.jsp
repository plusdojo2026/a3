<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>心理テスト一覧</title>
</head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<body>

<!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">
  
    <!-- ===== sidebar ===== -->
 
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

    <!-- ===== main ===== -->
   <main class="main">
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
</div>

<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>