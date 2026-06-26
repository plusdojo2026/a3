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
	href="${pageContext.request.contextPath}/css/testMenu.css">
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
        <h2>テスト一覧 / 新規作成・削除</h2>
    </div>

    <div class="subjects-frame">
        <nav>
            <ul class="subjects">
                <li><a href="${pageContext.request.contextPath}/SelectSubjectsServlet?selectedSubject=数学">数学</a></li>
                <li><a href="${pageContext.request.contextPath}/SelectSubjectsServlet?selectedSubject=国語">国語</a></li>
                <li><a href="${pageContext.request.contextPath}/SelectSubjectsServlet?selectedSubject=英語">英語</a></li>
            </ul>

            <!-- 科目作成 -->
            <a href="${pageContext.request.contextPath}/InsertSubjectsServlet">科目作成</a>

            <table>
                <c:forEach var="subject" items="${subjectList}">
                    <tr>
                        <td>${subject.subject_name}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/DeleteSubjectsServlet" method="post" style="display:inline;">
                                <input type="hidden" name="subject_id" value="${subject.subject_id}">
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
            <!-- 新規作成 -->
            <button type="button"
                onclick="location.href='${pageContext.request.contextPath}/AddTestsServlet'">
                新規作成
            </button>

            <!-- テスト削除（必要なら後で実装） -->
            <form method="GET" action="${pageContext.request.contextPath}/DeleteTestsServlet" style="display:inline;">
                <input type="submit" value="削除">
            </form>
        </div>

        <!-- 日付選択 -->
        <div>
            <a href="${pageContext.request.contextPath}/SelectScoresServlet?test_date=2021-01-01">2021年1回目</a>
            <a href="${pageContext.request.contextPath}/SelectScoresServlet?test_date=2021-02-01">2021年2回目</a>
            <a href="${pageContext.request.contextPath}/SelectScoresServlet?test_date=2021-03-01">2021年3回目</a>
            <a href="${pageContext.request.contextPath}/SelectScoresServlet?test_date=2021-04-01">2021年4回目</a>
            <br>

            <!-- 編集 -->
            <a href="${pageContext.request.contextPath}/ScoreEditServlet">編集</a>

            <!-- 確認 -->
            <a href="${pageContext.request.contextPath}/SelectScoresServlet">確認</a>
        </div>
    </div>
</main>

	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>