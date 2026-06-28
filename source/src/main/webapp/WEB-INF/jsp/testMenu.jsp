<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>テスト一覧 / 新規作成・削除</title>
  
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

  <!-- ヘッダーエリア -->
  <header>
    <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">

    <!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

<!-- ===== main ===== -->
</div>
</header>

  <!-- メインコンテンツエリア -->
  <main>
    <h2>テスト一覧 / 新規作成・削除</h2>
    <p style="margin-bottom: 20px;">
      <small style="color: #666;">新規作成で件数が増えるため、日付選択は下部へ配置</small>
    </p>

    <!-- 科目選択＆操作カード -->
    <div>
      <p style="font-weight: bold; color: #2aa198; margin-bottom: 15px;">対象科目の選択</p>
      <form method="GET" action="${pageContext.request.contextPath}/SelectScoresServlet">
      <div style="margin-bottom:15px;">
      <label for="selectedSubject">科目</label><br>
      
      <select id="selectedSubject" name="selectedSubject" required>
      <option value="">選択してください</option>
      <c:forEach var="subject" items="${subjectList}">
      <option value="${subject.subjectName}">${subject.subjectName}</option>
      </c:forEach>
      </select>
      </div>
      <div style="margin-bottom:15px;">
      	<label for="testDate">日付</label><br>
      	<select id="testDate" name="test_date">
      	<option value="">すべての日付</option>
      	<c:forEach var="test" items="${testList}">
      	<option value="${test.test_date}">${test.test_date}</option></c:forEach>
      	</select>
      </div>
      
      <div style="display:flex;gap:10px">
      	<button type="submit">点数一覧を表示</button>
      	<a href="${pageContext.request.contextPath}/AddTestsServlet" class="btn-link btn-link-submit">新規作成</a>
      </div>
      </form>
      </div>
      
    
  </main>


<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
