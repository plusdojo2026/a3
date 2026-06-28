<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h2>テスト一覧 / 新規作成・削除</h2>
			</div>

			<div class="subjects-frame">
				<nav>
					<ul class="subjects">
						<li><a
							href="${pageContext.request.contextPath}/SelectSubjectServlet?selectedSubject=数学">数学</a></li>
						<li><a
							href="${pageContext.request.contextPath}/SelectSubjectServlet?selectedSubject=国語">国語</a></li>
						<li><a
							href="${pageContext.request.contextPath}/SelectSubjectServlet?selectedSubject=英語">英語</a></li>
					</ul>


					<!-- 科目作成ボタン -->
					<form method="get"
						action="${pageContext.request.contextPath}/SelectSubjectServlet">
						<button type="submit" name="showForm" value="true">科目作成</button>
					</form>

					<%
					boolean showForm = "true".equals(request.getParameter("showForm"));
					%>

					<!-- 科目作成フォーム（showForm=true のときだけ表示） -->
					<%
					if (showForm) {
					%>
					<form
						action="${pageContext.request.contextPath}/InsertSubjectsServlet"
						method="post">
						科目名：<input type="text" name="subject_name"> <input
							type="submit" value="登録">
					</form>
					<%
					}
					%>



					<table>
						<c:forEach var="subject" items="${subjectList}">
							<tr>
								<td>${subject.subject_name}</td>
								<td>
									<form
										action="${pageContext.request.contextPath}/DeleteSubjectsServlet"
										method="post" style="display: inline;">
										<input type="hidden" name="subject_id"
											value="${subject.subject_id}">
										<button type="submit">削除</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</nav>
			</div>

			<div class="tests-date">
				<div>
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/AddTestsServlet'">
						新規作成</button>

					<form action="${pageContext.request.contextPath}/DeleteSubjectsServlet"
						method="post">
						<input type="hidden" name="scoreId" value="${subjects_id}">
						<button type="submit" class="btn-delete">削除</button>
					</form>

				</div>

				<div>
					<a href="${pageContext.request.contextPath}/SelectScoresServlet">2021年1回目</a>
					<a href="${pageContext.request.contextPath}/SelectScoresServlet">2021年2回目</a>
					<a href="${pageContext.request.contextPath}/SelectScoresServlet">2021年3回目</a>
					<a href="${pageContext.request.contextPath}/SelectScoresServlet">2021年4回目</a>
					<br> <a
						href="${pageContext.request.contextPath}/SelectScoresServlet">編集</a>
					<a href="${pageContext.request.contextPath}/SelectScoresServlet">確認</a>
				</div>
			</div>
		</main>




	</div>
	<!-- ===== footer ===== -->
	<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

</body>

</html>