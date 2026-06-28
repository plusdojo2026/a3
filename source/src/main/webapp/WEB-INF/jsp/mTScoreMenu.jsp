<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>心理テスト結果一覧</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

<style>
.result-card {
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 15px;
    margin: 15px 0;
    background-color: #f9f9f9;
}

.name {
    font-weight: bold;
    font-size: 18px;
}

.score {
    font-size: 16px;
}

.alert { color: red; font-weight:bold; }
.warning { color: orange; font-weight:bold; }
.observe { color: blue; }
.normal { color: green; }

.memo {
    white-space: pre-line;
    background-color: #fff;
    padding: 10px;
    border-radius: 5px;
}
</style>

</head>

<body>

<!-- ヘッダー -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<div class="layout">

<!-- サイドバー -->
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

<main class="main">

<h2>${date} の心理テスト結果</h2>

<c:choose>

    <c:when test="${empty scores}">
        <p>生徒はまだテストを完成していません。</p>
    </c:when>

    <c:otherwise>

        <c:forEach var="sc" items="${scores}">
            <c:if test="${sc.user.state == 1}">

                <div class="result-card">

                    <p class="name">👤 ${sc.user.name}</p>

                    ${sc.user.image_url}

                    <p>📚 クラス: ${sc.className}</p>

                    <p>📅 日付: ${sc.score.testDate}</p>

                    <p class="score">📊 スコア: ${sc.score.score} 点</p>

                    <c:choose>
                        <c:when test="${sc.score.status == 'ALERT'}">
                            <p class="alert">⚠ ALERT（要注意）</p>
                        </c:when>
                        <c:when test="${sc.score.status == 'WARNING'}">
                            <p class="warning">⚠ WARNING（注意）</p>
                        </c:when>
                        <c:when test="${sc.score.status == 'OBSERVE'}">
                            <p class="observe">OBSERVE（観察）</p>
                        </c:when>
                        <c:otherwise>
                            <p class="normal">NORMAL（正常）</p>
                        </c:otherwise>
                    </c:choose>

                    <div class="memo">
                        ${sc.score.mtScoresMemo}
                    </div>

                    <c:if test="${sc.score.status == 'ALERT' or sc.score.status == 'WARNING'}">
                        <p class="alert">🚨 いじめ警戒！対応必要</p>
                    </c:if>

                    <a href="SoServlet?user_id_listener=${sc.user.user_id}">
                        <button>チャット</button>
                    </a>

                </div>

            </c:if>
        </c:forEach>

    </c:otherwise>

</c:choose>

</main>
</div>

<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>